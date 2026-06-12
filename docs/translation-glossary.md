# TWEM Translation Glossary

**Source:** `content/docs/twem-en/` (raw English from shintranslations.com)
**Target:** `content/docs/twem/` (Vietnamese, Google-Translate + manual cleanup)
**Last updated:** 2026-06-12
**Status:** Active — apply on every translation pass

## Purpose

This glossary is the **single source of truth** for Vietnamese terminology in the
TWEM translation. Every future re-translation, edit, or cleanup pass MUST use the
canonicals listed here. The pipeline currently is Google Translate (per
`README.md`); every entry below is a known drift point that MT does not handle
consistently.

When an entry is added or changed, update **both** this file and the matching
script (when one exists). When an entry is removed, sweep the corpus for
orphaned usages.

---

## 1. Canonical term table

| English source term | Canonical Vietnamese | Disallow | Notes |
|---|---|---|---|
| `All Creation` (skill) | **`Toàn Tạo`** | `Sáng Tạo Toàn Năng`, `Sáng Thế`¹, `Toàn Tạo Hóa`, EN form in prose | MC signature skill. Apply in status tables too. |
| `God Eye` (skill) | **`Thần Nhãn`** | `Thiên Nhãn`, `Con Mắt Thần`, `Mắt Thần`, EN form in prose | MC signature skill. |
| `Demon King` (title) | **`Ma Vương`** (always cap) | `ma vương` (lowercase) | Proper title. EN form preserved inside 『』 status blocks. |
| `Demon God` (Ma Thần) | **`Ma Thần`** | — | Consistent across corpus. |
| `Hero` (class, summonee) | **`Anh Hùng`** (cap when = the class) | `anh hùng` (lowercase = generic) | Class name. NOT a synonym for "knight". |
| `Knight` | **`hiệp sĩ`** | `Anh Hùng` | Distinct from "Hero" class. |
| `Magic` (prose) | **`phép thuật`** | `ma thuật` (28+), `ma pháp` (V8 dominant — see §3) | Use `phép thuật` in V1–V7 prose; see §3 for V8. |
| `Magic` (system table) | **`Phép`** (e.g. `Hỏa Phép`, `Thủy Phép`) | `Pháp` | Existing convention; do not break. |
| `Spell` | **`phép`** (with `thuật` if nominal) | `chú`, bare `thuật` | Standard morpheme. |
| `Monster` | **`quái vật`** | `quái thú`, `sinh vật` (use only for sentient races) | Established 185×. |
| `Dungeon` | **`hầm ngục`** | EN form `dungeon` (28× before fix) | Apply globally including V4. |
| `Labyrinth` (named place, e.g. Nargadia) | **`Mê Cung Nargadia`** | bare `dungeon` | Compound name. |
| `Boss` (game, end-of-floor) | **`trùm`** | `thủ lĩnh` (use for mob leader), `tướng`, EN `boss` | Reserve `boss` (EN) for in-game UI quotes only. |
| `Mana` (prose) | **`ma lực`** | `mana`/`Mana` lowercase in prose | Established 168×. |
| `Mana` (in spell names) | **`Ma Lực`** (Title Case) | `mana` (lowercase) | System-table convention. |
| `Heal` (spell name) | **`Hồi Phục`** (Title Case) | `chữa trị`, `Trị Liệu`, `Phép Thuật Hồi Phục` | `chữa trị` is the verb for out-of-combat "treat wounds". |
| `Goblin` | **`Goblin`** (loanword) | `yêu tinh` (which means elf elsewhere — see §4) | Avoid reader confusion. |
| `Elf` | **`Elf`** / **`tộc elf`** | `yêu tinh` (means goblin elsewhere) | Disambiguate. |
| `Maid` | **`hầu gái`** | `hầu cận` (Sino-VN) | Standard VN. |
| `Lord` (noble title) | **`Lãnh Chúa`** | `Quan` (low-rank official) | Disambiguate. |
| `Lord` (ruler/master) | **`chúa tể`** | `Quan` | |
| `King` (proper name) | **`Vua`** (cap) | `quốc vương` (use only in regnal "Trẫm" speech) | |
| `Princess` (royal) | **`công chúa`** | `tiểu thư` (noble miss, different concept) | |
| `Knight Commander` | **`Đội Trưởng Hiệp Sĩ`** | — | |
| `Royal Mage` | **`Pháp Sư Hoàng Gia`** | — | |
| `Appraisal` (skill) | **`Thẩm Định`** (Title Case in status table) | `Thẩm định` (sentence-case in prose), EN form | Spell/skill Title Case. |
| `Gift` (in-world term, prose) | **`Quà tặng thần thánh`** (full name) | `Gift` (EN) in prose | Use the in-world full name. |
| `Gift` (in 『』 status / system message) | **`Gift`** (keep EN, no quotes) | `Quà tặng` | Preserve foreign term inside system blocks. |
| `God` (the God character) | **`Thần`** | `Chúa` (Christian connotation), `God` (EN) | Neutral in-world term. |
| `Kusel` / `Kuzel` (former knight) | **`Kuzel`** (majority form, VI-only override) | `Kusel` (VI corpus) | See §5. |
| `Sofia` (innkeeper) | **`Sofia`** | `Sonia` (single typo, fixed) | |
| `Yuki Haruto` / `Haruto Yuki` (MC) | See §6 | — | Intentional narrative pattern, document only. |

