# TWEM Vietnamese Translation — Consistency Review Synthesis

**Date:** 2026-06-12
**Scope:** All 8 volumes, ~200 chapters, ~500k chars. Sample-based (volumes 1, 2, 3, 4, 6, 7, 8 directly; 5, 7 spot-checked).
**Pipeline:** Google Translate (per `README.md`).
**Source of truth:** `/content/docs/twem-en/` (raw English crawled from shintranslations.com).
**Translation target:** `/content/docs/twem/`.

**Reports synthesized:**
1. `reports/general-purpose-260612-1412-twem-vietnamese-glossary-consistency-report.md` — proper nouns + skill names
2. `reports/general-purpose-260612-1414-twem-terminology-consistency-review-report.md` — domain terms + loanwords
3. `reports/formatting-consistency-report.md` — frontmatter, H1, quotes, nav, separators
4. `reports/tone-quality-translation-consistency-review.md` — pronouns, register, MT artifacts

---

## Executive summary

**Translation is structurally healthy.** Dialog quotes, H1↔title match, em-dash usage, `---` separators, `bookCollapseSection`, and weight fields are 100% consistent. Pronoun/address-term usage is stable and well-applied per social hierarchy. Court register (`thần`, `ngài`, `Bệ Hạ`) is character-bound and does not leak into modern scenes.

**Real problems cluster in 3 places:**

1. **MT pipeline corruption** — 1 confirmed character-string corruption (`mưvarried` in V1 ch18:214). Pattern is grep-able across full corpus.
2. **Vocabulary drift in signature concepts** — 2 main-character skills (`All Creation`, `God Eye`) and 2 titles (`Demon King`, `Hero`) have 3–5 Vietnamese renderings each. Pick canonical.
3. **Source-leaked content** — 7 Patreon paywall URLs in V8 chapter footers + 1 placeholder `title: "."` in V4 ch2-part-2.

Volume 8 is **not fully translated** — `chapter-8.md` and `chapter-9.md` are Wayback `status: "unavailable"` placeholders, and 5 V8 chapters are missing from the corpus.

---

## Cross-cutting findings (flagged by 2+ agents)

| # | Issue | Agents | Severity |
|---|---|---|---|
| X1 | `All Creation` skill — 4+ Vietnamese renderings (`Toàn Tạo`, `Sáng Tạo Toàn Năng`, `Sáng Thế`, `Toàn Tạo Hóa`) + 14 untranslated EN. `Sáng Thế` in V1 ch10:337 collides with the highest item-rarity tier. | glossary, terminology | **HIGH** (MC signature skill) |
| X2 | `God Eye` skill — 5 renderings (`Thần Nhãn`, `Thiên Nhãn`, `Con Mắt Thần`, `Mắt Thần`) + 24 untranslated EN. | glossary, terminology | **HIGH** (MC signature skill) |
| X3 | `Demon King` / `ma vương` capitalization drift — 7 lowercase should be `Ma Vương` (proper title). | glossary, terminology | HIGH (in 7 file:line locations) |
| X4 | `dungeon` left untranslated 28× in V4 despite `hầm ngục` already established 22×. | glossary, terminology | HIGH |
| X5 | `magic` / `Magic` 3-way split — `phép thuật` (V1+V4) vs `ma pháp` (V8) vs `ma thuật` (mixed). | glossary, terminology | HIGH |
| X6 | `yêu tinh` overload — used for both **goblin** and **elf**. | glossary, terminology | HIGH (reader confusion) |
| X7 | `Sofia` → `Sonia` typo in V2 ch1 last paragraph. | glossary | HIGH (trivial fix) |
| X8 | V8 incomplete — `chapter-8.md` + `chapter-9.md` are `status: "unavailable"` placeholders; 5 V8 chapters missing. | tone, formatting | HIGH (coverage gap) |
| X9 | MT corruption pattern `mư[a-zA-Z]{2,} mươi` — 1 confirmed (`mưvarried` V1 ch18:214). Sweep corpus. | tone (with glossary flagging skill-name area) | HIGH (mechanical bug) |
| X10 | `Hero` (class) vs `Knight` confusion — `Anh Hùng` and `hiệp sĩ` swapped in V1 side-stories. | glossary, terminology | MEDIUM |

---

## Unique-to-one-agent findings

### Tone/MT artifacts (tone agent)

| # | Issue | File:line | Severity |
|---|---|---|---|
| T1 | Mitsurugi says `tụi tớ` (neutral casual) — should be `tụi tao` (mocking-bully register). | V1 ch1:58 | MEDIUM |
| T2 | Stuttered "what" lost — EN has 4×, VN has 2×. | V4 ch1:176 | LOW |
| T3 | Corpus-wide grep suggested for `mư[a-zA-Z]{2,} mươi` pattern (see X9). | full corpus | HIGH (see X9) |

