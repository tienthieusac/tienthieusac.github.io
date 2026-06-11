#!/usr/bin/env bash
# Crawl the raw-English TWEM (This World Easy Mode) light novel from
# shintranslations.com and save every chapter as Hugo-friendly Markdown.
#
# This is a *generic* crawler: it auto-discovers every volume, chapter,
# part, side-story and short story by parsing the site's Table of
# Contents page. Run it once and you get the entire series.
#
# The live site is behind a Cloudflare bot challenge, so every fetch
# goes through the Wayback Machine (web.archive.org). The crawler auto-
# discovers the latest TOC snapshot via the CDX API, then uses that
# timestamp to fetch each chapter. The HTML is then run through
# [defuddle] for clean Markdown conversion.
#
# Usage:
#   scripts/crawl-twem.sh                          # crawl everything
#   scripts/crawl-twem.sh --volumes 1,3            # only vol 1 and 3
#   scripts/crawl-twem.sh --volumes all            # explicit "all"
#   scripts/crawl-twem.sh --output <dir>           # where to write files
#   scripts/crawl-twem.sh --dry-run                # list pages, no fetch
#   scripts/crawl-twem.sh --refresh                # ignore caches
#   scripts/crawl-twem.sh --help
#
# Environment:
#   WAYBACK_HOST      Wayback prefix to use when CDX is unavailable
#                     (default: 20241224041001 snapshot, which has
#                     a full TOC; the script will also try the CDX API
#                     to upgrade to the latest snapshot).
#   CRAWLER_DIR       Where to install defuddle and store the cache
#                     (default: .tmp-twem-crawler/).
#
# Output layout (default: content/docs/twem-en/):
#   _index.md
#   volume-1/_index.md
#   volume-1/chapter-1.md ... chapter-18.md
#   volume-1/side-story-digital-version.md
#   volume-1/side-story-part-1.md ... part-3.md
#   volume-2/_index.md
#   volume-2/chapter-1.md ... chapter-19.md
#   volume-2/chapter-14-5.md
#   volume-2/short-story.md
#   ...etc for all volumes
#
# Multi-part chapters (e.g. twem-vol-3-chapter-6-part-1) become one .md
# per part, so readers see the natural source split.
#
# Requirements: node >= 18, npm, curl (defuddle + node are installed
# automatically on first run into $CRAWLER_DIR).
#
# State:
#   * $CRAWLER_DIR/cache.json  — slug -> defuddle JSON cache, reused
#     on re-runs. Pass --refresh to bypass.
#   * $CRAWLER_DIR/toc.html    — the parsed TOC HTML, reused on re-runs.
#   * $CRAWLER_DIR/toc.ts      — the resolved TOC timestamp.
#
# [defuddle]: https://github.com/kepano/defuddle

set -euo pipefail

# ---------- defaults / args ----------
OUTPUT_DIR="content/docs/twem-en"
VOLUMES_FILTER="all"
DRY_RUN=0
REFRESH=0
WAYBACK_HOST="${WAYBACK_HOST:-https://web.archive.org/web/20241224041001/}"
WAYBACK_CDX_URL="https://web.archive.org/cdx/search/cdx"
SOURCE_DOMAIN="https://shintranslations.com"
TOC_PATH="/twem-toc/"
CRAWLER_DIR="${CRAWLER_DIR:-.tmp-twem-crawler}"
DEFUDDLE="$CRAWLER_DIR/node_modules/.bin/defuddle"

while [ $# -gt 0 ]; do
  case "$1" in
    --output)     OUTPUT_DIR="$2"; shift 2 ;;
    --output=*)   OUTPUT_DIR="${1#*=}"; shift ;;
    --volumes)    VOLUMES_FILTER="$2"; shift 2 ;;
    --volumes=*)  VOLUMES_FILTER="${1#*=}"; shift ;;
    --dry-run)    DRY_RUN=1; shift ;;
    --refresh)    REFRESH=1; shift ;;
    --help|-h)
      sed -n '2,60p' "$0"
      exit 0
      ;;
    *)
      echo "unknown arg: $1" >&2
      exit 2
      ;;
  esac
