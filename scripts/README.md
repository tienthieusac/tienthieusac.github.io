# scripts

Helper scripts for this Hugo site.

## `crawl-twem.sh`  (generic — preferred)

Crawls **the entire raw-English TWEM light novel** from
[shintranslations.com](https://shintranslations.com/twem-toc/) and saves
each chapter as Hugo-friendly Markdown. Auto-discovers all volumes,
chapters, parts, side-stories and short stories by parsing the site's
Table of Contents, so you only need to run it once and you get the
whole series.

The live site is behind a Cloudflare bot challenge, so every fetch
goes through the [Wayback Machine](https://web.archive.org/) snapshot
(auto-discovered via the CDX API, with a hard-coded fallback
timestamp). HTML is then run through
[defuddle](https://github.com/kepano/defuddle) to produce clean
Markdown. `defuddle` is installed automatically into
`$CRAWLER_DIR` (default: `.tmp-twem-crawler/`) on first run.

### Usage

```bash
# Crawl everything (8 volumes, ~210 pages, 10-30 minutes)
scripts/crawl-twem.sh

# Just volumes 1 and 3
scripts/crawl-twem.sh --volumes 1,3

# Write to a different location
scripts/crawl-twem.sh --output /tmp/twem-en

# List the pages that would be fetched, without actually fetching
scripts/crawl-twem.sh --dry-run

# Re-fetch (ignore the JSON + TOC cache)
scripts/crawl-twem.sh --refresh

scripts/crawl-twem.sh --help
```

### Output

```
content/docs/twem-en/    (default)
├── _index.md
├── volume-1/
│   ├── _index.md
│   ├── chapter-1.md ... chapter-18.md
│   ├── side-story-digital-version.md
│   └── side-story-part-1.md ... part-3.md
├── volume-2/
│   ├── _index.md
│   ├── chapter-1.md ... chapter-19.md
│   ├── chapter-14-5.md
│   └── short-story.md
└── ...etc for all 8 volumes
```

Multi-part chapters (e.g. `twem-vol-3-chapter-6-part-1`) become one
`.md` per part so the source's natural split is preserved.

Each chapter file has Hugo frontmatter (`title`, `weight`, `volume`,
`source`) and a body that begins with an `# H1` title, followed by the
defuddle-cleaned English text.

### Caching & retries

* The TOC HTML and every successful chapter fetch are cached in
  `$CRAWLER_DIR/toc.html` and `$CRAWLER_DIR/cache.json` respectively.
  Re-runs reuse them; pass `--refresh` to bypass.
* Per-chapter retries: up to 8 attempts with exponential back-off
  (Wayback Machine throttles bursts).
* Inter-chapter politeness: 1 s sleep between successful fetches.
* If a few pages still fail (e.g. Wayback temporarily blocked), just
  re-run the script — failed pages get retried, succeeded ones come
  from cache.

### Environment

* `WAYBACK_HOST` — Wayback prefix to use (default: the
  `20241224041001` snapshot, which has a complete TOC).
* `CRAWLER_DIR` — where defuddle and caches live (default:
  `.tmp-twem-crawler/`).

## `crawl-twem-volume-1.sh`  (legacy)

A simpler, hard-coded script for **Volume 1 only** that was the
precursor to `crawl-twem.sh`. It is preserved because it has fewer
moving parts and is useful as a reference. New work should use
`crawl-twem.sh` instead.

```bash
scripts/crawl-twem-volume-1.sh [output_dir]
```
