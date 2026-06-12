# Terminology Consistency Review — TWEM Vietnamese Translation

**Scope:** Volumes 1, 4, 8 (sample)
**Source:** `/config/workspace/tienthieusac/tienthieusac.github.io/content/docs/twem-en/`
**Target:** `/config/workspace/tienthieusac/tienthieusac.github.io/content/docs/twem/`
**Method:** substring + word-boundary counts of every plausible Vietnamese rendering, with file:line evidence for the highest-impact inconsistencies.

## 1. Summary table

| # | English term | Vietnamese variants (counts in V1+V4+V8) | Verdict |
|---|---|---|---|
| 1 | **Demon King** (71 in EN) | `Ma Vương` 65 / `ma vương` 7 | **INCONSISTENT — capitalization drift.** The 7 lowercase `ma vương` should be `Ma Vương` because the term is a proper title. |
| 2 | **Hero** (52 in EN) / **Heroes** (93) | `Anh Hùng` 51 / `anh hùng` 96 / `hiệp sĩ` 47 | **INCONSISTENT — overload.** `Anh Hùng` / `anh hùng` is the canonical "summoned hero" (Haruto's class); `hiệp sĩ` is reserved for **knight**. The two are mixed (e.g. `anh hùng` is used for generic knights in vol 1). |
| 3 | **Magic** (661 in EN) | `ma pháp` 140 / `phép thuật` 118 / `ma thuật` 28 | **INCONSISTENT — same concept, three labels.** `phép thuật` dominates V1+V4; `ma pháp` dominates V8; `ma thuật` is a minority variant. Recommend one canonical term. |
| 4 | **Spell** (72 in EN) | `phép` 188 / `thuật` 171 / `chú` 30 / `ma pháp` (overlap) | **INCONSISTENT — bare-word variants.** "Spell" rendered as `phép`, `thuật`, `chú` in differing contexts. Standardize to one construction. |
| 5 | **Monster** (103 in EN) | `quái vật` 185 / `quái` 195 (overlap) / `quái thú` 1 / `sinh vật` 2 | **MOSTLY OK** but `quái thú` (1×) and `sinh vật` (2×) are stray one-offs. `quái vật` is canonical. |
| 6 | **Dungeon** (49 in EN) | `dungeon` 28 (EN kept) / `hầm ngục` 22 / `Mê Cung` 16 / `hang ổ` 11 | **INCONSISTENT — English kept 28×.** `dungeon` is left untranslated in V4 ch1,3,4,14,15,16; should standardize to one VN term. |
| 7 | **Boss** (75 in EN) | `trùm` 51 / `thủ lĩnh` 45 / `tướng` 6 / `boss` 5 | **INCONSISTENT — three labels + English kept 5×.** "Trùm" / "trùm cuối" for end-of-floor boss is canon, but `thủ lĩnh` is also used (some meaning "leader" rather than "boss" — context-dependent). |
| 8 | **King (ruler)** (96 in EN) | `vua` 66 / `Vua` 4 / `quốc vương` 1 / `đức vua` 1 | **MOSTLY OK** (capitalization drift only). |
| 9 | **Lord (noble)** (27 in EN) | `Quan` 8 / `Lãnh Chúa` 0 / `chúa tể` 12 | **INCONSISTENT.** `Quan` (8×) is used for the title; `chúa tể` (12×) is used for "ruler/master". Need to disambiguate. |
| 10 | **Maid** (16 in EN) | `hầu gái` 23 / `hầu cận` 12 | **INCONSISTENT — "hầu cận" is Sino-Vietnamese form.** "Hầu cận" appears in V4 ch1 (formal register); "hầu gái" elsewhere. Pick one. |
| 11 | **Heal / healing** (30 in EN) | `hồi phục` 51 / `chữa trị` 9 / `trị liệu` 1 / `Hồi Phục` 6 / `Trị Liệu` 1 | **INCONSISTENT — multiple spell/skill names.** "Hồi phục" and "Trị Liệu" and "Phép Thuật Hồi Phục" all used for the same healing concept. |
| 12 | **Level** (120 in EN) | `cấp` 176 / `cấp độ` 33 / `Lv` 6 | **MOSTLY OK** — `cấp` is dominant, `cấp độ` is used in dialog, `Lv` is system-table style. Acceptable. |
| 13 | **Skill** (188 in EN) | `kỹ năng` 218 / `KỸ NĂNG` 44 | **OK — capitalization only** (system-table uses all-caps, prose uses lowercase). |
| 14 | **Status (game screen)** (54 in EN) | `trạng thái` 60 / `chỉ số` 6 / `status` 2 (in front-matter only) | **MOSTLY OK** — `trạng thái` is the "status screen" reading; `chỉ số` is "stats/ability score". Distinct concepts, used correctly. |
| 15 | **Mana** (41 in EN) | `ma lực` 168 / `mana` 18 / `Mana` 4 | **INCONSISTENT — English kept 22×.** `ma lực` is dominant. Capitalize-cased `Mana` is used in system tables. Acceptable but `mana` lowercase appears in dialog. |
| 16 | **Elf** (15 in EN) | `elf` 20 / `Elf` 2 / `yêu tinh` 17 (overlap with goblin) | **RISKY OVERLAP.** `yêu tinh` means both "goblin" (V1) and is used to describe "elf" (vol 4 ch10 "Bắt cóc công chúa elf?"). Differentiate. |
| 17 | **Goblin** (13 in EN) | `Goblin` 17 / `yêu tinh` 17 | **INCONSISTENT — same VN word as elf.** Pick `goblin` (loanword) or differentiate. |
| 18 | **Dragon** (64 in EN) | `rồng` 50 / `Long` 4 | **MOSTLY OK** — `Long` appears in title compounds (Long Vương, Hắc Long Luyện Kim) which is Sino-Vietnamese formal. |
| 19 | **Princess** (63 in EN) | `công chúa` 47 / `tiểu thư` 2 | **MOSTLY OK** — `tiểu thư` is the noble-young-lady honorific (different concept), used 2×. |
| 20 | **Knight** (18 in EN) | `hiệp sĩ` 47 / `kỵ sĩ` 2 | **OK** — `kỵ sĩ` is a rare Sino-Vietnamese variant, used 2×. |
| 21 | **Teleport** (4 in EN) | `dịch chuyển` 15 / `thuật dịch chuyển` 1 | **MOSTLY OK** — 1 stray "thuật dịch chuyển". |
| 22 | **gold/coin** (28 in EN) | `xu` 404 / `đồng` 201 / `tiền` 74 / `vàng` 53 / `đồng vàng` 10 | **CONFUSING MIX.** "đồng" in VN means "copper" but is also used for "coin" (probably a translation of JP 銅 "coin" → "đồng"). `xu` is "small coin"; `vàng` is "gold". See note below. |
| 23 | **castle** (64 in EN) | `lâu đài` 61 / `thành` 128 / `cung` 15 | **MOSTLY OK** — `thành` covers both "city" and "castle" depending on compound. |
| 24 | **town/city** (57+ in EN) | `thành phố` 7 / `thị trấn` 53 / `phố` 11 / `kinh thành` 2 / `thành` 128 | **MOSTLY OK** — `thành` is polysemous (castle/city) and works in compounds. |
| 25 | **honorifics** (-san, -kun, -sama) | `-san` 3 (V8) / `-sama` 1 (V8) | **INCONSISTENT — most occurrences dropped.** `Haruto-san`, `Haruto-sama` are used in V8; in V1+V4 honorifics are translated to VN pronouns (e.g., `ngài`, `cô`, `chị`). |
| 26 | **Demon (general)** (87 in EN) | `ma` 534 / `quỷ` 20 / `ác quỷ` 2 / `yêu ma` (overlap) | **MOSTLY OK** — `ma` is broad; `quỷ` is reserved for the demon race (V8 Vol 8 demon world). |
| 27 | **Demon God (Ma Thần)** | `Ma Thần` 29 | **OK** — consistent. |
| 28 | **Demon Lord (Demon Lord Alogis)** | `Quỷ Vương` (not in sample) | **NEEDS CHECK** — appears in V8 ch7, requires more review. |
| 29 | **Hunter, Cleric, Mage, Warrior** (low frequency) | `thợ săn`, `linh mục`, `pháp sư`, `chiến binh` | **OK** — all 1–2× in sample. |
| 30 | **System terms** (status, quest, party, level) | `trạng thái` / `nhiệm vụ` / `nhóm` / `cấp` | **OK** — `nhiệm vụ` (21×) and `yêu cầu` (76×) coexist for "quest" but the latter is "request". |

## 2. Top-15 terminology-fix priority list

Each row = concrete file:line where the inconsistency shows up.

| Prio | Term | Issue | Location (file:line) | Recommended canonical form |
|---|---|---|---|---|
| **1** | **Demon King** | `ma vương` lowercase where it should be a proper title | `content/docs/twem/volume-1/side-story-part-1.md:114`, `side-story-part-3.md:22,88, 91`; `volume-4/chapter-15-part-1.md:212` | **`Ma Vương`** (always capitalized) |
| **2** | **Hero** | "anh hùng" used for both `summoned Hero` (Haruto) and `generic hero/knight`; `hiệp sĩ` ("knight") used for heroes' companions | `content/docs/twem/volume-1/side-story-part-1.md:34, 124, 212, 244, 248, 260, 264, 266, 270, 272, 282, 288` (entire side story refers to "anh hùng" but many are actually knights/warriors) | **`Anh Hùng`** for the summoned class; **`hiệp sĩ`** reserved for knights; **`chiến binh`** for generic warriors |
| **3** | **Magic** | `phép thuật` (V1+V4) vs `ma pháp` (V8) vs `ma thuật` (mixed) | `volume-1/chapter-10.md:218` (`phép thuật`) vs `volume-1/chapter-11.md:202` (`ma thuật`) vs `volume-8/chapter-2-part-2.md:166` (`ma pháp`) | **`ma pháp`** (matches `ma lực`/mana system) **or** **`phép thuật`** — pick one. (Note: V1 system tables already use `Hỏa Phép`/`Thủy Phép` style, so `Phép` as bare word is established. Recommend `phép thuật` for prose, `Pháp` for system tables — but unify on one root.) |
| **4** | **Dungeon** | English "dungeon" left untranslated 28× | `volume-4/chapter-1.md:22, 42, 114`; `volume-4/chapter-3-part-1.md:108`; `volume-4/chapter-4.md:...`; `volume-4/chapter-14-part-1.md:...`; `volume-4/chapter-15-part-1.md:...`; `volume-4/chapter-16-part-1.md:...` | **`hầm ngục`** (already used 22×, well-established) |
| **5** | **Boss** | `trùm` (51) / `thủ lĩnh` (45) / `tướng` (6) / `boss` (5 EN kept) — used interchangeably | `volume-1/side-story-part-2.md:100, 102, 163` keeps `boss` (game-UI) and `trùm`; `volume-4/chapter-1.md:42` uses `quái vật` and `thủ lĩnh` interchangeably | **`trùm`** for end-of-floor boss; **`thủ lĩnh`** for mob leader (different concept); `boss` (English) only for in-game UI references |
| **6** | **Mana** | `ma lực` (168) vs `mana`/`Mana` (22) | `volume-4/chapter-3-part-1.md:220`, `chapter-3-part-2.md:106, 202`, `chapter-4.md:176`, `chapter-13-part-2.md:216` | **`ma lực`** (Vietnamese, dominant); `Mana` (capitalized) only in formal spell/skill names |
| **7** | **Heal / healing** | `hồi phục` (51) / `chữa trị` (9) / `Trị Liệu` (1) / `Phép Thuật Hồi Phục` (1) — multiple names for the same spell | `volume-1/chapter-5.md:290` ("Đại Trị Liệu") vs `volume-4/chapter-1.md:124` ("phép hồi phục") vs `volume-4/chapter-2-part-2.md:126` ("Phép Thuật Hồi Phục") vs `volume-8/chapter-5-part-2.md:96` ("chữa trị") | **`Hồi Phục`** for the spell (Title Case for spell name); `hồi phục` for the verb; `chữa trị` reserved for "treat wounds" (out-of-combat) |
| **8** | **Elf vs Goblin** | `yêu tinh` used for **both** "goblin" (V1) and "elf" (V4 ch10) | `volume-1/chapter-2.md:427` ("yêu tinh" = goblin) vs `volume-4/chapter-10-part-1.md:14, 18` ("ngôi làng elf", "công chúa elf") | **`Goblin`** (loanword, 17× already in V1) for the small monster; **`Elf`** (loanword) or **`tộc elf`** for the fantasy race. Drop `yêu tinh` for elf. |
| **9** | **Lord / ruler** | `Quan` (8) / `chúa tể` (12) / `Lãnh Chúa` (0 in sample) | `volume-1/chapter-10.md:341` (Quan = "lord" noble title in system table); `volume-8/chapter-1-part-1.md:14` ("Ma Vương Fran – vua của loài quỷ") | **`Quan`** for feudal lord/noble title; **`chúa tể`** for "ruler/master" of a domain; **`Vua`** for king. Document the distinction. |
| **10** | **Maid / hầu cận vs hầu gái** | `hầu gái` (23) / `hầu cận` (12) | `volume-4/chapter-1.md:18` ("hầu cận Asha") vs `volume-4/chapter-10-part-1.md:148` ("các hầu gái"); `volume-8/chapter-1-part-1.md:36` ("Asha – hầu gái của Iris") | **`hầu gái`** (standard VN); `hầu cận` only in formal Sino-VN register if needed. Pick one. |
| **11** | **Heroes (plural)** | "heroes" is sometimes `anh hùng` (lower), sometimes `các anh hùng`, sometimes `hiệp sĩ` (mixed with knight) | `volume-1/chapter-2.md:72` ("các anh hùng") vs `volume-1/chapter-10.md:326` ("mấy anh hùng kia") vs `volume-4/chapter-1.md:22` ("nhóm anh hùng") | **`Anh Hùng`** when referring to Haruto's class; **`những người anh hùng`** for "the heroes" as a generic group; never use `hiệp sĩ` as a synonym |
| **12** | **gold/coin** | `xu` (404) / `đồng` (201) / `vàng` (53) / `tiền` (74) / `đồng vàng` (10) — heavy overlap, "đồng" technically means "copper" | `volume-1/chapter-10.md:361` ("tám đồng vàng trắng"); `volume-4/chapter-11-part-1.md:110` ("hai đồng vàng") | **`đồng vàng trắng`** for "white-gold coin" (already established); **`vàng`** for gold (currency/material); **`đồng`** reserved for the metal copper. Avoid `xu` for large denominations. |
| **13** | **Skill (capitalization)** | `kỹ năng` (218) vs `KỸ NĂNG` (44) — only system-table style, mostly OK but verify in new chapters | system tables in `volume-1/chapter-10.md:343`, `volume-4/chapter-2-part-2.md:115, 116, 122, 160`, `volume-4/chapter-16-part-2.md:122` | **`KỸ NĂNG`** (all caps) in system table header; **`kỹ năng`** in prose. Already consistent — flag for QA. |
| **14** | **Level (capitalization)** | `cấp` (176) / `cấp độ` (33) / `Lv` (6) / `LV` (system tables) — `Lv` style appears in V4 ch2 ch6 ch16 | `volume-4/chapter-2-part-2.md:116, 160` (system table: `LV7`); `volume-4/chapter-6-part-1.md:113`; `volume-4/chapter-16-part-2.md:122` | **`cấp`** in prose; **`Lv`** in system tables (matches the format used by the in-world game system). OK. |
| **15** | **honorifics -san, -sama** | Most occurrences are dropped/translated to `ngài`/`cô`; only V8 retains `-san`/`-sama` directly | `volume-1/chapter-1.md:38` ("san" appears as `san` in noise context); `volume-8/chapter-1-part-1.md:86` ("Haruto-san"); `volume-8/chapter-7-part-2.md:302` ("Haruto-sama") | **Keep `-san`/`-sama` for dialog tags** in V8+ (matches in-world formality); translate to `ngài`/`cô` in narration. Document the rule. |

## 3. Recommendations summary

### Canonical term decisions (apply to all volumes)

| Concept | Canonical VI | Disallowed alternatives | Why |
|---|---|---|---|
| Demon King (title) | **`Ma Vương`** | `ma vương` (lowercase) | Proper title, always capitalized |
| Hero (class) | **`Anh Hùng`** | `anh hùng` for the class; `hiệp sĩ` | Class name; not a synonym for "knight" |
| Knight | **`hiệp sĩ`** | `Anh Hùng` | Distinct from "Hero" class |
| Magic (concept) | **`phép thuật`** (prose) / **`Phép`** (system table) | `ma thuật` (28×), `ma pháp` (140×) | Already established in V1+V4 system tables as `Hỏa Phép` etc. |
| Spell | **`phép`** (with `thuật` if noun) | `chú`, `ma pháp` | `phép` is the base morpheme |
| Monster | **`quái vật`** | `quái thú`, `sinh vật` (for sentient races) | Established 185× |
| Dungeon | **`hầm ngục`** | `dungeon` (English) | Established 22×, loanword not needed |
| Boss (game) | **`trùm`** | `thủ lĩnh`, `boss` (EN), `tướng` | Use `thủ lĩnh` only for "leader" of a mob |
| Mana | **`ma lực`** | `mana`/`Mana` in prose | Established 168×; allow `Mana` only in spell names |
| Heal (spell) | **`Hồi Phục`** (Title Case for spell name) | `chữa trị`, `Trị Liệu` | Spell names are Title Case |
| Goblin | **`Goblin`** (loanword) | `yêu tinh` (which means "elf" elsewhere) | Avoid confusion with elf |
| Elf | **`Elf`** (loanword) / **`tộc elf`** | `yêu tinh` | Disambiguate from goblin |
| Maid | **`hầu gái`** | `hầu cận`, `maid` (EN) | Standard VN term |
| King (ruler) | **`Vua`** (proper) / **`vua`** (common) | `quốc vương` (use only in formal regnal "Ta/Trẫm" speech) | |
| Lord (noble title) | **`Lãnh Chúa`** (capitalized) | `Quan` (when used as a low-rank official) | Differentiate "lord of a domain" from "official" |
| Princess (royal) | **`công chúa`** | `tiểu thư` (noble miss, not princess) | |
| Fiancée | **`hôn thê`** | `vợ chưa cưới` | Established |
| Butler | **`quản gia`** | `người hầu` (servant, not butler) | |

### Capitalization rules

- **Proper titles** (Demon King, Hero class, etc.): always capitalized. Audit V1 side-stories for the 7 `ma vương` instances.
- **System-table terms** (`KỸ NĂNG`, `LV7`, `Hỏa Phép`, `Gift`): all-caps or Title Case as appropriate, as currently used. No prose drift.
- **Spells and skills by name**: Title Case (`Hồi Phục`, `Đại Trị Liệu`, `Ngọn Lửa Phán Quyết`).

### Honorifics rule

- Keep `-san`, `-sama` in **direct speech** (V8+ does this correctly). Translate to `ngài`/`cô` in **narration**.
- `-kun` is not used in the sample — confirm if it appears in V2/V3/V5/V6/V7.

## 4. What to do next

1. **Audit all 7 `ma vương` (lowercase) instances** and capitalize to `Ma Vương`.
2. **Search-and-replace `dungeon` → `hầm ngục`** in V4 (28 instances).
3. **Replace `mana`/`Mana` → `ma lực`** in prose, except where the in-world game system displays "Mana" as a literal.
4. **Replace `yêu tinh` (when referring to elf) → `Elf` or `tộc elf`**.
5. **Reconcile `anh hùng` / `hiệp sĩ`**: clarify the side-story ch1 uses both for the same summoned group.
6. **Add a glossary** in `content/docs/twem/_index.md` (or a new `docs/translation-glossary.md`) listing these canonical terms for future translators.

## 5. Unresolved questions

1. **V2/V3/V5/V6/V7** were not in this sample. Do `ma vương` (lowercase), `dungeon` (EN), `mana` (EN) patterns persist there? — Recommended: extend the same script across all 8 volumes before fixes.
2. **`Demon Lord Alogis`** appears in V8 ch7:1; the VN rendering needs separate check (V8 is in sample but I didn't grep for "Demon Lord" specifically beyond one occurrence in EN).
3. **"Pháp" vs "Phép"** in the in-world game system (`Hỏa Phép`, `Thủy Phép`): is `Phép` the noun root, and `phép thuật` the nominalized form, or are these competing? — The sample shows `Phép` is used as a stand-alone term in system tables (e.g. `Hỏa Phép LV5`), while `phép thuật` is used in prose. This is acceptable; recommend documenting it.
4. **`quỷ tộc`** (V8 ch2-part-1) vs **`Ma Tộc` / `yêu tộc`** (V1 ch2) — both mean "demon race". Are these interchangeable or do they refer to different demon sub-races? — Needs story-context clarification.
5. **`chức năng` / `Skill`** — `skill` in V4 ch11 sometimes appears as `Skill` capitalized in pseudo-system notes. Verify if any skill names use inconsistent capitalization.

**Status:** DONE_WITH_CONCERNS