done

# ---------- helpers ----------
log()  { printf '>> %s\n' "$*" >&2; }
warn() { printf '!! %s\n' "$*" >&2; }

# slug -> volume number ("1", "2", ...). Empty for non-volume pages.
volume_of() {
  case "$1" in
    twem-vol-*-*)
      local rest="${1#twem-vol-}"
      printf '%s' "${rest%%-*}"
      ;;
    *) printf '' ;;
  esac
}

# slug -> relative output path under OUTPUT_DIR (no leading ./).
#   twem-vol-1-chapter-2                -> volume-1/chapter-2
#   twem-vol-3-chapter-6-part-1         -> volume-3/chapter-6-part-1
#   twem-vol-1-side-story-part-2        -> volume-1/side-story-part-2
#   twem-vol-1-side-story-digital-version -> volume-1/side-story-digital-version
#   twem-vol-2-short-story              -> volume-2/short-story
#   twem-vol-2-chapter-14-5             -> volume-2/chapter-14-5
relpath_of() {
  local s="$1"
  # Extract volume number and the rest of the slug.
  local vol rest
  vol="${s#twem-vol-}"
  vol="${vol%%-*}"
  rest="${s#twem-vol-*-}"
  printf 'volume-%s/%s' "$vol" "$rest"
}

# Stable weight: prefer the leading "chapter-N[.M][-part-P]" pattern;
# fall back to a hash-based weight so side stories / shorts sort
# after the main chapters.
weight_of() {
  local s="$1"
  # twem-vol-N-chapter-14-5  -> 14.5
  if [[ "$s" =~ chapter-([0-9]+)-([0-9]+)(-part-[12])?$ ]]; then
    printf '%d.%d' "${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}"
    return
  fi
  # twem-vol-N-chapter-6-part-1  ->  6.1
  if [[ "$s" =~ chapter-([0-9]+)(-part-[12])?$ ]]; then
    case "$s" in
      *-part-1) printf '%d.1' "${BASH_REMATCH[1]}" ;;
      *-part-2) printf '%d.2' "${BASH_REMATCH[1]}" ;;
      *)        printf '%d'   "${BASH_REMATCH[1]}" ;;
    esac
    return
  fi
  # side / short stories: weight 1000 + a hash of the slug so they
  # sort after the main chapters and don't collide with each other.
  local h
  h=$(printf '%s' "$s" | cksum | awk '{print $1}')
  printf '1000.%03d' "$((h % 1000))"
}

# Pretty title for the index listing / Hugo title fallback.
# Uses the link label from the TOC when available, otherwise derives
# a label from the slug.
label_of() {
  local slug="$1" toc_label="$2"
  if [ -n "$toc_label" ]; then
    printf '%s' "$toc_label"
    return
  fi
  case "$slug" in
    twem-vol-*-chapter-*-part-1) printf 'Part 1' ;;
    twem-vol-*-chapter-*-part-2) printf 'Part 2' ;;
    twem-vol-*-chapter-*-5)      printf 'Chapter %s' "${slug##*-chapter-}" ;;
    twem-vol-*-chapter-*)        printf 'Chapter %s' "${slug##*-chapter-}" ;;
    twem-vol-*-side-story-*)     printf 'Side Story' ;;
    twem-vol-*-short-story)      printf 'Short Story' ;;
    *) printf '%s' "$slug" ;;
  esac
}

# ---------- setup ----------
ensure_defuddle() {
  if [ -x "$DEFUDDLE" ]; then
    return
  fi
  log "installing defuddle into $CRAWLER_DIR (one-time)"
  mkdir -p "$CRAWLER_DIR"
  ( cd "$CRAWLER_DIR" && npm init -y >/dev/null && npm install defuddle >/dev/null )
}

