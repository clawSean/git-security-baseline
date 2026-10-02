# Status

## Current phase

Operational bounded pilot.

## Completed

- Dedicated ClawPop SSH signing key generated.
- Global Git author and automatic SSH commit signing configured.
- GitLeaks `8.30.1` installed in `~/.local/bin` from the checksum-verified
  upstream Darwin arm64 release.
- Reusable local pre-push hook and GitHub Actions workflow authored.
- Live pilot caught and repaired a fail-open edge case: GitLeaks can log an
  invalid revision as fatal while exiting zero when a stale checkout lacks the
  remote SHA. The hook now independently requires that commit object.
- GitLeaks CI is green on `clawSean/handoffs`,
  `clawSean/gateway-uptime-watch`, and `clawSean/mac-health`.
- All three pilot checkouts use the shared pre-push hook, and each published
  pilot commit is locally SSH-signature verified.
- GitHub signing key `ClawPop clawSean commit signing` is registered, and exact
  commits in the baseline plus all three pilot repositories report
  `verified: true` with reason `valid`.

## In progress

- Register the signing public key with GitHub after owner device authorization.
- Decide whether to add narrow fingerprint ignores for Portal's intentional
  privacy-test credential fixtures before onboarding that repository.

## Gate

The bounded pilot is complete. Expansion remains per-repository and should
require a clean baseline or reviewed narrow fingerprint ignores.
