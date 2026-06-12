# Phase 1: Identify Missing V8 Chapters

**Status:** Pending
**Effort:** 30 min
**Owner:** TBD
**Depends on:** None

## Context

The V8 corpus has 13 chapter files. The synthesis flagged 2 placeholders + ~5
missing chapters but didn't pin the exact missing set. Before any re-crawl or
translation, we need a definitive missing-chapter list with Wayback URLs.

## Related files

- `content/docs/twem-en/volume-8/_index.md`
- `content/docs/twem/volume-8/_index.md`
- `scripts/crawl-twem.sh` (reference: how the EN crawler discovers V8)

## Steps

1. Read `content/docs/twem-en/volume-8/_index.md` to get the canonical V8
   chapter list and order.
2. Read `content/docs/twem/volume-8/_index.md` and diff against EN.
3. List V8 files in both directories (`ls content/docs/twem-en/volume-8/` and
   `ls content/docs/twem/volume-8/`) and identify the missing filenames in VI.
4. For each missing VI file, note the corresponding EN file (which already
   exists).
5. For the 2 VI placeholders (`status: "unavailable"`), check whether the EN
   source has the chapter:
   - If EN has it, mark "needs re-crawl + translate".
   - If EN is also missing, mark "source-side gap — escalate".
6. Produce a `phase-01-findings.md` with:
   - Table of (filename EN | filename VI | status | action needed)
   - Wayback URL for each missing file (use `scripts/crawl-twem.sh --dry-run --volumes 8`)

## Success criteria

- Complete list of missing V8 chapters with EN filenames.
- Wayback URLs identified for all re-crawlable chapters.
- Source-side gaps escalated to the user.

## Risk

- If the EN source is itself missing chapters, this phase ends early and the
  plan needs re-scoping.