# ---------- TOC discovery ----------
# Try to auto-discover the latest Wayback snapshot timestamp for the
# TOC via the CDX API. If that fails (e.g. CDX blocked from this
# network), fall back to the timestamp baked into $WAYBACK_HOST.
# Caches the resolved timestamp in $CRAWLER_DIR/toc.ts so re-runs skip
# the CDX lookup.
discover_toc_timestamp() {
  local ts_file="$CRAWLER_DIR/toc.ts"
  if [ -s "$ts_file" ] && [ "$REFRESH" -eq 0 ]; then
    cat "$ts_file"
    return
  fi
  log "discovering latest TOC snapshot via CDX"
  local cdx
  cdx="$(curl -fsSL --max-time 20 \
    "${WAYBACK_CDX_URL}?url=shintranslations.com${TOC_PATH}&limit=-1&filter=statuscode:200&output=json" \
    2>/dev/null \
    | node -e '
        let s=""; process.stdin.on("data",d=>s+=d).on("end",()=>{
          try {
            const rows = JSON.parse(s);
            if (rows.length < 2) process.stdout.write("");
            else process.stdout.write(rows[rows.length - 1][1]);
          } catch { process.stdout.write(""); }
        });
      ')" || cdx=""
  if [ -z "$cdx" ]; then
    warn "CDX lookup failed; falling back to $WAYBACK_HOST"
    # Extract a 14-digit timestamp if WAYBACK_HOST has one, else
    # signal "use lenient prefix".
    if [[ "$WAYBACK_HOST" =~ /web/([0-9]{14})/ ]]; then
      cdx="${BASH_REMATCH[1]}"
    else
      cdx="__lenient__"
    fi
  fi
  printf '%s' "$cdx" > "$ts_file"
  printf '%s' "$cdx"
}

# Read the TOC HTML (via defuddle) into $CRAWLER_DIR/toc.html.
fetch_toc() {
  local out="$CRAWLER_DIR/toc.html"
  if [ -s "$out" ] && [ "$REFRESH" -eq 0 ]; then
    return
  fi
  local ts
  ts="$(discover_toc_timestamp)"
  local url
  if [ "$ts" = "__lenient__" ]; then
    url="${WAYBACK_HOST}${SOURCE_DOMAIN}${TOC_PATH}"
  else
    url="https://web.archive.org/web/${ts}/${SOURCE_DOMAIN}${TOC_PATH}"
  fi
  log "fetching TOC: $url"
  "$DEFUDDLE" parse "$url" --json \
    | node -e '
        let s=""; process.stdin.on("data",d=>s+=d).on("end",()=>{
          try { const j=JSON.parse(s); process.stdout.write(j.content || ""); }
          catch { process.stdout.write(""); }
        });
      ' > "$out"
  if [ ! -s "$out" ]; then
    warn "TOC fetch returned empty body"
  fi
}

# Parse $CRAWLER_DIR/toc.html into "slug\tlabel" lines on stdout.
parse_toc() {
  node -e '
    const fs = require("fs");
    const html = fs.readFileSync(process.argv[1], "utf8");
    // Match anchors that point (directly or via a Wayback prefix) at
    // a /twem-... URL on shintranslations.com. Capture just the slug
    // path (without the Wayback prefix or trailing slash).
    const re = /<a[^>]+href="https?:\/\/(?:web\.archive\.org\/web\/\d+\/)?https?:\/\/shintranslations\.com\/(twem-[^"#?\s\/]+)\/?(?:#[^"]*)?"[^>]*>([\s\S]*?)<\/a>/g;
    const seen = new Set();
    const out = [];
    let m;
    while ((m = re.exec(html)) !== null) {
      const slug = m[1];
      if (seen.has(slug)) continue;
      seen.add(slug);
      const text = m[2].replace(/<[^>]+>/g, "").replace(/\s+/g, " ").trim();
      if (text) out.push(slug + "\t" + text);
    }
    process.stdout.write(out.join("\n") + "\n");
  ' "$CRAWLER_DIR/toc.html"
}

# ---------- chapter fetch (with cache) ----------
CACHE_FILE="$CRAWLER_DIR/cache.json"

