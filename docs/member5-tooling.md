# Member 5 — Security Scanning: Tool Selection and Rationale

## Scope
Member 5 owns the choice, configuration and verification of the security
scanners used in the pipeline, and the test cases that prove the pipeline
actually blocks insecure changes.

## Tools chosen

| Check | Tool | Version pin | Why this tool |
|---|---|---|---|
| Secret detection | Gitleaks (`gitleaks/gitleaks-action@v2`) | v2 | Fast, scans full Git history (needs `fetch-depth: 0`), simple red/green output, free for public repos |
| IaC scanning | Checkov (`bridgecrewio/checkov-action@v12`) | v12 | Supports custom policies in `/policies`, broad AWS coverage, the assignment's named tool |
| Container / filesystem scan | Trivy (`aquasecurity/trivy-action@0.35.0`) | 0.35.0 | One action covers fs and image scans, fails on HIGH/CRITICAL |
| Dependency updates | Dependabot (GitHub native) | n/a | No pipeline job needed; opens PRs for vulnerable deps automatically |

## Why not the alternatives
- **TruffleHog instead of Gitleaks:** TruffleHog can verify live secrets, which is
  powerful but slower and noisier for a student lab. Gitleaks is easier to read
  in a demo and sufficient to prove blocking.
- **tfsec instead of Checkov:** tfsec is Terraform-only. Checkov covers Terraform
  *and* supports custom YAML policies, which the assignment requires.
- **Snyk instead of Dependabot:** Snyk needs an account and token. Dependabot is
  built into GitHub and needs no secret.

## Pass/fail rules
- Any Gitleaks finding → job fails.
- Any Checkov failure (built-in or custom) → job fails (`soft_fail: false`).
- Any Trivy HIGH or CRITICAL → job fails (`exit-code: '1'`).
- No `continue-on-error` anywhere on a security step.

## Known limitations (for the report)
- Trivy currently scans the filesystem (`scan-type: fs`); it will scan a built
  image once a Dockerfile exists.
- A green run only proves the tools load. Blocking is proven by the test cases
  in `docs/member5-test-cases.md`.