¹ **`Sáng Thế` collision** — this string appears for two unrelated concepts:
the skill `All Creation` (incorrect) and the item-rarity tier `Sáng Thế` (the
highest tier, established in V1 ch7). A blanket find-replace would conflate
them. Always replace `Sáng Thế` → `Toàn Tạo` only inside skill-list / status-
table contexts (the line that contains `KỸ NĂNG ĐỘC NHẤT` / `Kỹ năng Đặc biệt`).
**Do not** touch the item-tier usage in V1 ch7.

## 2. Capitalization rules

- **Proper titles** (`Ma Vương`, `Ma Thần`, `Anh Hùng` as the class): always capitalized in narrative prose.
- **System-table terms** (`KỸ NĂNG`, `LV7`, `Hỏa Phép`, `Gift`): all-caps or Title Case as currently used. No drift.
- **Spells/skills by name** (`Hồi Phục`, `Đại Trị Liệu`, `Ngọn Lửa Phán Quyết`, `Thẩm Định`): Title Case in status tables and prose when used as a proper noun.
- **`Anh Hùng` (the class) vs `anh hùng` (the generic noun "hero")**: capitalized when referring to Haruto's class; lowercase for the generic concept ("trở thành anh hùng" = "become a hero"). Manual review needed for ambiguous cases.

## 3. V8 vocabulary drift (known unresolved)

Volume 8 uses `ma pháp` as the dominant form for "magic" (140+ instances)
whereas V1–V7 use `phép thuật` (118+). The 2026-06-12 cleanup pass converted
`ma thuật` (28×) → `phép thuật` but left `ma pháp` alone because:

- `ma pháp` is the V8 dominant form, not a drift
- A blanket V8 rewrite would touch 140+ instances with high risk of unintended side-effects
- The V8 system-table entries (`Ma Pháp`, `Hỏa Ma Pháp`) are a different convention from V1's `Phép` and may be intentional

**Action for future passes:** before any new V8 translation, decide whether to
retro-fit V8 to `phép thuật` / `Phép` (full unification, high effort) or
formally document `ma pháp` as a V8-internal canonical. Current state: both
forms coexist.

## 4. `yêu tinh` disambiguation

`yêu tinh` historically maps to **both** "goblin" and "elf" in this corpus:

- **goblin** (V1, V5, V6 — e.g. "Yêu Tinh Vương" = Goblin King, V5 ch4-part-2:62)
- **elf** (V4 ch10 — "ngôi làng elf" / "công chúa elf" appears within paragraphs that also use `yêu tinh` to refer to the elf race)

**Canonical:** `Goblin` (loanword, 17× already in V1) for the small monster;
`Elf` or `tộc elf` for the fantasy race. **Drop `yêu tinh` for elf** entirely.

Until this is fully swept, `yêu tinh` in any new chapter should be replaced
based on context: small hostile monster → `Goblin`; sentient long-lived
humanoid → `Elf`.

## 5. Kusel / Kuzel name split

The EN source has both `Kusel` (306) and `Kuzel` (323); the VI corpus mirrored
this drift. The 2026-06-12 cleanup standardized VI to **`Kuzel`** (the majority
form, 326 vs 301 before the fix; now 0 `Kusel` in VI). The EN source is left
untouched.

**Why Kuzel as canonical:** majority form in both EN and VI; the most
frequent romaji in the existing corpus. JP source is `クーセル` (Kusel) per
the agents' note, but the EN translator's choice (Kuzel) has been the
dominant rendering for 8 volumes, so VI matches EN.

**If a future pass resolves the JP romaji:** change EN first, then re-apply
the fix to VI.

## 6. `Yuki Haruto` vs `Haruto Yuki` (narrative pattern)

The MC's name appears in two orders:

- **`Yuki Haruto`** — family-first Japanese order, used in 1st-person narration ("tôi, Yuki Haruto, học sinh năm hai…").
- **`Haruto Yuki`** — given-first, used in 3rd-person references, system status screens, and dialogue from non-JP-aware characters.

