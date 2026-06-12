# Phase 5: Verify and Publish

**Status:** Pending
**Effort:** 1–2 hours
**Owner:** TBD
**Depends on:** Phases 1–4

## Context

Final QA before pushing V8 changes to `main`. Validates the build, link
integrity, and reader-facing content.

## Related files

- `content/docs/twem/volume-8/` (output of phases 1–4)
- `hugo.yaml`, `layouts/`, `static/` (build configuration)
- `netlify.toml` (deploy target)

## Steps

1. Build locally: `hugo --minify` (or whatever the project uses; check
   `hugo.yaml` and `netlify.toml`).
2. Verify all 13+ V8 chapter pages render without 404s.
3. Verify no `status: "unavailable"` placeholders remain in the V8
   chapters that Phase 1 marked as re-crawlable.
4. Verify no Patreon paywall URLs in the V8 chapter footers
   (`grep -rnE 'patreon\.com' content/docs/twem/volume-8/`).
5. Verify no `mư[a-zA-Z]{2,} mươi` MT corruption pattern.
6. Verify nav links (prev/next) work for the newly-added chapters.
7. Diff `twem/` vs `twem-en/` for V8: title parity, weight parity, no
   missing frontmatter fields.
8. Build a before/after summary for the changelog entry
   (`docs/project-changelog.md` per the documentation-management rule).
9. Commit + push (per the `git` skill conventions; see CLAUDE.md).

## Success criteria

- `hugo` builds without warnings or errors.
- No 404s in the V8 chapter pages.
- No placeholders, no paywall URLs, no MT corruption patterns.
- All nav links resolve.
- Changelog updated.

## Risks

- Netlify build may diverge from local build (different Hugo version, etc.).
  The Netlify deploy preview is the source of truth.
- Pushing during a work-in-progress state on the user's main branch could
  cause issues — prefer a feature branch and PR if the workflow supports
  it.
