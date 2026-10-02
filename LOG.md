# Log

## 2026-10-01

- Created the canonical Git security baseline project.
- Chose GitHub as the versioned source and distribution point; developer
  orchestration will point here, while project inspection should verify adoption.
- Avoided repairing broadly mis-owned Homebrew paths. Installed GitLeaks
  user-locally from the upstream checksum-verified release instead.
- During the first pilot push, the `handoffs` checkout lacked the current
  remote commit. GitLeaks logged an invalid revision but exited zero. Added an
  independent `git cat-file` gate so the hook fails closed and requires a fetch.
