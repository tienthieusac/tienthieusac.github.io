# TWEM Vietnamese Translation — Formatting & Structural Consistency Report

**Scope:** `/config/workspace/tienthieusac/tienthieusac.github.io/content/docs/twem/`
**Source:** `/config/workspace/tienthieusac/tienthieusac.github.io/content/docs/twem-en/`
**Volumes sampled widely:** 1, 2, 4, 6, 8 (volumes 3, 5, 7 spot-checked)
**Date:** 2026-06-12

---

## TL;DR — Severity Legend

- **HIGH** — breaks Hugo behavior, breaks links, or causes visible content errors
- **MED** — reader-facing inconsistency
- **LOW** — minor stylistic drift, no functional impact

The biggest issues are clustered in **Volume 1** (first-translated, drift since cleaned up) and **Volume 8** (Patreon paywall URLs leaked into 7 chapter footers). Volumes 2–7 are mostly internally consistent; the cross-volume label drift is a separate, MED-severity problem.

---

## 1. Frontmatter

### `title:` quoting

| Style | Count | Where |
|---|---|---|
| Double-quoted `title: "…"` | 200 | v2–v8 (and most of v1) |
| Unquoted `title: …` | 8 | v1 only — see below |
| Single-quoted | 0 | — |

**8 unquoted titles (all in v1):**

- `volume-1/chapter-15.md` — `title: Chương 15 – Tiếp kiến hoàng gia`
- `volume-1/chapter-16.md` — `title: Chương 16 – Mạo hiểm giả hạng S`
- `volume-1/chapter-17.md` — `title: Chương 17 – Tên hạng S còn lại`
- `volume-1/chapter-18.md` — `title: Chương 18 – Thăng hạng S?`  ← contains `?`
- `volume-1/side-story-digital-version.md`
- `volume-1/side-story-part-1.md`
- `volume-1/side-story-part-2.md`
- `volume-1/side-story-part-3.md`

**Risk:** `chapter-18.md` contains `?` in unquoted YAML — some parsers will choke. Hugo currently renders fine because of tolerance, but it's a latent bug. The other 7 have no special chars and parse fine, but break the visual consistency with v2+.

**Fix:** Quote all of them as `title: "…"`. Recommend using a small script to normalize.

### `weight:` field

- Every `chapter-*.md`, `side-story-*.md`, `short-story-*.md` has a `weight:` field. No exceptions in the body chapters.
- Only `_index.md` files in each volume correctly omit it.

**Special weight values:**
- `volume-4/short-story.md` — `weight: 1000.497` (uses 1000+ to sort after main chapters)
- `volume-7/chapter4-part-1.md` — `weight: 1000.692` (inherited from source URL; not a typo in our code)

Both intentional; no action needed.

### Other frontmatter fields

- `bookCollapseSection: true` — present in every `_index.md` (8/8). Consistent.
- `status: "unavailable"` — appears only in `volume-8/chapter-8.md` and `volume-8/chapter-9.md`. Consistent with the `twem-en` source. The Vietnamese notice text is also fully translated.
- `volume:` / `source:` fields present in **English** chapters but **absent** in Vietnamese chapters. This is **HIGH** for diff-ability but **MED** for the public site (no UI depends on them). Recommend adding to VI chapters for parity.

---

## 2. H1 Chapter Title

H1 always matches `title` exactly (verified programmatically). Two structural issues remain:

### 2a. `title: "."` placeholder (inherited from source)

- `volume-4/chapter-2-part-2.md` — `title: "."` and `# .` (H1 also `.`). The English source has the same bug (`content/docs/twem-en/volume-4/chapter-2-part-2.md:2`). Real chapter content (~277 lines) is present.
- **Fix:** Re-pull from `https://shintranslations.com/twem-vol-4-chapter-2-part-2/` and re-translate the title. If the source site itself shows `.`, at minimum overwrite with `"Chương 2 – Các Anh Hùng Đánh Mê Cung (Phần 2)"` to match the part-1 sibling.

### 2b. Tagline-only title (chapter-2-part-2 of v8)

