# Lab audit snapshot — October 4, 2026

Source: live execution of `scripts/Invoke-LabIdentityAudit.ps1`, generated at 19:00:22 UTC. The JSON report was inspected after execution. All 12 reads succeeded.

| Synthetic user | Account enabled | Product |
| --- | --- | --- |
| Alex.Employee | Yes | AAD_PREMIUM_P2 |
| Jamie.Admin | Yes | AAD_PREMIUM_P2 |
| Taylor.Contractor | No | AAD_PREMIUM_P2 retained |
| Test User | No | None |

| Group | Direct members |
| --- | --- |
| Identity-Security-Lab-Users | Alex.Employee, Jamie.Admin |
| Identity-Security-Lab-Privileged | Jamie.Admin |

CA01 Require MFA for lab users, CA02 Block legacy authentication, CA03 Require MFA for Global Administrators, and CA04 Block device-code flow were all enabled.

Jamie and both named groups each had zero active Entra role assignments and zero eligible role instances. The intended Reports Reader eligibility has not been established; Microsoft support is investigating the earlier RoleNotFound failures.

This snapshot does not prove a fresh MFA challenge, actual legacy/device-code blocking, session revocation, or a complete entitlement review. Taylor's license has not been reclaimed. Emergency accounts and all administrator assignments are outside this script's scope. See the policy documentation and build log for separate evidence and limitations.
