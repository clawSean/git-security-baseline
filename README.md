# Git Security Baseline

[![GitLeaks](https://img.shields.io/badge/GitLeaks-8.30.1-blue)](https://github.com/gitleaks/gitleaks)
[![Commit signing](https://img.shields.io/badge/commits-SSH--signed-success)](https://docs.github.com/authentication/managing-commit-signature-verification/signing-commits)

Reusable provenance and secret-scanning controls for `clawSean` repositories.

## What it provides

- `hooks/pre-push`: scans only commits about to be pushed and blocks detected
  secrets locally.
- `.github/workflows/gitleaks.yml`: reusable GitHub workflow that repeats the
  scan on GitHub.
- `scripts/install-local.sh`: points one checkout at the canonical hook folder.

Local hooks improve feedback time. CI is the durable backstop because hooks can
be skipped with `--no-verify`.

## One-command bootstrap

Run this from a new or existing repository checkout:

```sh
curl -fsSL https://raw.githubusercontent.com/clawSean/git-security-baseline/main/scripts/bootstrap.sh | sh
```

Pass a checkout path after `sh -s --` when running elsewhere. The bootstrap
downloads the shared hook into the user data directory, configures only that
checkout, and writes `.github/workflows/gitleaks.yml`. Both controls are pinned
to an immutable baseline commit. It refuses to replace a different existing
workflow.

## Adopt locally

```sh
./scripts/install-local.sh /path/to/repository
```

This sets a repository-local `core.hooksPath`; it does not replace hooks for
unrelated repositories.

## Adopt in GitHub Actions

Consumers should call the reusable workflow by immutable commit SHA:

```yaml
jobs:
  gitleaks:
    uses: clawSean/git-security-baseline/.github/workflows/gitleaks.yml@COMMIT_SHA
```

Pinning prevents a later baseline update from silently changing an existing
repository's security boundary.

## Control boundary

- Commit signing proves which registered key signed a commit; it does not prove
  the code is correct.
- GitLeaks detects likely secrets; it does not replace credential rotation,
  least privilege, or TruffleHog verification.
- GitHub branch protection/rulesets are intentionally outside this baseline.
