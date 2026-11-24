\# Security baseline (Group 7)



These rules define what "secure" means in this project. Each one is enforced automatically.



| # | Rule | Rationale | Enforced by |

|---|------|-----------|-------------|

| 1 | S3 buckets use server-side encryption | Protects data at rest | Checkov built-in check |

| 2 | S3 buckets block all public access | Prevents accidental data exposure | Checkov built-in check |

| 3 | No security group allows SSH (22) from 0.0.0.0/0 | Stops open admin access from the internet | Checkov built-in check |

| 4 | Every resource has the tag Project | Ownership and cost traceability | Custom policy CKV2\_GROUP7\_001 |

| 5 | No secrets in code or Git history | Leaked keys give attackers access | Secret scanner (Member 5) |

| 6 | Deployed resources meet AWS Foundational Security Best Practices | Detect drift and misconfiguration at runtime | AWS Security Hub / Config |

