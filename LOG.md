# Log

## 2026-10-02

- Added a GitHub-hosted one-command bootstrap for new or existing repositories.
  It caches the shared hook in the user data directory, configures only the
  target checkout, and writes a reusable CI caller pinned to immutable baseline
  commit `95d9ef8505d7d38a6b7a9c599b00781600221aa7`.
- The bootstrap refuses to overwrite a different existing GitLeaks workflow.

## 2026-10-01

- Created the canonical Git security baseline project.
- Chose GitHub as the versioned source and distribution point; developer
  orchestration will point here, while project inspection should verify adoption.
- Avoided repairing broadly mis-owned Homebrew paths. Installed GitLeaks
  user-locally from the upstream checksum-verified release instead.
- During the first pilot push, the `handoffs` checkout lacked the current
  remote commit. GitLeaks logged an invalid revision but exited zero. Added an
  independent `git cat-file` gate so the hook fails closed and requires a fetch.
- Published the canonical baseline and pinned consumer workflows to immutable
  commit `eb9767c685610ad36d00d8455c1d4c5d4c6e236c`.
- Enabled and proved green GitHub Actions scans on `handoffs`,
  `gateway-uptime-watch`, and `mac-health`.
- Portal's full-history scan found ten matches in intentional privacy/security
  test fixtures. Left Portal unenrolled rather than weakening detection or
  adding unreviewed ignores.
- Registered the dedicated public SSH signing key with GitHub after owner
  device authorization. GitHub exact-commit readback changed the baseline and
  all three pilot commits from `unknown_key` to `verified: true`, reason `valid`.