### Formatting (formatting agent)

| # | Issue | Files | Severity |
|---|---|---|---|
| F1 | **Patreon paywall URLs in 7 V8 chapter footers** — `(Dùng thử 7 ngày miễn phí)` text leaks source-side paywall CTA. | V8: chapter-1-part-2, 3-p1, 3-p2, 4-p1, 4-p2, 5-p1, 5-p2 | **HIGH (ship-blocker)** |
| F2 | `title: "."` placeholder (H1 also `.`) — inherited from EN source bug. | V4/chapter-2-part-2.md:2, 6 | HIGH (ship-blocker) |
| F3 | 5 different nav-label pairs cross-volume (`ToC/Next`, `Previous/Next`, `Trước/Sau`, `Trước/Tiếp`, `Trang trước/Trang sau`). | 198 chapters | MEDIUM (1 canonical-pair find-replace) |
| F4 | 8 unquoted `title:` fields (V1 only) — `chapter-18.md` has `?` (latent YAML risk). | V1: chapter-15, 16, 17, 18 + 4 side-stories | MEDIUM |
| F5 | 8 relative `../..` nav URLs (V1 only) — should be absolute web.archive.org. | V1 chapter-15..18 + 4 side-stories | MEDIUM |
| F6 | VI frontmatter lacks `volume:` and `source:` fields (present in EN). | all VI chapters | LOW (parity) |
| F7 | V8 ch5-part-2: title says "Chương 6" but file is part-2 of Ch5 (inherited from EN). | V8/chapter-5-part-2.md | LOW (source-side) |

### Glossary (glossary agent unique)

| # | Issue | File:line | Severity |
|---|---|---|---|
| G1 | `Appraisal` — 3 renderings (`Appraisal` EN, `Thẩm định`, `Thẩm Định`) + capitalization drift. | V2 ch2, V2 ch13, V4 ch2-part-2 status, V6 ch16-p1, V7 ch13-p2 | MEDIUM |
| G2 | `Gift` — EN/VI mix (`Gift`, `Quà tặng`, `Quà tặng thần thánh`). | V1-V4 | MEDIUM |
| G3 | Status-table casing drift (`KỸ NĂNG ĐỘC NHẤT` vs `Kỹ năng Độc nhất` in same vol-1). | V1 status tables | MEDIUM |
| G4 | `Thần` vs `Chúa` for "God" character (vol-1 uses `Thần` 43×, vol-3 uses `Chúa` 8×). | V1-V8 | MEDIUM |
| G5 | `Kusel`/`Kuzel` 326-vs-306 split (mirrors EN; needs JP source check). | V1-V8 | MEDIUM |
| G6 | `Orihara Shoya` reversed in V3 ch9:304. | V3/chapter-9.md:304 | LOW |
| G7 | `Demon King` EN form appears in 2 system messages (acceptable). | V2 ch9, V6 ch18 | LOW (preserve) |
| G8 | V6 ch18-part-2:305 — entire title list (Otherworlder, Monarch of War, Demon King, Annihilator, etc.) is untranslated English. | V6/chapter-18-part-2.md:305 | HIGH |

### Terminology (terminology agent unique)

| # | Issue | Severity |
|---|---|---|
| N1 | `Heroes` plural mixing — `Anh Hùng` (class) vs `anh hùng` (generic) vs `hiệp sĩ` (knight, but used as synonym in V1 side-stories). | MEDIUM (see X10) |
| N2 | `mana`/`Mana` (22×) vs `ma lực` (168×). | MEDIUM |
| N3 | Healing spell — `Hồi Phục` (51) / `chữa trị` (9) / `Trị Liệu` (1) / `Phép Thuật Hồi Phục` (1). | MEDIUM |
| N4 | `Lord` — `Quan` (8, title) vs `chúa tể` (12, ruler). | MEDIUM |
| N5 | `Maid` — `hầu gái` (23) vs `hầu cận` (12, Sino-VN). | MEDIUM |
| N6 | `Boss` — `trùm` (51) / `thủ lĩnh` (45) / `tướng` (6) / `boss` (5 EN kept). | MEDIUM |
| N7 | `gold/coin` — `xu` (404) / `đồng` (201) / `vàng` (53) — `đồng` overlaps with "copper". | LOW |
| N8 | Honorifics — `-san`/`-sama` kept in V8 only; translated to `ngài`/`cô` in V1+V4. | LOW (document the rule) |
| N9 | `Phép` (system tables) vs `phép thuật` (prose) — acceptable split, document. | LOW (no action) |
| N10 | `currency` / `Magic Bag` — not exhaustively sampled. | needs sample |

---

## Canonical term decisions (recommendation, requires user sign-off)

