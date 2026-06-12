# Vietnamese TWEM Translation — Glossary & Consistency Review

**Scope:** Sampled volumes 1, 2, 3, 4, 6, 7, 8 (chapters 1, mid, last per vol where applicable) plus 1-2 side-stories. English source at `content/docs/twem-en/`, Vietnamese at `content/docs/twem/`.

**Method:** grep-based frequency counts of candidate proper nouns and skill names. Where source EN and VI both contain the same word (e.g. "God Eye" left in English in some volumes), the inconsistency is still flagged because reader expectations across volumes differ.

---

## 1. Glossary Table

| English name | Vietnamese renderings (count) | Notes |
|---|---|---|
| **Yuki Haruto** (MC, narrator) | `Yuki Haruto` (27), `Haruto Yuki` (10) | Both orders present. EN source also mixes (18 vs 16). "Yuki Haruto" is family-first Japanese order; "Haruto Yuki" appears in self-intros, system status, foreign dialogue. Pattern: 1st-person narrative uses **Yuki Haruto**, 3rd-person/system uses **Haruto Yuki**. Acceptable IF the rule is consistent. |
| **Usami Sayaka** (teacher) | `Usami Sayaka` (1, vol-1 ch1), `cô Usami` (27, throughout), `Sayaka Usami` (1, vol-3 ch9 — character's own self-intro) | Honorific "cô" used consistently. Name order: 1st-mention is `Usami Sayaka` (Japanese order) matching EN; 1 instance of reversed order is when she introduces herself in the other world. |
| **Mitsurugi Kento** | `Mitsurugi Kento` (2) | Consistent, rare (only chapter 1). |
| **Suruga Hayato** | `Suruga Hayato` (2) | Consistent, rare. |
| **Matsuba Ryo** | `Matsuba Ryo` (2) | Consistent, rare. |
| **Tendo Koji** | `Tendo` (1034), `Tendo Koji` (10), `Koji Tendo` (5) | Both orders exist. `Tendo` alone is the dominant form (93.5%). Pattern mirrors EN. |
| **Ichinomiya Suzuno** | `Ichinomiya Suzuno` (8), `Ichinomiya` (130), `Suzuno` (314) | `Ichinomiya` (surname) and `Suzuno` (given) used separately. Consistent. |
| **Orihara Shoya** | `Orihara Shoya` (2 — vol-1 ch2, vol-2 ch15), `Shoya Orihara` (1 — vol-3 ch9), `Orihara` (22) | Name order inconsistent across volumes. **FIX PRIORITY: low** (appears only in vol-1-3 context). |
| **Mariana** (Glicente princess) | `Mariana` (132), `công chúa Mariana` (6) | Consistent. `công chúa` used at first introduction or formal address. |
| **Finne** | `Finne` (1340) | Perfectly consistent. |
| **Iris** | `Iris` (955) | Perfectly consistent. |
| **Asha** | `Asha` (444) | Perfectly consistent. |
| **Ephyr** (elf princess) | `Ephyr` (383) | Perfectly consistent (no `Ephir`/`Ephia` variants found). |
| **Kusel / Kuzel** (former knight) | `Kuzel` (326), `Kusel` (306) | **Inconsistency mirrors EN source** (Kuzel 323, Kusel 306 in EN). EN has both, so likely a typo upstream. Not a VI-translation issue per se, but both forms are present. **FIX PRIORITY: medium** (recurring major side character). |
| **Fran** (Demon King) | `Fran` (358) | Consistent. |
| **Ilmina** (Saintess) | `Ilmina` (438) | Consistent. |
| **Charlotte** (War Princess) | `Charlotte` (94), `Char—Charlotte` (1 — only as an em-dash aside in vol-1) | The `Char—` aside matches EN source. Acceptable. |
| **Alogis** (1st Demon King) | `Alogis` (190) | Consistent. |
| **Lucifer** | `Lucifer` (188) | Consistent. |
| **Zero** (dragon) | `Zero` (422) | Consistent. |
| **Glatnis** (Behemoth) | `Glatnis` (64) | Consistent. Species name "Behemoth" used separately (69). |
| **Geil Forla Glicente** (king) | `Geil Forla Glicente` (2) | Consistent (rare mention). |
| **Barnar** | `Barnar` (106) | Consistent. |
| **Bacchus** | `Bacchus` (110) | Consistent. |
| **Glifas** (Knight Commander) | `Glifas` (52) | Consistent. |
| **Marvelle** (royal mage) | `Marvelle` (26) | Consistent. |
| **Sonia / Sofia** (innkeeper) | `Sofia` (used as primary, 1 mention of `Sonia` in vol-2 ch1) | 1 inconsistent mention: `volume-2/chapter-1.md` line "Finne và tôi vội vàng chào tạm biệt Jayn và Sonia" but rest of the corpus uses `Sofia`. **FIX PRIORITY: high** (single-character typo, easy to fix). |
| **Garguin** (guild master) | `Garguin` (only 1-2 mentions) | Consistent. |
| **Chronos** (Evil God) | `Chronos` (44) | Consistent. |
| **Lumen / Vermeil / Ishmael** | NOT FOUND in VI sample | Either not yet introduced or use English spelling. (Cannot verify, not in sample.) |
| **Glicente** (kingdom) | `Glicente` (162) | Consistent. |
| **Perdis** (kingdom) | `Perdis` (186) | Consistent. |
| **Galzio** (empire) | `Galzio` (79 VI vs 77 EN) | Slight count drift (2 extra in VI). Likely context-dependent new mentions. |
| **Belifaire** (Holy State) | `Belifaire` (48) | Consistent. |
| **Waxe** (town) | `Waxe` (27) | Consistent. |
| **Vaana** (border town) | `Vaana` (45) | Consistent. |
| **Nargadia** (labyrinth) | `Nargadia` (34), `Mê Cung Nargadia` (24) | Consistent. |
| **All Creation** (skill) | `All Creation` (14, EN form), `Toàn Tạo` (12+), `Sáng Tạo Toàn Năng` (3), `Sáng Thế` (1), `Toàn Tạo Hóa` (1) | **CRITICAL — 4+ variants**. Volume 1 uses `Toàn Tạo`; vol-1 ch10 mistakenly uses `Sáng Thế` (this is also an item-rarity tier!); vol-1 ch16/ch18 uses `Sáng Tạo Toàn Năng`; vol-2+ ch1-9 leaves skill name in English `All Creation`; vol-8 ch1 uses `Toàn Tạo Hóa`. **FIX PRIORITY: HIGH** (main character signature skill). |
| **God Eye** (skill) | `Thần Nhãn` (16), `Thiên Nhãn` (6), `Con Mắt Thần` (5), `Mắt Thần` (1), `God Eye` (24, EN form) | **CRITICAL — 5 variants**. Vol-1 mostly uses `Thần Nhãn`. Vol-2 short-story uses `Thiên Nhãn`. Vol-6 ch12-14 uses `Con Mắt Thần`. Vol-1 ch18 status table uses `Mắt Thần`. Vol-2 and Vol-3+ leave `God Eye` in English. **FIX PRIORITY: HIGH** (main character signature skill). |
| **Appraisal** (skill) | `Appraisal` (18, EN form), `Thẩm định` (13), `Thẩm Định` (8), `Đánh giá` (2 — context-dependent, not skill name) | Capitalization inconsistent (`Thẩm định` vs `Thẩm Định`). EN form left in vol-2/3. **FIX PRIORITY: medium**. |
| **Gift** (boon) | `Gift` (9, EN form), `Quà tặng` (10), `Quà Tặng` (1), `món quà` (3 — context-dependent), `Quà tặng thần thánh` (compound, many) | Mixed. The specific in-world term "Gift" is sometimes left in English, sometimes translated. **FIX PRIORITY: medium**. |
| **Hero** (title) | `Anh Hùng` (105), `Hero` (2 — inside 『』 quotes in vol-3 ch1, vol-5 ch1 status table) | The 2 EN forms are inside JP quote-brackets preserving in-world status. Acceptable, but vol-3 ch1 system-message keeps 『Hero』 while prose says `Anh Hùng`. |
| **Demon King** (title) | `Ma Vương` (371), `ma vương` (13), `Demon King` (5) | `Demon King` appears in vol-2 ch9 (status-title grant) and vol-6 ch18 (Danh hiệu list). Both EN forms are status/system messages. Acceptable, but **capitalization of `Ma Vương` vs `ma vương` is inconsistent** in narrative prose. |
| **Dimensional Storage** (skill) | `Dimensional Storage` (1, vol-3 ch12), `không gian lưu trữ` (48), `lưu trữ không gian` (1) | 1 lone EN instance. `không gian lưu trữ` dominates. |
| **Magic Bag** (item) | `Magic Bag` (left in English where present) | Not extensively sampled. |
| **Kingdom of Glicente** | `vương quốc Glicente` (38), `Vương quốc Glicente` (varies) | Common phrase. Consistent. |

---

## 2. Broken Consistency — Names with 2+ Renderings

### HIGH PRIORITY (recurring main character / signature concept)

1. **`God Eye` skill — 5 renderings**
   - `Thần Nhãn` (16) — vol-1 ch3, ch10
   - `Thiên Nhãn` (6) — vol-2 short-story, lines 16, 22, 26
   - `Con Mắt Thần` (5) — vol-6 ch12-part-2:98,110, vol-6 ch14-part-2:244
   - `Mắt Thần` (1) — vol-1 ch18:351 (status table)
   - `God Eye` (24, EN) — vol-2, vol-3, vol-4, vol-5, vol-7 leave skill name in English
   - **Recommend:** pick one (likely `Thần Nhãn` — most common, idiomatic) and convert all. Leave `God Eye` only when it's inside a 『』 status block, otherwise translate.

2. **`All Creation` skill — 4+ renderings**
   - `Toàn Tạo` (12) — vol-1 ch3, ch4, ch16
   - `All Creation` (14, EN) — vol-2 ch1, ch5, ch14; vol-3 ch11, ch16; vol-4 ch1; vol-5 ch1; vol-7 ch17
   - `Sáng Tạo Toàn Năng` (3) — vol-1 ch16:379,395; vol-1 ch18:351
   - `Sáng Thế` (1, WRONG) — vol-1 ch10:337 status table (this is also the in-world name of the highest item-rarity tier; using it as a skill name is a conflation)
   - `Toàn Tạo Hóa` (1) — vol-8 ch1-part-2:164
   - **Recommend:** pick one (likely `Toàn Tạo`) and convert all. **CRITICAL: fix vol-1/chapter-10.md line 337 — `Sáng Thế` is wrong here.**

3. **`Kusel` / `Kuzel` — name spelling inconsistent** (326 vs 306 instances, mostly `Kuzel` wins)
   - This mirrors EN source — both `Kusel` (306 in EN) and `Kuzel` (323 in EN) exist upstream.
   - **Recommend:** confirm the Japanese romaji from the JP source (`クーセル` would be `Kusel`, `クーゼル` would be `Kuzel`), then pick one for VI. Likely the JP is `クーセル` and the official romanization is `Kusel`.

### MEDIUM PRIORITY (side characters, recurring items)

4. **`Appraisal` skill — 3 renderings + capitalization drift**
   - `Appraisal` (18, EN) — vol-2 status tables
   - `Thẩm định` (13) — vol-6 ch16-part-1, vol-7 ch13-part-2
   - `Thẩm Định` (8) — vol-2 ch2, ch13; vol-4 ch2-part-2 status
   - **Recommend:** pick one capitalization (`Thẩm Định` for status table cells, `Thẩm định` for prose, or unify). Translate status-table skill names.

5. **`Gift` (divine boon) — EN/VI mix**
   - `Gift` (9) — vol-2 ch1:10,16; vol-3 ch1:10,14; vol-4 ch1:10,14
   - `Quà tặng` (10) — vol-1 ch2:142,148,185,213,225,307; vol-1 ch3:26,117
   - `Quà Tặng` (1) — minor caps
   - `Quà tặng thần thánh` (compound, in vol-1)
   - **Recommend:** when "Gift" is the in-world proper noun (system message, title in 『』), keep `Gift` (capitalized, no quotes). When translated in prose, use `Quà tặng thần thánh` (the in-world full name). Don't mix.

6. **`Yuki Haruto` vs `Haruto Yuki` — name order**
   - 27 vs 10 instances in VI. EN source has 18 vs 16. The narrative pattern is established (1st-person narrator uses `Yuki Haruto`, system/3rd-person uses `Haruto Yuki`) but it's not 100% rule-following.
   - **Recommend:** document the convention. Not a "fix" if the rule is intentional.

7. **`Danh hiệu` capitalization in status tables**
   - `KỸ NĂNG ĐỘC NHẤT` (22) — vols 1, 2, 3, 4
   - `Kỹ năng Độc nhất` (10) — vol-1
   - `KỸ NĂNG` (50) — generic
   - **Recommend:** pick one casing per label. All-caps for system tables is fine, but mixing in the same volume (vol-1 has both) is jarring.

### LOW PRIORITY (rare mentions)

8. **`Orihara Shoya` vs `Shoya Orihara`**
   - vol-1/chapter-2.md:46 — `Orihara Shoya` (matches EN)
   - vol-2/chapter-15.md:130 — `Orihara Shoya` (matches EN)
   - vol-3/chapter-9.md:304 — `Shoya Orihara` (REVERSED)
   - **Recommend:** change vol-3/chapter-9.md line 304 to `Orihara Shoya`.

9. **`Sofia` vs `Sonia` (innkeeper)**
   - vol-1/chapter-1.md (and onward): `Sofia`
   - vol-2/chapter-1.md (last paragraph): `Sonia`
   - **Recommend:** fix `volume-2/chapter-1.md` — change `Sonia` → `Sofia`. Likely a typo in one chapter.

10. **`Demon King` title — `Ma Vương` vs `ma vương`**
    - 371 vs 13 — capitalization is mostly `Ma Vương` but 13 instances of lowercase.
    - **Recommend:** when referring to **the title / Alogis's role**, use `Ma Vương`. When used generically ("a demon king"), lowercase is fine. Currently some vol-3/7 chapters drop the cap mid-sentence.

11. **`Thần` vs `Chúa` for "God"**
    - `Thần` (203), `Chúa` (69), `God` (25)
    - Vol-1 uses `Thần` 43 times vs `Chúa` 1. Vol-3 uses `Thần` 0 times, `Chúa` 8 times.
    - **Recommend:** consistent terminology. The "God" character in vol-1 is referred to as `Thần` or `Chúa` inconsistently. Pick one. (Note: `Chúa` literally means "Lord" and is also the Vietnamese word for "God" in Christian sense — may have religious overtones; `Thần` is more neutral. Recommend `Thần` for the in-world God character.)

12. **`Danh hiệu` list format in vol-6 ch18-part-2 line 305**
    - All English: `Otherworlder`, `Monarch of War`, `Monarch of Magic`, `Transcendent One`, `EX Rank Adventurer`, `Demon King`, `Annihilator`, `The World's Strongest`
    - Same vol mostly uses Vietnamese elsewhere. This title-list is a clear translation miss.

---

## 3. Fix Priority Ranking

| # | Priority | Item | Effort | Impact |
|---|---|---|---|---|
| 1 | HIGH | `All Creation` (4+ variants, including 1 wrong `Sáng Thế`) | medium | Main character signature skill, appears in every volume |
| 2 | HIGH | `God Eye` (5 variants) | medium | Main character signature skill, appears in every volume |
| 3 | HIGH | `Sofia` typo in vol-2/chapter-1.md (last paragraph) | trivial | Single character name, easy fix |
| 4 | HIGH | vol-6 ch18-part-2 line 305 — title list fully untranslated | medium | Status table is reader-facing; full English entry stands out |
| 5 | MEDIUM | `Kusel` vs `Kuzel` (upstream choice — verify JP source first) | medium | Recurring side character (306+ VI instances) |
| 6 | MEDIUM | `Appraisal` capitalization + EN/VI mix | low | Recurring skill |
| 7 | MEDIUM | `Gift` — keep `Gift` in system, `Quà tặng thần thánh` in prose | low | Plot-critical term |
| 8 | MEDIUM | `KỸ NĂNG ĐỘC NHẤT` vs `Kỹ năng Độc nhất` casing | low | Status-table format |
| 9 | MEDIUM | `Thần` vs `Chúa` for the God character | low | Vol-1-8 spread |
| 10 | LOW | `Orihara Shoya` vs `Shoya Orihara` — vol-3/chapter-9.md line 304 | trivial | Single mention, minor character |
| 11 | LOW | `Demon King` capitalization (`Ma Vương` vs `ma vương`) | low | Vol-3/7 occurrences |
| 12 | LOW | `Yuki Haruto` vs `Haruto Yuki` — document the rule | none | Pattern is established, just needs a convention doc |

---

## 4. Source-side notes (not translation issues, but reader-visible)

- The English source itself has `Kusel`/`Kuzel`, `Tendo Koji`/`Koji Tendo`, `Yuki Haruto`/`Haruto Yuki` mix. The Vietnamese translation faithfully mirrors these drifts. If the JP source uses one canonical form, the EN and VI should both be updated.
- The `Sáng Thế` item tier (vol-1/chapter-7) and the `Sáng Thế` skill name in vol-1/chapter-10 line 337 are **the same word in Vietnamese** for two different things ("Creation" tier vs "All Creation" skill). This is a translation hazard — a global search-and-replace would conflate them.

---

**Status:** DONE_WITH_CONCERNS
