# Phase 3: Translate EN → VI

**Status:** Pending
**Effort:** 4–8 hours (machine translation) + 1–2 hours (manual cleanup)
**Owner:** TBD
**Depends on:** Phase 2 (needs clean EN files)

## Context

The translation pipeline is Google Translate (per `README.md`). We need a
script `scripts/translate-twem.sh` that:
- Takes an EN chapter file
- Translates to VI using Google Translate (or whatever engine the user picks)
- Writes a VI file with the same frontmatter (translated `title:` only)
- Runs in batch (volume-wide or chapter-wide)

## Decision: pipeline implementation

Two options to choose between (ask the user):

**Option A: shell + `translate-shell`** (lightweight, no API key, may rate-limit)
- `translate-shell` is a CLI for Google Translate (no key needed but
  throttled)
- Pro: zero setup
- Con: ~1 req/sec, large V8 will take hours; no caching

**Option B: Python + `googletrans` / DeepL API** (proper batching, needs key)
- Pro: batched requests, fast
- Con: needs an API key; depends on user having DeepL/Google Cloud account

For an 8-chapter V8 (plus 5 missing = ~13 chapters, ~50k words), Option A
(translate-shell) is fine and matches the existing "Google Translate +
manual cleanup" pipeline.

## Related files

- `content/docs/twem-en/volume-8/` (source)
- `content/docs/twem/volume-8/` (target)
- `scripts/translate-twem.sh` (to be created in this phase)
- `docs/translation-glossary.md` (reference for canonical terms during post-cleanup)

## Steps

1. Write `scripts/translate-twem.sh`:
   - Input: `--volumes 8` (or single-file mode for testing)
   - For each EN file, translate body content (preserve frontmatter)
   - Use the cached EN file from `content/docs/twem-en/` (don't re-fetch)
   - Output: `content/docs/twem/volume-8/<same-filename>.md`
2. Test on 1 chapter (V8 chapter-1-part-1, which is already translated, to
   diff output). This validates the pipeline before running on real missing
   chapters.
3. Run the full V8 translation pass.
4. Manual cleanup pass on the 5 newly-translated chapters (the 8 existing V8
   files are already done from the 2026-06-12 pass).
5. Apply the `ma pháp`/`phép thuật` decision from glossary §3 — either
   retro-fit to `phép thuật` or leave `ma pháp` as the V8 canonical.

## Success criteria

- All missing V8 chapters have a corresponding VI file.
- VI frontmatter is valid Hugo YAML.
- Body content is fully translated (no untranslated EN chunks except
  intentional ones per glossary).
- Spot-check 2–3 chapters for translation quality (no `mư[a-zA-Z]{2,} mươi`
  corruption, no Sofia→Sonia-style typos).

## Risks

- `ma pháp`/`phép thuật` mid-V8 inconsistency will look bad. Best to decide
  before this phase starts.
- MT engine may produce different output across runs (Google Translate isn't
  deterministic for long text) — if a previously-translated chapter gets
  re-run, the new output may differ from the 2026-06-12 baseline.