Apply globally if approved:

| Concept | Canonical VI | Disallow | Reason |
|---|---|---|---|
| `All Creation` (skill) | **`Toàn Tạo`** | `Sáng Tạo Toàn Năng`, `Sáng Thế` (collision with rarity tier), `Toàn Tạo Hóa`, EN form (in prose) | Dominant 12×; idiomatic; avoids item-tier collision |
| `God Eye` (skill) | **`Thần Nhãn`** | `Thiên Nhãn`, `Con Mắt Thần`, `Mắt Thần`, EN form (in prose) | Most common 16×; idiomatic |
| `Demon King` (title) | **`Ma Vương`** (always cap) | `ma vương`, `Demon King` (except inside 『』 status) | Proper title |
| `Hero` (class, summonee) | **`Anh Hùng`** (cap) | `anh hùng` for class, `hiệp sĩ` | Class name; `hiệp sĩ` = knight |
| `Knight` | **`hiệp sĩ`** | `Anh Hùng` | Distinct from "Hero" class |
| `Magic` (prose) | **`phép thuật`** | `ma pháp` (V8 outlier), `ma thuật` (28×) | Established in V1+V4 + system tables (`Hỏa Phép`/`Thủy Phép`) |
| `Magic` (system table) | **`Phép`** | `Pháp` | Matches existing `Hỏa Phép` style |
| `Dungeon` | **`hầm ngục`** | `dungeon` (EN), `Mê Cung` (Mê Cung = labyrinth, different concept) | Established 22× |
| `Monster` | **`quái vật`** | `quái thú`, `sinh vật` (for sentient races) | Established 185× |
| `Boss` (game, end-of-floor) | **`trùm`** | `thủ lĩnh` (use only for mob leader), `tướng`, `boss` (EN, only in UI quotes) | |
| `Mana` (prose) | **`ma lực`** | `mana`/`Mana` in prose | Established 168× |
| `Mana` (in spell names) | **`Ma Lực`** (Title Case) | `mana` (lowercase) | System-table convention |
| `Heal` (spell name) | **`Hồi Phục`** (Title Case) | `chữa trị`, `Trị Liệu`, `Phép Thuật Hồi Phục` | Spell name convention |
| `Goblin` | **`Goblin`** (loanword) | `yêu tinh` (which means elf elsewhere) | Avoid confusion |
| `Elf` | **`Elf`** / **`tộc elf`** | `yêu tinh` | Disambiguate |
| `Maid` | **`hầu gái`** | `hầu cận` (Sino-VN) | Standard VN |
| `Lord` (noble title) | **`Lãnh Chúa`** | `Quan` (low-rank official) | Disambiguate |
| `Lord` (ruler) | **`chúa tể`** | `Quan` | |
| `King` | **`Vua`** (cap when proper name) | `quốc vương` (regnal "Trẫm"-style only) | |
| `Princess` | **`công chúa`** | `tiểu thư` (noble miss) | |
| `Appraisal` (skill) | **`Thẩm Định`** (Title Case) | `Thẩm định`, EN form | Spell/skill Title Case |
| `Gift` (in-world term, prose) | **`Quà tặng thần thánh`** | `Gift` (EN) in prose | Full in-world name |
| `Gift` (in 『』 status) | **`Gift`** (keep EN, no quotes) | `Quà tặng` | System preserves foreign term |
| `God` (the God character) | **`Thần`** | `Chúa` (Christian connotation), `God` (EN) | Neutral in-world term |

---

## Fix-list (concrete, ordered)

### Block 1 — Ship-blockers (HIGH, fix before next publish)

1. **Strip Patreon URLs from 7 V8 chapter footers** [F1]. Files: `volume-8/chapter-1-part-2.md`, `chapter-3-part-1.md`, `chapter-3-part-2.md`, `chapter-4-part-1.md`, `chapter-4-part-2.md`, `chapter-5-part-1.md`, `chapter-5-part-2.md`. Replace `(Dùng thử 7 ngày miễn phí)` link with either a clean next-chapter link or `Bản tiếp theo chưa có sẵn`. *Source-check first: do same URLs exist in twem-en?*

2. **Fix `title: "."` in `volume-4/chapter-2-part-2.md`** [F2]. Overwrite to `"Chương 2 – Các Anh Hùng Đánh Mê Cung (Phần 2)"` (or re-pull from source). Inherited from EN.

3. **Corpus-wide grep for `mư[a-zA-Z]{2,} mươi` corruption** [X9]. Confirmed hit: `volume-1/chapter-18.md:214`. Likely more.

4. **Fix `Sofia` → `Sonia` typo** [X7]. `volume-2/chapter-1.md` last paragraph.

