# TWEM Volume 8 Completion Plan

**Date:** 2026-06-12
**Status:** Proposed (not yet started)
**Trigger:** `plans/260612-1412-translation-consistency-review/synthesis-260612-1412-twem-translation-consistency.md` Block 5 — V8 coverage gap.

## Context

Volume 8 of the Vietnamese TWEM translation is incomplete:

- **2 placeholder chapters** (`status: "unavailable"`): `volume-8/chapter-8.md`, `volume-8/chapter-9.md`
- **5 missing chapters** relative to a typical 8-chapter arc (V8 has 13 files; the EN source covers more)
- **7 of the existing 13 V8 chapters** had Patreon paywall URLs in their next-chapter links (already fixed 2026-06-12)
- **1 title mislabel** (`chapter-5-part-2.md` says "Chương 6" — already fixed 2026-06-12, F7)

V8 also uses `ma pháp` as the dominant form for "magic" (140+ instances) instead
of the V1–V7 `phép thuật` (118+). See
`docs/translation-glossary.md` §3 for the open question.

## Goal

Translate all V8 chapters to a state equivalent to V1–V7: clean, glossary-
consistent, no placeholder blocks, no paywall leaks. Then publish.

## Phases

| # | Phase | Status | File |
|---|---|---|---|
| 1 | Identify missing V8 chapters | pending | [phase-01-identify-missing-chapters.md](phase-01-identify-missing-chapters.md) |
| 2 | Re-crawl missing chapters from Wayback | pending | [phase-02-recrawl-from-wayback.md](phase-02-recrawl-from-wayback.md) |
| 3 | Translate EN → VI | pending | [phase-03-translate-to-vietnamese.md](phase-03-translate-to-vietnamese.md) |
| 4 | Apply glossary canonicals | pending | [phase-04-apply-glossary-canons.md](phase-04-apply-glossary-canons.md) |
| 5 | Verify and publish | pending | [phase-05-verification-and-publish.md](phase-05-verification-and-publish.md) |

## Dependencies

- `scripts/crawl-twem.sh` — the existing generic EN crawler (works for all 8 volumes)
- A new `scripts/translate-twem.sh` — does **not** exist yet; needs to be created
- `docs/translation-glossary.md` — apply during translation, not as a post-pass
- EN source `content/docs/twem-en/volume-8/` — already exists, partially

## Out of scope

- Translation-quality rewrites of V1–V7 (covered by the consistency review 2026-06-12; not in this plan)
- The `ma pháp`/`phép thuật` V8 unification (open question in glossary §3; needs separate decision before any new V8 work)
- The 7 Patreon URL fixes (already done 2026-06-12)
- The F7 title fix for `chapter-5-part-2.md` (already done 2026-06-12)

## Open questions for the user

1. **Re-crawl source first** — verify the missing V8 chapters exist on shintranslations.com (or are paywalled to Patreon-only) before scheduling translation work.
2. **`ma pháp` decision** — see glossary §3. Either retro-fit V8 to `phép thuật` (full unification) or formally document `ma pháp` as V8-internal canonical before the next V8 pass.
3. **Translation engine** — keep using Google Translate (per `README.md`)? If yes, write `scripts/translate-twem.sh`. If upgrading to LLM-based translation, that's a much larger plan.
4. **Schedule** — pick a target date and break Phase 1–5 into weekly chunks.