**This is intentional, not a bug.** The two orders carry different narrative
weight. Do not unify. When a chapter has both forms, verify the form matches
the speaker's perspective (1st-person = Yuki Haruto, 3rd-person = Haruto Yuki).

## 7. Honorifics rule

In dialogue tags:

- Keep `-san`, `-sama` in direct speech (V8+ does this correctly: "Haruto-san", "Haruto-sama"). Don't translate.
- In narration, translate to `ngài` (honorific 3rd-person) or `cô`/`anh`/`chị`/`em`/`ông` (social-hierarchy Vietnamese).

`-kun` has not been observed in the sample. If a future volume introduces it,
apply the same rule (keep in direct speech, translate in narration).

## 8. Status-table styling (in-world game system)

Status tables (`| **TÊN:** | ... |`) follow these conventions:

- **Headers:** ALL-CAPS for the canonical field names (`TÊN`, `CẤP`, `TUỔI`, `CHỦNG TỘC`, `GIFT`, `KỸ NĂNG`, `KỸ NĂNG ĐỘC NHẤT`, `DANH HIỆU`, `CẤP ĐỘ`).
- **Skill/skill names in cells:** Title Case (`Hỏa Phép`, `Thủy Phép`, `Hồi Phục`, `Thẩm Định`, `Toàn Tạo`, `Thần Nhãn`).
- **Class / title in cells:** Title Case (`Anh Hùng`, `Ma Vương`).
- **Numeric stats:** no thousand-separator inside status tables (`**530**`, not `**530.000**`).

Inconsistent casing (`Kỹ năng Đặc biệt` vs `KỸ NĂNG ĐỘC NHẤT` in the same
volume) is a known drift in V1 status tables. Future passes should pick the
canonical per field and apply uniformly.

## 9. Disambiguation pairs (review before editing)

When a translation choice is ambiguous, prefer:

- **`Anh Hùng`** (class) over `anh hùng` (generic) when referring to Haruto's summonee group.
- **`hiệp sĩ`** (knight) over `Anh Hùng` when referring to kingdom knights.
- **`hầu gái`** (maid) over `hầu cận` (Sino-VN, more formal) in modern scenes.
- **`trùm`** (end-of-floor boss) over `thủ lĩnh` (mob leader).
- **`đồng vàng trắng`** (white-gold coin) for the in-world currency; `vàng` for gold material; reserve `đồng` for copper metal.

## 10. Source-side issues inherited from EN (not VI translation bugs)

The following are bugs in the EN source that VI inherited. Currently VI
diverges from EN on these to fix the reader experience locally:

| EN source issue | VI fix (applied) | Status |
|---|---|---|
| `volume-4/chapter-2-part-2.md` has `title: "."` and `# .` | VI: `"Chương 2 – Các Anh Hùng Đánh Mê Cung (Phần 2)"` | Applied 2026-06-12 |
| `volume-8/chapter-5-part-2.md` title says "Chapter 6" but file is part-2 of Ch5 | VI: `"Chương 5 – [Thiên Đường Thời Gian] Eleonora I"` | Applied 2026-06-12 (F7) |
| `Kusel`/`Kuzel` 306/323 split in EN | VI: `Kuzel` (majority, applied globally) | Applied 2026-06-12 |

When the EN source is fixed upstream, the VI overrides should be re-checked
to keep them in sync.

## 11. Items still pending review (open questions)

- **`yêu tinh` → `Goblin`/`Elf` corpus sweep** — 17+ instances, context-dependent. Recommended next pass: read each instance and replace based on whether the surrounding paragraph refers to small hostile monsters or the elf race.
- **`Anh Hùng` (class) capitalization in V1 side-stories** — generic "anh hùng" appears as the summoned-class group throughout V1 side-story-part-1. Decide whether to capitalize.
- **V8 `ma pháp` vs `phép thuật` unification** — see §3.
- **`Pháp` vs `Phép` in V8 system tables** — confirm with the translator whether V8's `Ma Pháp` system is intentional or a drift.
- **Kusel/Kuzel — verify against JP source** — if JP is `クーセル` (Kusel), the canonical should arguably be `Kusel`; current VI choice (Kuzel) follows the EN majority.
- **`Magic Bag` / currency terms** — not exhaustively sampled. Add to glossary after a corpus sweep.

---

## Maintenance

- Any new term not in this glossary is **out of policy**. Add it here first.
- When this glossary is updated, run a corpus grep for the old form to find all instances that need updating.
- See `plans/260612-1412-translation-consistency-review/synthesis-260612-1412-twem-translation-consistency.md` for the original review that produced this glossary.
