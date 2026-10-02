# Status

## Current phase

Implementation and bounded pilot.

## Completed

- Dedicated ClawPop SSH signing key generated.
- Global Git author and automatic SSH commit signing configured.
- GitLeaks `8.30.1` installed in `~/.local/bin` from the checksum-verified
  upstream Darwin arm64 release.
- Reusable local pre-push hook and GitHub Actions workflow authored.

## In progress

- Register the signing public key with GitHub after owner device authorization.
- Publish this canonical baseline and pin pilot consumers to its immutable SHA.
- Apply the baseline to selected high-value repositories and prove local + CI
  behavior.

## Gate

Do not claim GitHub `Verified` or CI enforcement until GitHub readback proves
both on exact pushed commits.