# Print cache file as a node -e expression. Loads JSON, writes "" on error.
load_cache() {
  if [ -s "$CACHE_FILE" ]; then
    cat "$CACHE_FILE"
  else
    printf '{}'
  fi
}

# Save a slug -> JSON mapping into the cache.
save_cache_entry() {
  local slug="$1" json="$2"
  node -e '
    const fs = require("fs");
    const file = process.argv[1];
    const slug = process.argv[2];
    const incoming = process.argv[3];
    let cache = {};
    try { cache = JSON.parse(fs.readFileSync(file, "utf8")); } catch {}
    cache[slug] = JSON.parse(incoming);
    fs.writeFileSync(file, JSON.stringify(cache));
  ' "$CACHE_FILE" "$slug" "$json"
}

# fetch_json <slug>  -> emits the defuddle JSON on stdout.
# Uses cache unless --refresh is set.
fetch_json() {
  local slug="$1"
  local url
  if [[ "$WAYBACK_HOST" =~ /web/([0-9]{14})/ ]]; then
    url="https://web.archive.org/web/${BASH_REMATCH[1]}/${SOURCE_DOMAIN}/${slug}/"
  else
    url="${WAYBACK_HOST}${SOURCE_DOMAIN}/${slug}/"
  fi
  local json="" attempt err

  if [ "$REFRESH" -eq 0 ] && [ -s "$CACHE_FILE" ]; then
    json="$(
      node -e '
        const fs = require("fs");
        try {
          const c = JSON.parse(fs.readFileSync(process.argv[1], "utf8"));
          process.stdout.write(c[process.argv[2]] ? JSON.stringify(c[process.argv[2]]) : "");
        } catch { process.stdout.write(""); }
      ' "$CACHE_FILE" "$slug"
    )"
    if [ -n "$json" ]; then
      printf '%s' "$json"
      return 0
    fi
  fi

  for attempt in 1 2 3 4 5 6 7 8; do
    if json="$(
      "$DEFUDDLE" parse "$url" --json 2>/dev/null \
        | node -e '
            let s=""; process.stdin.on("data",d=>s+=d).on("end",()=>{
              try {
                const j=JSON.parse(s);
                // Strip our source-domain URLs from any string value.
                const strip = v => typeof v === "string"
                  ? v.replace(new RegExp(process.argv[1].replace(/[/]/g, "\\/"), "g"), "")
                  : v;
                const walk = obj => {
                  if (Array.isArray(obj)) return obj.map(walk);
                  if (obj && typeof obj === "object") {
                    for (const k of Object.keys(obj)) obj[k] = walk(obj[k]);
                  }
                  return strip(obj);
                };
                process.stdout.write(JSON.stringify(walk(j)));
              } catch (e) { process.stdout.write(""); }
            });
          ' "$SOURCE_DOMAIN"
    )"; then
      if [ -n "$json" ] && [ "${json:0:1}" = "{" ]; then
        save_cache_entry "$slug" "$json" || true
        printf '%s' "$json"
        return 0
      fi
    fi
    log "retry $attempt for $slug"
    sleep $((attempt * 2))
  done
  return 1
}