5. **Translate V6/chapter-18-part-2.md:305 title list** [G8]. Currently: `Otherworlder`, `Monarch of War`, `Monarch of Magic`, `Transcendent One`, `EX Rank Adventurer`, `Demon King`, `Annihilator`, `The World's Strongest` — all EN.

### Block 2 — Vocabulary canonicalization (HIGH, pick terms + apply)

6. **Pick canonical for `All Creation` → `Toàn Tạo`** [X1]. Apply corpus-wide; also fix V1 ch10:337 (`Sáng Thế` → `Toàn Tạo`).

7. **Pick canonical for `God Eye` → `Thần Nhãn`** [X2]. Apply corpus-wide.

8. **Pick canonical for `Demon King` → `Ma Vương`** [X3]. 7 lowercase instances identified.

9. **Pick canonical for `magic` → `phép thuật` (prose) / `Phép` (system)** [X5]. Apply across V8 where `ma pháp` dominates.

10. **Pick canonical for `dungeon` → `hầm ngục`** [X4]. 28 instances in V4.

11. **Disambiguate `yêu tinh`** [X6]. Use `Goblin` (loanword) and `Elf`/`tộc elf`.

### Block 3 — Cross-volume format standardization (MED, single find-replace)

12. **Unify nav labels** [F3]. Pick `[←Trước] … [Tiếp→]`. Apply across 198 chapters (5 variants → 1).

13. **Quote 8 unquoted `title:` fields in V1** [F4].

14. **Convert 8 relative nav URLs in V1 to absolute web.archive.org** [F5].

### Block 4 — Terminology / register cleanups (MED)

15. **`Hero`/`Knight` disambiguation** [X10] — `Anh Hùng` for class, `hiệp sĩ` for knight.
16. **`Sofia`→`Sonia`** [X7] — single line.
17. **Mitsurugi `tụi tớ` → `tụi tao`** [T1] — V1 ch1:58.
18. **4x stutter restore** [T2] — V4 ch1:176.

### Block 5 — Source-side issues (need upstream resolution)

19. **V8 chapter-8, chapter-9 — placeholders.** Need source-side fix or accept as-is.
20. **V8 missing chapters** (5 chapters gap). Need crawl + translate.
21. **V4 ch2-part-2 title "Chương 2 – ..."** [F2] — depends on source fix.
22. **V8 ch5-part-2 "Chương 6" title** [F7] — source-side mislabel.
23. **`Kusel`/`Kuzel` 326-vs-306** [G5] — needs JP romaji check (`クーセル` vs `クーゼル`).

---

## Effort & impact estimate

| Block | Effort | Impact | Risk if deferred |
|---|---|---|---|
| 1 (ship-blockers) | ~30 min (mechanical) | High (publish) | Reader sees paywall CTAs + placeholder title |
| 2 (vocabulary) | ~2-4 hr (corpus find-replace + manual disambiguation) | High (readability) | Vocabulary drift confuses readers |
| 3 (formatting) | ~30 min (script) | Medium | Cross-volume inconsistency |
| 4 (terminology) | ~1-2 hr | Medium | Readability noise |
| 5 (source-side) | unknown | V8 unreadable until done | V8 untranslatable |

**Total non-source work:** ~5-7 hours of mechanical edits + verification. Most is a single sed/python pass per term.

---

## Open questions for user (require sign-off before applying)

1. **Canonical term list** — accept the 22-row table in "Canonical term decisions" above? Or adjust any?
2. **MT-corruption sweep** — run `grep -nE 'mư[a-zA-Z]{2,} mươi' content/docs/twem/**/*.md` first to find siblings, or fix the 1 known + spot-check?
3. **`All Creation` → `Toàn Tạo`** — confirm, given the `Sáng Thế` collision with item-tier is a real reader-confusion hazard.
4. **V8 coverage** — accept current state (2 placeholders + 5 missing) or schedule a V8 completion pass?
5. **Nav-label canonical** — `[←Trước] … [Tiếp→]` (terminology rec) or `[←Trang trước] … [Trang sau→]` (v7's existing)? V7 is the most-recent volume.
6. **`Kusel`/`Kuzel`** — check JP source to pick canonical, or accept upstream split?
7. **Source-side fixes (F2, F7)** — write the override in VI only (diverges from EN) or wait for source-side fix to keep parity?
8. **Translation policy** — the README says "Google Translate + manual cleanup". This review found cleanups needed. Document a glossary (e.g., `docs/translation-glossary.md`) so future passes use the canonical terms?

---

## What I did NOT do (waiting on user)

- No file edits applied. Review-only pass per the request.
- No new glossary file written — proposed at `docs/translation-glossary.md` as part of question 8 above.
- No new helper script — proposed `scripts/fix-twem-consistency.sh` (corpus-wide sed/python pass) but not written.
- No commit / no push.

**Status:** DONE
