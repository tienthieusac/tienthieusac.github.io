# TWEM Vietnamese Translation — Tone, Register & MT-Artifact Review

**Sample scope:** Volume 1 (ch1, ch18), Volume 4 (ch1, ch17), Volume 8 (ch1-part-1, ch9 [placeholder])
**Source comparison:** `/content/docs/twem-en/`
**Method:** 6 VN files read in full + 5 EN counterparts + Grep pattern sweeps

---

## 1. Verdict Summary

| Category | Verdict | Notes |
|----------|---------|-------|
| **1st-person pronoun consistency** | Mostly stable, **1 hard MT inconsistency** | Narrator uses `tôi` throughout; one stray `tụi tớ` in classmate dialogue that should be `tụi tao` (line 58, V1 ch1). |
| **Address-term consistency (cô/anh/chị/em/ông)** | Consistent and well-chosen | `cô Usami` used uniformly for the teacher; `cô` (Asha/Iris), `anh` (Tendo), `ông` (Garguin) follow natural VN social-hierarchy rules. |
| **MT artifacts (untranslated chunks)** | **Low but present** | One corrupted character string ("mưvarried"), 1 line of English profanity kept verbatim (matches EN source), and several English game-term calques (`Gift`, `dungeon`, `cheat`, `clear`) left in quotes or mid-sentence. |
| **MT artifacts (Japanese brackets `「」`)** | **None** in sample | Good — pure `"…"` ASCII quotes used everywhere. |
| **Ellipsis consistency** | Consistent | Only `…` (U+2026) used, zero `...` three-dots. |
| **Number/measurement format** | Internally inconsistent | Mixes `1m50`, `200.000` (VN thousand-sep with dot), `300.000`, `200.000` — but no `cm`-style. Issue is the **dot** for thousands: in VN, thousand sep is `.` so this is actually correct; but mixing `1m50` with `355` (raw int) is informal/fine. |
| **Tone / register shifts in same line** | Mostly clean | Court-princess uses `thần` (humble royal 1st-p) and `các vị` — matches English tone. Garguin uses `ta` (archaic) — character-appropriate. No unwarranted shifts. |

---

## 2. Pronoun Counts (Sampled Chapters)

| File | `tôi` | `tớ` | `mình` | `ta` | `chúng tôi` | `cậu` | `bạn` |
|------|------|------|--------|------|-------------|-------|-------|
| V1 ch1 | 42 | **1** | 4 | 6 | 14 | 3 | 16 |
| V1 ch18 | 101 | 0 | 7 | 13 | 17 | 25 | 0 |
| V4 ch1 | 51 | 0 | 8 | 7 | 13 | 6 | 7 |
| V4 ch17 | 81 | 0 | 8 | 4 | 19 | 4 | 7 |
| V8 ch1-p1 | 66 | 0 | 2 | 8 | 14 | 2 | 4 |
| V8 ch9 | 0 | 0 | 0 | 0 | 0 | 0 | 0 (placeholder) |

**Findings:**
- Narrator is overwhelmingly `tôi` (formal, 1st-person). Consistent across all chapters.
- The single `tớ` in V1 ch1 is in **dialogue** (Mitsurugi), not narration — but the line says `tụi tớ` (we, casual-plural). Mitsurugi and his gang are hostile classmates of the same age — `tụi tao` or `tụi tui` (rough, Southern) would fit the bullying register better. This is a **register mismatch**, not a narrator-switch:
  - `content/docs/twem/volume-1/chapter-1.md:58` — `"Hả? Tại sao tụi tớ phải làm cái việc đó chứ?"` (EN: "we have to do something like that?")