# ---------- per-chapter writer ----------
# write_chapter <slug> <toc_label>
write_chapter() {
  local slug="$1" toc_label="$2"
  local vol
  vol="$(volume_of "$slug")"
  if [ -z "$vol" ]; then
    warn "skipping non-volume slug: $slug"
    return 0
  fi
  local rel weight label out
  rel="$(relpath_of "$slug")"
  weight="$(weight_of "$slug")"
  label="$(label_of "$slug" "$toc_label")"
  out="$OUTPUT_DIR/${rel}.md"

  echo ">> [$slug] -> $out"
  if [ "$DRY_RUN" -eq 1 ]; then
    return 0
  fi

  mkdir -p "$(dirname "$out")"

  local json body_md body_title
  if ! json="$(fetch_json "$slug")"; then
    warn "failed to fetch $slug after retries; writing stub"
    write_stub "$slug" "$weight" "$vol" "$out"
    return 1
  fi

  body_md="$(
    printf '%s' "$json" | node -e '
      let s=""; process.stdin.on("data",d=>s+=d).on("end",()=>{
        try { const j=JSON.parse(s); process.stdout.write(j.contentMarkdown || j.content || ""); }
        catch { process.stdout.write(""); }
      });
    '
  )"

  # Defuddle emits the chapter title either as a markdown heading
  # ("# Chapter N – ...") or as a standalone bold line
  # ("**Chapter N – ...**"). Pick the first match.
  body_title="$(
    printf '%s\n' "$body_md" | awk '
      /^#[[:space:]]/   { sub(/^#[[:space:]]+/, ""); print; exit }
      /^##[[:space:]]/  { sub(/^##[[:space:]]+/, ""); print; exit }
      /^\*\*[^*]+\*\*[[:space:]]*$/ {
        match($0, /\*\*([^*]+)\*\*/);
        print substr($0, RSTART+2, RLENGTH-4);
        exit
      }
    '
  )"
  local title="$body_title"
  if [ -z "$title" ]; then
    case "$slug" in
      twem-vol-*-chapter-*-part-1) title="Chapter ${slug#*-chapter-} (Part 1)" ;;
      twem-vol-*-chapter-*-part-2) title="Chapter ${slug#*-chapter-} (Part 2)" ;;
      twem-vol-*-chapter-*)        title="Chapter ${slug##*-chapter-}" ;;
      twem-vol-*-side-story-*)     title="Side Story – ${slug##*-side-story-}" ;;
      twem-vol-*-short-story)      title="Short Story" ;;
      *)                           title="$label" ;;
    esac
  fi

  # Strip a leading title-line + blank line so we don't duplicate the
  # title we inject via frontmatter + H1.
  body_md="$(
    printf '%s\n' "$body_md" | awk '
      BEGIN { t_seen = 0; b_seen = 0 }
      t_seen == 0 {
        if (/^#[[:space:]]/ || /^\*\*[^*]+\*\*[[:space:]]*$/) {
          t_seen = 1
          next
        }
      }
      t_seen == 1 && b_seen == 0 {
        if (/^[[:space:]]*$/) { b_seen = 1; next }
        b_seen = 1
      }
      { print }
    '
  )"

  {
    printf -- '---\n'
    printf 'title: "%s"\n' "$title"
    printf 'weight: %s\n' "$weight"
    printf 'volume: %s\n' "$vol"
    printf 'source: %s/%s/\n' "$SOURCE_DOMAIN" "$slug"
    printf -- '---\n\n'
    printf '# %s\n\n' "$title"
    printf '%s\n' "$body_md"
  } > "$out"
}

# write_stub <slug> <weight> <vol> <out-path>
# Emit a placeholder Markdown file explaining that the source page
# is not yet available on the Wayback Machine, so the section index
# stays complete. Re-runs will overwrite this if the page later
# becomes available.
write_stub() {
  local slug="$1" weight="$2" vol="$3" out="$4"
  local title
  case "$slug" in
    twem-vol-*-chapter-*-part-1) title="Chapter ${slug#*-chapter-} (Part 1)" ;;
    twem-vol-*-chapter-*-part-2) title="Chapter ${slug#*-chapter-} (Part 2)" ;;
    twem-vol-*-chapter-*)        title="Chapter ${slug##*-chapter-}" ;;
    twem-vol-*-side-story-*)     title="Side Story – ${slug##*-side-story-}" ;;
    twem-vol-*-short-story)      title="Short Story" ;;
    *)                           title="$slug" ;;
  esac
  cat > "$out" <<EOF
---
title: "$title"
weight: $weight
volume: $vol
source: ${SOURCE_DOMAIN}/$slug/
status: "unavailable"
---

# $title

> **This chapter is not yet available in the Wayback Machine archive.**
>
> Source: <${SOURCE_DOMAIN}/$slug/>.
> The crawler was run before Wayback had captured this page. Re-run
> the crawler later, or check the source URL directly.
EOF
}

