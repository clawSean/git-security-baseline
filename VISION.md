# Git Security Baseline

Make commit provenance and secret scanning automatic for repositories owned by
`clawSean`, without relying on an agent or developer remembering a prose rule.

The baseline has two independent controls:

1. ClawPop signs commits automatically with a dedicated SSH signing key.
2. Repositories scan outgoing commits locally and repeat the scan in GitHub CI.

GitHub remains the canonical distribution point. Local installation is a
checkout-specific adapter, not a second source of truth.