- `mình` appears as 1st-person in **other characters' dialogue** (Finne in V4 ch1:30, V4 ch17, V8 ch1-p1:128) — appropriate, casual register between friends/partners. Not a bug.
- `ta` appears in 3rd-person "that/this/older-male-self" usages AND in dialogue (Garguin in V1 ch18:34, 40 — self-refers as `ta` because he's a gruff, older guild master). **Character-appropriate**, not a bug.

---

## 3. Address Terms — Consistency Verdict

| Speaker → Addressee | Term used | Consistent? |
|---------------------|-----------|-------------|
| Students → homeroom teacher | `cô Usami` (V1 ch1: passim) | ✅ |
| MC → Iris / Asha | `cô ấy` (V4 ch1:32, V8 ch1-p1: passim) | ✅ |
| MC → Tendo (male classmate, leader) | `anh ấy` / `Tendo` | ✅ (consistent with peer-respect) |
| MC → Garguin (old guild master) | `ông` / `ông ta` | ✅ (appropriate for older stranger) |
| Students → MC | `Haruto` (name only) / `bạn` (formal) | ✅ |
| Classmate → class | `các bạn` / `mọi người` | ✅ |
| Princess Mariana → MC and class | `các vị` (formal, court-honorific) | ✅ (matches EN "noble heroes") |
| Kusel → MC | `em` (self-deprecating, MC is higher rank) | ✅ |

**Verdict:** No address-term drift detected. Social hierarchy (cô/chị/anh/em/ông) is applied per character relationship and is internally consistent.

---

## 4. MT-Artifact Counts

### 4.1 Stray English / untranslated chunks

| Pattern | Count (sample) | Top examples |
|---------|---------------|--------------|
| Untranslated English character-string corruption | 1 | `volume-1/chapter-18.md:214` — `"Tôi đã hói hoàn toàn vào ba **mưvarried** mươi tuổi rồi!!"` (EN: "I was already fully bald in my thirties!!" — the word "married" was spliced into "ba mươi"/"thirty"). |
| English profanity kept in VN dialogue | 1 (1 line) | `volume-4/chapter-1.md:70` — `"Ồ, holy sh*t…"` (matches EN: `"Whoa, holy sh*t…"`; EN source is already censored with `*` so VN mirrors it — **legit stylistic choice**, not an MT bug). |
| Game-term calques left in English (quoted) | 4 (in sample) | `volume-4/chapter-1.md:10,14,16,22` — `"Gift"`, `kỹ năng cheat`, `All Creation`, `dungeon` left as-is. EN keeps them too — **legit**. |
| "S-rank" / "EX" left as bare English | 3 | `volume-1/chapter-18.md:33`, `volume-4/chapter-1.md:16, 80`. EN also uses "S rank"/"EX" — **legit**, common in translated Isekai. |
| English function words (the/and/of/...) in VN text | ~12 across sample, all proper-noun adjacent | All matches are inside proper names (`Glicente Kingdom`, `Nargadia Labyrinth`) or quotes — **not real leakage**. |

### 4.2 Brackets, ellipsis, punctuation

| Pattern | Count | Verdict |
|---------|-------|---------|
| Japanese `「` brackets | **0** in sample | ✅ No MT-bleed from JP-style brackets. |
| ASCII double-quote `"` for dialogue | 32–98 per file | ✅ Consistent. |
| `…` (U+2026) ellipsis | 13–45 per file | ✅ Consistent. |
| `...` three-dots | **0** in sample | ✅ |
| Em-dash `—` for dialogue break / aside | 1–17 per file | ✅ Used in EN, mirrored. |

### 4.3 Numbers & measurements

| Pattern | Count | Verdict |
|---------|-------|---------|
| `150 cm` / `1m50`-style | 1 (`1m50` in V1 ch1:14) | ✅ Matches EN "150 cm" — VN prefers `1m50`. |
| Thousand-separator dot (`300.000`) | 4 (V8 ch1-p1:44, V1 ch18) | ✅ **Correct VN convention** (`300.000` = three hundred thousand, not 300.0). |
| Raw big ints (`355`, `100`, `300`) | many | ✅ Reads as game-stat shorthand, matches EN. |

**Verdict on numbers:** No mixing — VN uses dot-separator consistently and the `1m50` form mirrors the EN's `150 cm` semantically. **No bug here.**

### 4.4 Archaic / formal register

| Term | Count (sample) | Context |
|------|---------------|---------|
| `thần` (royal 1st-p) | 6 | V1 ch1 (princess self-ref), V4 ch1:12 (V1 recap), V8 ch1-p1:44 (Ma Thần proper-noun). **All appropriate** — used by the princess's dialogue (V1 ch1:134, 150, 182) to match her "I am the first princess" court register. |
| `ngài` (honorific 3rd-p) | 6 | V1 ch1:164 (Tendo references king), V4 ch17:269 ("Bệ Hạ Haruto"), V4 ch17:303, 323, 327, V8 ch1-p1:176 (Oskar). All in court/dialogue honorific context. **Appropriate.** |
| `Bệ Hạ` (Your Majesty) | 1 | V4 ch17:269 — **appropriate** for a formal scene addressing Haruto as royalty. |
| `bệ hạ / khanh / hoàng thượng / tâu` | 0 each | ✅ No unwarranted court-register leakage into modern scenes. |

**Verdict on register:** Archaic terms are character-bound and **do not leak into modern-school scenes** (V1 ch1 classroom lines are clean modern VN).

---

## 5. Style-Mismatch Spot-Checks

| English | Vietnamese | Verdict |
|---------|------------|---------|
| `"I grinned."` (V1 ch1:40) | `"Bộ ba quay sang phía tôi, cười nham hiểm."` | ✅ "cười nham hiểm" = "smiled wickedly" — captures the villainous grin well. |
| `"I was almost killed by a knight"` (V4 ch1:14) | `"suýt bị giết bởi một hiệp sĩ"` | ✅ Direct, idiomatic. |
| `"the most powerful dragon exists at the lowest floor"` (V4 ch1:54) | `"con rồng mạnh nhất tồn tại ở tầng thấp nhất"` | ✅ Slightly literal but natural. |
| `"hollow bullsh\*t"` (V4 ch1:58) | `"lời nói vô căn cứ hoàn toàn"` | ✅ **Excellent** adaptation — VN reader-unfriendly profanity turned into idiom. |
| `"Eh, wh, what, what tremendous magic power"` (V4 ch1:178) | `"Eh, wh, what, ma lực khổng lồ thế này"` (V4 ch1:176) | ⚠️ **Spot-mistranslation** — VN drops one of the four stuttered "what"s. EN mirrors 4x; VN has 2. Mild register-flattening. |
| `"Whoa, holy sh\*t…"` (V4 ch1:72) | `"Ồ, holy sh*t…"` (V4 ch1:70) | ✅ EN-censorship preserved. |

---

## 6. Tone-Fix Priority List (top patterns, biggest readability impact)

### Priority 1 — Mechanical character corruption (must fix)
- **`volume-1/chapter-18.md:214`** — `"ba mưvarried mươi tuổi"` → `"ba mươi tuổi"`. This is a one-line fix but it is the **only** clear, unambiguous Google-Translate artifact in the sample. Search the full corpus for the pattern `mư[a-zA-Z]{2,} mươi` to catch siblings.

### Priority 2 — Register inconsistency in V1 ch1 line 58
- **`volume-1/chapter-1.md:58`** — Mitsurugi (a hostile, mocking classmate) says `"tụi tớ"`. Mitsurugi's line is **casual-mocking**, but `tụi tớ` is neutral-casual. Better: `tụi tao` (rough, fits "bullies") or `tụi tui` (Southern, mocking). This is the only narrator-adjacent pronoun shift in the sample, but it is dialogue, not narration.

### Priority 3 — Incomplete translation of stuttered "what" (V4 ch1:176)
- **`volume-4/chapter-1.md:176`** — `"Eh, wh, what, ma lực khổng lồ thế này"` should be `"Eh, wh, what, what, ma lực khổng lồ thế này"` to mirror EN's 4x stutter. The EN has four "what"s; VN has two. Tiny but consistent mild register-flattening.

### Priority 4 — Unexplained English game terms (debatable, not critical)
- `"Gift"`, `dungeon`, `cheat`, `clear` left in English in V4 ch1. These match the EN source, so they are **not bugs** — but a reader who only sees VN will see a Japanese-translation-source calque. Optional: italicize or quote them (`"Gift"` is already quoted at V4 ch1:10) to mark them as foreign terms.

### Priority 5 (low) — Internal address-term mix when MC talks to 3rd parties
- When MC (Haruto) narrates and references Tendo, the text uses `anh ấy` in some places and `Tendo` in others. This is **acceptable narrative variation**, not a bug — but a `grep` for `anh ấy` vs bare `Tendo` per chapter would reveal a stable ratio.

---

## 7. MT vs. Legitimate-Stylistic — Disambiguation

| Pattern | Verdict | Reason |
|---------|---------|--------|
| `「」` brackets | **None in sample** — clean | ✅ |
| `holy sh*t` left English | **Legit** | EN source already censored; VN mirrors. |
| `Gift`, `dungeon`, `cheat` left English | **Legit (acceptable)** | EN keeps them; Isekai convention. Could be italicized for clarity. |
| `thần` (royal 1st-p) for princess | **Legit, character-bound** | Matches EN "I am the first princess" court register. |
| `ta` (archaic 1st-p) for Garguin | **Legit, character-bound** | Guild master character. |
| `Bệ Hạ Haruto` | **Legit** | Court register for a scene where Haruto is treated as royalty. |
| `"mưvarried mươi"` | **MT bug, fix now** | Mechanical character-string corruption — only one found, but pattern-search the full corpus. |
| `"tụi tớ"` in Mitsurugi's mouth | **MT/editor bug** | Wrong register for a hostile classmate. |
| Em-dash style, ellipsis `…`, VN thousand-sep dot | **Legit VN conventions** | No bug. |

---

## 8. Recommended Follow-Up (out of scope for this report)

- **Run a corpus-wide grep for the `mư[a-zA-Z]{2,} mươi` corruption pattern** in `/content/docs/twem/`. The single hit in V1 ch18 is almost certainly the tip of an iceberg if a Google-Translate pipeline produced it.
- **Sweep all chapters for `tụi tớ`** — V1 ch1 line 58 is the only one in the sample, but Mitsurugi's style appears in other bully scenes.
- **Count the ratio of `Anh Hùng` (capitalized Hero title) vs `anh hùng` (generic) per volume** — V4 ch1 has 2:7 and V8 ch1-p1 has 4:2. A pure ratio drift may indicate the same paragraph was MT-edited by different engines.

---

**Status:** DONE_WITH_CONCERNS
**Summary:** Sampled 6 files (V1 ch1+ch18, V4 ch1+ch17, V8 ch1-p1+ch9). Found 1 confirmed character-corruption MT artifact (`mưvarried`), 1 dialogue register-mismatch (`tụi tớ`), 1 minor mistranslation (4x vs 2x stuttered "what"). Pronoun/address-term usage is otherwise stable and well-chosen; court-register terms (`thần`, `ngài`, `Bệ Hạ`) are appropriately character-bound. No Japanese-bracket leakage, no ellipsis mixing, no number-format bugs.
**Concerns:** The single `mưvarried` corruption suggests a systemic MT pipeline issue — recommend a `grep -nE 'mư[a-zA-Z]{2,} mươi' content/docs/twem/**/*.md` sweep before the next publication pass. Also: `V8 ch9` is a Wayback-Machine placeholder (status: "unavailable"), so volume 8 is not fully translated yet — flag if a full V8 review is needed later.
