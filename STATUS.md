# Status

## Current phase

Implementation and bounded pilot.

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

## In progress

- Register the signing public key with GitHub after owner device authorization.
- Register the signing public key with GitHub after owner device authorization;
  GitHub currently reports the signed commits as `unknown_key`.
- Decide whether to add narrow fingerprint ignores for Portal's intentional
  privacy-test credential fixtures before onboarding that repository.

## Gate

Do not claim GitHub `Verified` or CI enforcement until GitHub readback proves
both on exact pushed commits.
