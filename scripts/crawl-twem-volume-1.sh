#!/usr/bin/env bash
# Crawl raw-English TWEM Volume 1 chapters from shintranslations.com
# (via the Wayback Machine snapshot, since the live site is behind a
# Cloudflare bot challenge) and save them as Markdown files.
#
# Usage:
#   scripts/crawl-twem-volume-1.sh [output_dir]
#
# Output layout (default: content/docs/twem/volume-1-en/):
#   _index.md
#   chapter-1.md ... chapter-18.md
#   side-story-digital-version.md
#   side-story-part-1.md ... side-story-part-3.md
#
# Requirements: node >= 18, npm (defuddle is installed automatically on
# first run into a local sandbox dir).

set -euo pipefail

OUTPUT_DIR="${1:-content/docs/twem/volume-1-en}"
WAYBACK_PREFIX="https://web.archive.org/web/2024/https://shintranslations.com"
SOURCE_DOMAIN="https://shintranslations.com"
CRAWLER_DIR="${CRAWLER_DIR:-.tmp-twem-crawler}"
DEFUDDLE="$CRAWLER_DIR/node_modules/.bin/defuddle"

# slug : weight (used for Hugo frontmatter & sort order)
# Side-stories get weights 100+ so they sort after the main chapters.
VOLUME_1_CHAPTERS=(
  "twem-vol-1-chapter-1:1"
  "twem-vol-1-chapter-2:2"
  "twem-vol-1-chapter-3:3"
  "twem-vol-1-chapter-4:4"
  "twem-vol-1-chapter-5:5"
  "twem-vol-1-chapter-6:6"
  "twem-vol-1-chapter-7:7"
  "twem-vol-1-chapter-8:8"
  "twem-vol-1-chapter-9:9"
  "twem-vol-1-chapter-10:10"
  "twem-vol-1-chapter-11:11"
  "twem-vol-1-chapter-12:12"
  "twem-vol-1-chapter-13:13"
  "twem-vol-1-chapter-14:14"
  "twem-vol-1-chapter-15:15"
  "twem-vol-1-chapter-16:16"
  "twem-vol-1-chapter-17:17"
  "twem-vol-1-chapter-18:18"
  "twem-vol-1-side-story-digital-version:100"
  "twem-vol-1-side-story-part-1:101"
  "twem-vol-1-side-story-part-2:102"
  "twem-vol-1-side-story-part-3:103"
)

# Output filename for a given source slug.
output_path_for() {
  local slug="$1"
  case "$slug" in
    twem-vol-1-chapter-*)
      printf '%s/chapter-%s.md' "$OUTPUT_DIR" "${slug#twem-vol-1-chapter-}"
      ;;
    twem-vol-1-side-story-*)
      printf '%s/side-story-%s.md' "$OUTPUT_DIR" "${slug#twem-vol-1-side-story-}"
      ;;
    *)
      printf '%s/%s.md' "$OUTPUT_DIR" "$slug"
      ;;
  esac
}

# Fallback human title derived from the output filename.
fallback_title_for() {
  local file="$1"
  local base
  base="$(basename "$file" .md)"
  case "$base" in
    chapter-*)     printf 'Chapter %s' "${base#chapter-}" ;;
    side-story-*)  printf 'Side Story – %s' "${base#side-story-}" | tr '-' ' ' ;;
    *)             printf '%s' "$base" ;;
  esac
}

ensure_defuddle() {
  if [ -x "$DEFUDDLE" ]; then
    return
  fi
  echo ">> installing defuddle into $CRAWLER_DIR (one-time)" >&2
  mkdir -p "$CRAWLER_DIR"
  ( cd "$CRAWLER_DIR" && npm init -y >/dev/null && npm install defuddle >/dev/null )
}

# Run defuddle, retrying on transient Wayback/Cloudflare hiccups.
# Prints the raw JSON on stdout, returns non-zero on hard failure.
defuddle_json() {
  local url="$1"
  local json="" attempt
  for attempt in 1 2 3 4 5 6 7 8; do
    if json="$(
      "$DEFUDDLE" parse "$url" --json 2>/dev/null \
        | sed -E "s|${SOURCE_DOMAIN}/twem-vol-1-||g"
    )"; then
      if [ -n "$json" ] && [ "${json:0:1}" = "{" ]; then
        printf '%s' "$json"
        return 0
      fi
    fi
    echo "   ...retry $attempt for $url" >&2
    sleep $((attempt * 2))
  done
  return 1
}

# Read JSON field "$2" from JSON on stdin via node.
json_field() {
  node -e '
    let s=""; process.stdin.on("data",d=>s+=d).on("end",()=>{
      try { const j=JSON.parse(s); process.stdout.write(String(j["'"$1'"] ?? "")); }
      catch { process.stdout.write(""); }
    });
  '
}

crawl_one() {
  local slug="$1"
  local weight="$2"
  local url="$WAYBACK_PREFIX/$slug/"
  local out
  out="$(output_path_for "$slug")"
  local title
  title="$(fallback_title_for "$out")"

  echo ">> [$slug] -> $out"
  mkdir -p "$(dirname "$out")"

  local json
  if ! json="$(defuddle_json "$url")"; then
    echo "!! failed to fetch $slug after retries" >&2
    return 1
  fi

  local body_md body_title
  body_md="$(printf '%s' "$json" | json_field contentMarkdown)"

  # Defuddle emits the chapter title either as a markdown heading
  # ("# Chapter N – ...") or as a standalone bold line
  # ("**Chapter N – ...**"). Pick the first match.
  body_title="$(printf '%s\n' "$body_md" | awk '
    /^#[[:space:]]/   { sub(/^#[[:space:]]+/, ""); print; exit }
    /^##[[:space:]]/  { sub(/^##[[:space:]]+/, ""); print; exit }
    /^\*\*[^*]+\*\*[[:space:]]*$/ {
      match($0, /\*\*([^*]+)\*\*/);
      print substr($0, RSTART+2, RLENGTH-4);
      exit
    }
  ')"
  if [ -n "$body_title" ]; then
    title="$body_title"
  fi

  # Strip a leading title-line + the blank line that follows so we
  # don't duplicate the title we inject via frontmatter + H1.
  body_md="$(printf '%s\n' "$body_md" | awk '
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
  ')"

  {
    printf -- '---\n'
    printf 'title: "%s"\n' "$title"
    printf 'weight: %s\n' "$weight"
    printf 'source: %s/%s/\n' "$SOURCE_DOMAIN" "$slug"
    printf -- '---\n\n'
    printf '# %s\n\n' "$title"
    printf '%s\n' "$body_md"
  } > "$out"
}

main() {
  ensure_defuddle
  mkdir -p "$OUTPUT_DIR"

  # Volume index page – Hugo book-section landing.
  cat > "$OUTPUT_DIR/_index.md" <<EOF
---
title: Volume 1 (Raw English)
bookCollapseSection: true
---

# Volume 1 – Raw English

Raw-English source chapters crawled from
[shintranslations.com](https://shintranslations.com/twem-toc/).
This is the unedited English text; for the Vietnamese translation see
[Tập 1](../volume-1/).
EOF

  for entry in "${VOLUME_1_CHAPTERS[@]}"; do
    slug="${entry%%:*}"
    weight="${entry##*:}"
    crawl_one "$slug" "$weight" || true
    # Be polite to the Wayback Machine.
    sleep 2
  done

  echo ">> done. markdown written under: $OUTPUT_DIR"
}

main "$@"
