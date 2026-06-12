# Phase 4: Apply Glossary Canonicals

**Status:** Pending
**Effort:** 1–2 hours
**Owner:** TBD
**Depends on:** Phase 3 (needs translated VI files)

## Context

The 2026-06-12 cleanup applied glossary canonicals to the existing V1–V8
chapters. The newly-translated V8 chapters from Phase 3 may have:
- MT drift not present in the older chapters
- Different `ma pháp`/`phép thuật` distribution
- New `yêu tinh` (goblin/elf) instances
- New instances of `tụi tớ` (wrong register)
- New MT corruption patterns

## Related files

- `docs/translation-glossary.md` (canonical reference)
- `content/docs/twem/volume-8/` (target)
- The 2026-06-12 inline Python replacement (reference, not a script file)

## Steps

1. Re-run the corpus-wide grep checks from the consistency review (now
   re-scoped to V8 only):
   - `grep -rnE '\bmư[a-zA-Z]{2,} mươi\b' content/docs/twem/volume-8/`
   - `grep -rnE '\bAll Creation\b|\bGod Eye\b|\bAll of Creation\b' content/docs/twem/volume-8/`
   - `grep -rnE '\bThiên Nhãn\b|\bCon Mắt Thần\b|\bMắt Thần\b' content/docs/twem/volume-8/`
   - `grep -rnE '\bSáng Tạo Toàn Năng\b|\bToàn Tạo Hóa\b' content/docs/twem/volume-8/`
   - `grep -rnE '\bma thuật\b|\bma vương\b' content/docs/twem/volume-8/`
   - `grep -rnE '\bKusel\b' content/docs/twem/volume-8/`
2. Apply the same (find, replace) corpus-wide pass from the 2026-06-12
   script, but scoped to `content/docs/twem/volume-8/`.
3. Sweep for `yêu tinh` (per glossary §4) and replace with `Goblin` or
   `Elf`/`tộc elf` based on context (goblin = small hostile monster; elf =
   long-lived sentient humanoid).
4. Sweep for `tụi tớ` and replace with `tụi tao` in dialogue (per tone
   review).
5. Apply the `Anh Hùng` (class) capitalization in side-stories and recap
   sections (decide per chapter based on whether the reference is to
   Haruto's class or a generic hero).
6. Re-verify: 0 hits on all the grep patterns above (in V8 only).

## Success criteria

- V8 chapters pass the same grep checks the 2026-06-12 review established.
- V8 glossary §3 (ma pháp/phép thuật) is resolved — either retro-fitted to
  `phép thuật` or formally accepted as V8 canonical.

## Risks

- `yêu tinh` disambiguation is context-dependent; a mis-replace could
  reverse the meaning.
- `Anh Hùng` capitalization needs human review for each instance.