# ---------- volume index writer ----------
# write_volume_index <vol-number>
write_volume_index() {
  local v="$1"
  local out="$OUTPUT_DIR/volume-$v/_index.md"
  mkdir -p "$(dirname "$out")"
  # Compute a relative link to the Vietnamese translation by counting
  # how many ".." hops separate $OUTPUT_DIR from content/docs/twem.
  # Default OUTPUT_DIR is "content/docs/twem-en" -> 2 hops up to
  # content/, then into docs/twem/volume-N/.
  local hops=""
  case "$OUTPUT_DIR" in
    content/docs/twem-en) hops="../.." ;;
    content/docs/*/twem-en) hops="../.." ;;
    content/docs/twem-en/*) hops=".." ;;
    /*) hops="" ;;   # absolute path: emit a site-root-relative link
    *) hops=".." ;;   # default: one level up
  esac
  local vi_link
  if [ -n "$hops" ]; then
    vi_link="${hops}/twem/volume-$v/"
  else
    vi_link="/twem/volume-$v/"
  fi
  cat > "$out" <<EOF
---
title: Volume $v (Raw English)
bookCollapseSection: true
---

# Volume $v – Raw English

Raw-English chapters crawled from
[shintranslations.com](https://shintranslations.com/twem-toc/).
This is the unedited English text; for the Vietnamese translation see
[Tập $v]($vi_link).
EOF
}

# ---------- main ----------
ensure_defuddle
mkdir -p "$CRAWLER_DIR" "$OUTPUT_DIR"
fetch_toc

# Series-level index.
vi_top_link="../twem/"
case "$OUTPUT_DIR" in
  content/docs/twem-en) vi_top_link="../twem/" ;;
  content/docs/*/twem-en) vi_top_link="../twem/" ;;
  content/docs/twem-en/*) vi_top_link="../twem/" ;;
  /*) vi_top_link="/twem/" ;;
  *) vi_top_link="../twem/" ;;
esac
cat > "$OUTPUT_DIR/_index.md" <<EOF
---
title: TWEM (Raw English)
bookCollapseSection: true
---

# TWEM – Raw English

Every chapter of *The World's Finest Assassin Gets Reincarnated in
Another World as an Aristocrat* (light novel) crawled raw-English from
[shintranslations.com](https://shintranslations.com/twem-toc/).
For the Vietnamese translation see [TWEM]($vi_top_link).
EOF

# Parse TOC into slug<TAB>label rows, then filter by --volumes.
mapfile -t TOC < <(parse_toc)
if [ "${#TOC[@]}" -eq 0 ] || [ -z "${TOC[0]}" ]; then
  warn "no chapters parsed from TOC; aborting"
  exit 1
fi
log "TOC has ${#TOC[@]} chapter entries"

# Resolve --volumes into a list of allowed volume numbers.
allowed_vols=()
if [ "$VOLUMES_FILTER" = "all" ]; then
  for row in "${TOC[@]}"; do
    slug="${row%%$'\t'*}"
    v="$(volume_of "$slug")"
    [ -n "$v" ] || continue
    case " ${allowed_vols[*]} " in *" $v "*) ;; *) allowed_vols+=("$v") ;; esac
  done
else
  IFS=',' read -ra allowed_vols <<< "$VOLUMES_FILTER"
fi
log "volumes: ${allowed_vols[*]}"

# Write per-volume _index.md (so Hugo can build the book section).
for v in "${allowed_vols[@]}"; do
  [ "$DRY_RUN" -eq 1 ] || write_volume_index "$v"
done

# Walk every (slug, label) pair.
failed=0
for row in "${TOC[@]}"; do
  slug="${row%%$'\t'*}"
  label="${row#*$'\t'}"
  v="$(volume_of "$slug")"
  case " ${allowed_vols[*]} " in
    *" $v "*) ;;
    *) continue ;;
  esac
  if ! write_chapter "$slug" "$label"; then
    failed=$((failed + 1))
  fi
  # Be polite to the Wayback Machine.
  sleep 1
done

log "done. markdown under: $OUTPUT_DIR  (failures: $failed)"
