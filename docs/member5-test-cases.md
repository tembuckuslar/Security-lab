# Member 5 — Security Test Cases

These five test cases prove that each security gate actually blocks insecure
changes. Each case is run on a throwaway branch, the red run is screenshotted,
then the branch is deleted. Nothing insecure is ever merged.

| # | Insecure change | Scanner that must catch it | Expected result | Fix |
|---|---|---|---|---|
| 1 | S3 bucket with `acl = "public-read"` | Checkov (built-in) | Checkov FAILS, deploy job never runs | Remove the ACL, keep the bucket private |
| 2 | Fake AWS access key committed in a file | Gitleaks | Gitleaks FAILS, PR cannot merge | Delete the file, rotate the key, store real secrets in GitHub Secrets |
| 3 | Security group allowing SSH (22) from `0.0.0.0/0` | Checkov (built-in) | Checkov FAILS, deploy job never runs | Restrict the CIDR to the office/VPN range |
| 4 | S3 bucket missing the `Project` tag | Custom policy `CKV2_GROUP7_001` | Checkov FAILS on the custom rule | Add `tags = { Project = "group7" }` |
| 5 | S3 bucket named `mybucket` (no `group7-` prefix) | Custom policy `CKV2_GROUP7_002` | Checkov FAILS on the custom rule | Rename to `group7-...` |

## Status tracker

| # | Run? | Evidence file | Notes |
|---|---|---|---|
| 1 | ⬜ | | |
| 2 | ⬜ | | |
| 3 | ⬜ | | |
| 4 | ⬜ | | |
| 5 | ⬜ | | |

## Evidence naming
Screenshots go in `docs/evidence/` named `test<N>_<red|green>_<date>.png`,
e.g. `test2_red_2025-11-23.png`.
