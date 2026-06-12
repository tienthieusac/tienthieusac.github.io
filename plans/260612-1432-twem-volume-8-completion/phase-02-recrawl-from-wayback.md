# Phase 2: Re-crawl Missing V8 Chapters from Wayback

**Status:** Pending
**Effort:** 1–2 hours (mostly waiting for Wayback + defuddle)
**Owner:** TBD
**Depends on:** Phase 1 (needs the missing-chapter list)

## Context

The EN crawler `scripts/crawl-twem.sh` already supports `--volumes 8`. We use
it to re-pull the EN source for the missing chapters. The output is Hugo-
ready Markdown in `content/docs/twem-en/volume-8/`.

## Related files

- `scripts/crawl-twem.sh`
- `content/docs/twem-en/volume-8/` (output target)
- `.tmp-twem-crawler/cache.json` (existing chapter cache)

## Steps

1. Confirm Phase 1 findings list is finalized.
2. Run: `scripts/crawl-twem.sh --volumes 8` (full V8 re-crawl — uses the
   cache for chapters that already exist, only re-fetches the missing ones
   that have a Wayback snapshot).
3. For chapters where the EN source is also missing (Phase 1 escalated), skip
   these and document the gap.
4. Verify: every filename in the Phase 1 missing-list now has a corresponding
   file in `content/docs/twem-en/volume-8/`.
5. Spot-check 1–2 re-crawled files: frontmatter is well-formed, H1 matches
   title, no defuddle artifacts (weird HTML escapes, missing paragraphs).

## Success criteria

- All re-crawlable V8 chapters have a clean EN file with valid Hugo
  frontmatter.
- Cache.json updated; no failed fetches left.

## Risks

- Wayback snapshot may not have a complete version of the page → chapter is
  partially translated. The crawler already retries 8× with exponential
  back-off; if it still fails, escalate.
- Some V8 chapters are paywalled on shintranslations.com (only on Patreon).
  Wayback may have only the preview. In that case, accept the partial or
  escalate to the user.