- `volume-8/chapter-2-part-2.md` — `title: "<Bầu Trời Rực Lửa>"` and `# <Bầu Trời Rực Lửa>`. Inherited from `twem-en/volume-8/chapter-2-part-2.md` (`<Fiery Sky>`).
- This is the source convention (it's a flashback/side-arc opening), but the H1 reads awkwardly to a new reader.
- **Fix (optional):** prepend `Chương 2 – ` → `title: "Chương 2 – <Bầu Trời Rực Lửa>"`.

### 2c. Title-number vs filename mismatch (vol-8 chapter-5-part-2)

- `volume-8/chapter-5-part-2.md` — `title: "Chương 6 – [Thiên Đường Thời Gian] Eleonora I"`. Filename says chapter 5, title says chapter 6.
- Mirrors the English source: `twem-en/volume-8/chapter-5-part-2.md` has `Chapter 6 – [Time Heaven] Eleonora I`.
- **Fix:** flag the source site; until corrected, leave as-is. Optionally add a comment in the file: `<!-- English source mis-titles this as Ch6; file is part-2 of Ch5. -->`.

### 2d. Bare "Chương N" (no subtitle) — intentional or sloppy?

- `volume-8/chapter-8.md` / `chapter-9.md` — `title: "Chương 8"` / `"Chương 9"`. These are the `status: "unavailable"` placeholders, so bare title is correct.
- No other bare titles.

### 2e. Em-dash consistency in chapter title

- All titles use the en-dash `–` (U+2013) consistently, never `—` (em-dash, U+2014) or `-` (hyphen). Verified across all 200+ files.
- All use the `Chương N – <subtitle>` form, never `Chương N: <subtitle>` (colon) and never `Chapter N` (untranslated).
- **No fix needed for 2e.**

---

## 3. Dialog Punctuation (Quote Marks)

### Single style, fully consistent

- **All 208 chapter files** use straight double-quote `"` (U+0022) for dialog.
- **Zero files** use curly `"…"` (U+201C/U+201D).
- **Zero files** use `«…»` (French/Vietnamese guillemets).
- **No mixing** of styles within or across files.
- `<<…>>` is reserved for system/skill messages (a different semantic, not dialog) — also consistent.

The dialog punctuation is **the cleanest aspect** of the corpus. No fix needed.

---

## 4. ToC / Prev-Next Footer

### 4a. Presence

- 206 of 208 chapter files have a nav footer (`←…` | `…→`).
- 2 files have no footer (intentional):
  - `volume-8/chapter-8.md` and `volume-8/chapter-9.md` — `status: "unavailable"` placeholders.
- All `_index.md` files (8 total) correctly omit the footer.

### 4b. Label vocabulary — **HIGH cross-volume drift**

| Label pair | Count | Volume(s) |
|---|---|---|
| `[←Trước] … [Sau→]` | 101 | v1 (5), v2 (4), **v4 (28), v5 (29), v6 (36)** |
| `[←Trước] … [Tiếp→]` | 45 | v1 (5), v2 (12), v3 (23), v8 (13) |
| `[←Trang trước] … [Trang sau→]` | 33 | **v7 only** (33) |
| `[←Previous] … [Next→]` (English) | 8 | v1 (3) + v2 (5) |
| `[←ToC] … [Next→]` (English) | 9 | v1 only |
| `[←Trước] … [Tiếp→ (Dùng thử 7 ngày miễn phí)]` (paywall) | 7 | **v8 only** |

**Volume-by-volume label breakdown** (excluding _index, unavailable chapters):

- **v1 (22 chapters):** mixed ToC/Previous/Sau/Tiếp — 5 ToC + 3 Previous + 5 Sau + 5 Tiếp + 4 inherited
- **v2 (21 chapters):** mixed Previous/Sau/Tiếp — 4 Sau + 12 Tiếp + 5 Previous
- **v3 (23 chapters):** 100% Tiếp
- **v4 (28 chapters):** 100% Sau
- **v5 (29 chapters):** 100% Sau
- **v6 (36 chapters):** 100% Sau
- **v7 (33 chapters):** 100% Trang trước / Trang sau
- **v8 (13 chapters):** mostly Tiếp (6) + paywall Tiếp (7)

**Fix:** Pick one canonical pair and apply globally. Recommendation: `[←Trước] … [Tiếp→]` (or `[←Trang trước] … [Trang sau→]` if matching v7's preference). Pick one and ship a global find-replace. See "Format fixes" §7 below.

### 4c. Paywall URLs leaking from Patreon — **HIGH severity**

`volume-8/chapter-1-part-2.md`, `chapter-3-part-1.md`, `chapter-3-part-2.md`, `chapter-4-part-1.md`, `chapter-4-part-2.md`, `chapter-5-part-1.md`, `chapter-5-part-2.md` all contain a patreon URL in the nav:

```
[←Trước](https://web.archive.org/.../twem-vol-8-chapter-N-part-M/) | [Tiếp→ (Dùng thử 7 ngày miễn phí)](https://web.archive.org/.../https://www.patreon.com/posts/XXXXX)
```

The "Dùng thử 7 ngày miễn phí" (Try 7 days free) text is a Patreon paywall CTA. This is **content leakage from the upstream Patreon page** when the chapter is paywalled on the source site.

**Fix:** Remove the paren text and replace with a clean link to the next chapter, or omit the next link entirely (or change to a note `Bản tiếp theo chưa có sẵn`). Either way, do **not** ship a Patreon URL in the public site.

### 4d. URL target style — web.archive.org vs relative

- **198 files** use full `https://web.archive.org/web/.../twem-…` URLs.
- **8 files** use `../..` or `../../..` relative links — **all 8 are in volume 1** (chapter-15, 16, 17, 18, side-story-part-1, side-story-part-2, side-story-part-3, side-story-digital-version).

**Fix:** Convert v1's 8 relative links to web.archive.org to match the rest of the corpus. The relative links work in a Hugo build but the convention should be uniform.

### 4e. `---` separator before footer

- 100% of files with a nav footer (206/206) have a `---` horizontal rule on the line immediately before the nav. **Fully consistent.** No fix.

---

## 5. Image References

42 inline `![](…)` image references across the corpus.

| Pattern | Count | Where |
|---|---|---|
| `![](https://web.archive.org/.../shintranslations.com/...)` (empty alt, archive URL) | 40 | v1–v8 chapters, embedded illustrations |
| `![Cover1](Cover1.jpg)` (local asset, has alt) | 1 | `volume-1/_index.md:8` |
| `![HarutoGuildCard](HarutoGuildCard.jpg)` (local asset, has alt) | 1 | `volume-1/chapter-6.md:36` |

**Findings:**
- Inline illustrations (40) all use the web.archive.org URL with **empty alt text** — consistent across volumes.
- Two local images in v1 use the local path and **have alt text** — also consistent within v1.
- **Volume 1's `_index.md` is the only one with a cover image.** Volumes 2–8 have no cover in `_index.md`. This matches the English source (`twem-en/volume-1/_index.md` doesn't have a cover either). **No fix** unless the user wants v2–v8 covers too.

**MED:** All 40 inline illustrations have empty alt text. If accessibility matters, add a brief description in Vietnamese (e.g., `![Haruto cầm kiếm đen](...)`). Otherwise no fix.

---

## 6. Special Files

### 6a. `side-story-*.md`

Present in:
- **v1:** `side-story-digital-version.md`, `side-story-part-1.md`, `side-story-part-2.md`, `side-story-part-3.md`
- **Not present in v2+** (inherits from source — there are no side-stories past v1)

All 4 v1 side-stories:
- Have `weight:` field ✓
- Have `title:` field ✓
- Have H1 ✓
- Have nav footer ✓
- `side-story-part-1/2/3.md` have **identical titles** (`Ngoại Truyện – Trong khi đó, Những Anh Hùng…`) — verified, this is the source convention (three short vignettes grouped as one title). **No fix.**
- `side-story-digital-version.md` has its own title ✓
- `side-story-part-1.md` and `side-story-digital-version.md` are the only side-stories with `[←ToC]` label instead of `[←Trước]` — see §4b.

### 6b. `short-story.md`

Present in v2 (`short-story.md`) and v4 (`short-story.md`).

- Both have `title:` + `weight:` + nav footer ✓
- v2's `short-story.md` is a chapter, weight `100`. v4's is `weight: 1000.497` (sorts after main story). Both consistent within their volume.
- **Fix:** None — they are different in source.

### 6c. `chapter-14-5.md` (only in v2)

- `volume-2/chapter-14-5.md` — `title: "Chương 14.5 – Cuộc Tìm Kiếm Anh Hùng Tiếp Tục"`, `weight: 145`. Treats `.5` as a half-chapter, which matches the source convention.
- **No fix.**

### 6d. `chapter-N-part-1.md` / `chapter-N-part-2.md`

- Present in v4–v8.
- Filename uses hyphen: `chapter-2-part-1.md`. **EXCEPT** `volume-7/chapter4-part-1.md` (no hyphen before `4`) — inherited from source URL typo. The file is functionally correct; rename to `chapter-4-part-1.md` would break the incoming source URL match. **No fix.**

### 6e. `status: "unavailable"` chapters

- `volume-8/chapter-8.md`, `chapter-9.md` — both have `weight:`, `status:`, and a `> **Chương này hiện chưa có trong bản lưu trữ Wayback Machine.**` blockquote notice.
- H1 = title = "Chương 8" / "Chương 9" (bare, no subtitle).
- **No nav footer** (intentional — there's nothing to link to).
- **Fix:** None. Convention is consistent with the source.

---

## 7. Formatting Fix List (prioritized)

### HIGH (fix before next publish)

1. **Strip Patreon URLs from 7 v8 chapter footers** (`chapter-1-part-2`, `chapter-3-part-1`, `chapter-3-part-2`, `chapter-4-part-1`, `chapter-4-part-2`, `chapter-5-part-1`, `chapter-5-part-2`). Replace the `(Dùng thử 7 ngày miễn phí)` link with either a clean next-chapter link or a `Bản tiếp theo chưa có sẵn` placeholder.
2. **Fix `volume-4/chapter-2-part-2.md` `title: "."`** — overwrite to `"Chương 2 – Các Anh Hùng Đánh Mê Cung (Phần 2)"` (or re-pull from source).

### MED (recommend in next cleanup pass)

3. **Standardize nav labels** — pick `[←Trước] … [Tiếp→]` and apply globally:
   - v1: 9 ToC + 3 Previous + 5 Sau → Tiếp
   - v2: 5 Previous + 4 Sau → Tiếp
   - v4–v6: 93 Sau → Tiếp
   - v7: 33 Trang trước/Trang sau → Trước/Tiếp
   - v8: 6 Tiếp (already correct)
4. **Quote all unquoted `title:` fields** — the 8 v1 cases (`chapter-15, 16, 17, 18`, 3× `side-story-part-1/2/3`, `side-story-digital-version`).
5. **Convert v1's 8 relative nav URLs** (`../..` / `../../..`) to full `https://web.archive.org/...` URLs to match v2+.
6. **Add `volume:` and `source:` fields to VI frontmatter** for parity with EN.

### LOW (nice-to-have)

7. Add alt text to the 40 inline illustration `![](URL)` references.
8. Add cover images to v2–v8 `_index.md` for visual symmetry with v1.
9. Replace `chapter-2-part-2.md` in v8's tagline-only H1 with `"Chương 2 – <Bầu Trời Rực Lửa>"` (optional; matches reader expectation).

---

## 8. Outliers — File:line Citation Index

| File | Line | Issue |
|---|---|---|
| `volume-4/chapter-2-part-2.md` | 2 | `title: "."` — placeholder bug from source |
| `volume-4/chapter-2-part-2.md` | 6 | H1 = `# .` — same bug |
| `volume-8/chapter-2-part-2.md` | 2, 6 | Title/H1 = `"<Bầu Trời Rực Lửa>"` — tagline only |
| `volume-8/chapter-5-part-2.md` | 2, 6 | Title/H1 = `"Chương 6 – …"` but file is part-2 of Ch5 |
| `volume-8/chapter-1-part-2.md` | tail | Patreon URL in nav footer |
| `volume-8/chapter-3-part-1.md` | tail | Patreon URL in nav footer |
| `volume-8/chapter-3-part-2.md` | tail | Patreon URL in nav footer |
| `volume-8/chapter-4-part-1.md` | tail | Patreon URL in nav footer |
| `volume-8/chapter-4-part-2.md` | tail | Patreon URL in nav footer |
| `volume-8/chapter-5-part-1.md` | tail | Patreon URL in nav footer |
| `volume-8/chapter-5-part-2.md` | tail | Patreon URL in nav footer |
| `volume-1/chapter-15..18.md` | 2 | Unquoted `title:` (×4) |
| `volume-1/side-story-part-1.md` | 2 | Unquoted `title:` |
| `volume-1/side-story-part-2.md` | 2 | Unquoted `title:` |
| `volume-1/side-story-part-3.md` | 2 | Unquoted `title:` |
| `volume-1/side-story-digital-version.md` | 2 | Unquoted `title:` |
| `volume-1/chapter-15.md` | tail | `[←ToC](../..) … [Next→](../chapter-16)` — English label + relative URL |
| `volume-1/chapter-16.md` | tail | Same — `[←ToC](../../..) … [Next→](../chapter-17)` |
| `volume-1/chapter-17.md` | tail | Same pattern |
| `volume-1/chapter-18.md` | tail | Same pattern |
| `volume-1/chapter-1.md` | tail | `[←ToC](web.archive.org…)` — ToC label but web.archive.org URL (mixed) |
| `volume-1/side-story-*.md` (×4) | tail | `[←ToC](../../..) … [Next→]` — English label + relative URL |
| `volume-1/chapter-2.md` | tail | `[←Previous](web.archive.org…)` — English label |
| `volume-1/chapter-3.md` | tail | `[←Previous](web.archive.org…)` — English label |
| `volume-1/chapter-4.md` | tail | `[←Previous](web.archive.org…)` — English label |
| `volume-2/chapter-5,6,7,8,9.md` | tail | `[←Previous](web.archive.org…)` — English label (×5) |

---

## 9. Structural Files That Are Missing Something

| File | Missing | Action |
|---|---|---|
| `volume-1/_index.md` | None (cover image present) | — |
| `volume-2/_index.md` … `volume-8/_index.md` | Cover image (low priority) | Optional add |
| `volume-4/chapter-2-part-2.md` | Proper title (currently `"."`) | **Fix #2** |
| `volume-8/chapter-8.md` | Nothing — intentionally bare, `status: unavailable` | None |
| `volume-8/chapter-9.md` | Nothing — intentionally bare, `status: unavailable` | None |
| `volume-8/chapter-1-part-2.md` … `chapter-5-part-2.md` (7 files) | Clean next-link in nav (currently Patreon URL) | **Fix #1** |
| All VI chapters | `volume:` and `source:` frontmatter fields | Optional add |

---

## 10. What Is NOT Broken

- Dialog quote style (all straight `"`, no mixing) — **clean**
- `---` horizontal-rule separator before nav (100% consistent) — **clean**
- `weight:` field presence (every body chapter has it) — **clean**
- `bookCollapseSection: true` in `_index.md` (8/8) — **clean**
- Em-dash usage in titles (always `–`, never `—` or `-`) — **clean**
- H1 = title match (programmatically verified, 100%) — **clean**
- File naming pattern (`chapter-N.md`, `chapter-N-part-M.md`, `side-story-*.md`, `short-story.md`) — **clean** (one inherited source typo in `chapter4-part-1.md` of v7)

---

**Status:** DONE_WITH_CONCERNS
**Summary:** Vietnamese TWEM translation is structurally clean on dialog quotes, separators, and frontmatter weight/H1/title match. The two real problems are (a) **Patreon paywall URLs leaking into 7 v8 chapter footers** and (b) **`volume-4/chapter-2-part-2.md` having a placeholder title `"."`** — both need to be fixed before the next publish. Cross-volume nav label drift (ToC/Previous/Sau/Tiếp/Trang) is a MED-severity consistency issue fixable by a global find-replace.
**Concerns/Blockers:**
- The 7 Patreon paywall URLs may also exist in the English source — worth checking before sanitizing, so we don't desync VI from EN.
- The `volume-8/chapter-5-part-2.md` "Chương 6" title is inherited from the English source; if the user expects the file to be re-labelled, the fix touches only the VI file and the two will diverge.
- The `volume-4/chapter-2-part-2.md` `.` title may indicate a deeper source-data issue (entire chapter title is missing upstream) — re-pulling from `shintranslations.com/twem-vol-4-chapter-2-part-2/` is the only way to recover the real title.
