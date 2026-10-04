# Entra Identity Security Lab

A personal lab demonstrating scoped Conditional Access, contractor access reviews and offboarding, sign-in investigation, and a reusable read-only Microsoft Graph audit. Workforce personas are synthetic. This project documents observed outcomes and limitations; it does not claim production deployment experience.

## Results as of October 4, 2026

| Control | Observed outcome | Evidence limit |
| --- | --- | --- |
| MFA for lab users | CA01 enabled; Alex's selected live sign-in showed CA01 Success | Fresh MFA challenge not established |
| Legacy authentication blocking | CA02 enabled; client matching tested with What If | No actual blocked legacy sign-in demonstrated |
| MFA for Global Administrators | CA03 enabled; administrator's selected live sign-in showed CA03 Success | Fresh challenge not established by screenshot |
| Device-code flow blocking | CA04 enabled; flow matching tested with What If | No actual blocked device-code sign-in demonstrated |
| Emergency access | Two accounts; post-activation portal access and exclusions user-confirmed | Independent recovery credentials and recurring drills unverified |
| Contractor governance | Alex and Jamie approved; Taylor denied, disabled, and removed from lab-users group | Separate review Applied status not inspected; session revocation user-reported |
| Offboarding sign-in test | Taylor's subsequent logs showed 50057; Graph showed account disabled | Not a complete entitlement or token review |
| Read-only audit | Consolidated script ran with all 12 reads successful | Snapshot of named resources, not full tenant compliance |
| PIM | Reports Reader eligibility failed with RoleNotFound; Microsoft support case open | Eligibility and activation incomplete |

## Scenario and identities

| Identity | Purpose | Latest audit |
| --- | --- | --- |
| Alex.Employee | Workforce user | Enabled, P2 licensed |
| Jamie.Admin | Privileged-access test persona | Enabled, P2; no active or eligible roles through inspected user/group paths |
| Taylor.Contractor | Internal Member account simulating contract end, not a B2B guest | Disabled; removed from lab-users group; P2 retained |
| Test User | Disabled test identity | Disabled, no license |

Identity-Security-Lab-Users contains Alex and Jamie. Identity-Security-Lab-Privileged contains Jamie. Both groups have zero active role assignments and zero eligible role instances. A group name does not grant a role.

## Explore the project

- [Audit results](docs/audit-results-2026-10-04.md), [audit script](scripts/Invoke-LabIdentityAudit.ps1), and [usage notes](docs/graph-audit.md).
- [Lab MFA](policies/conditional-access.md), [legacy authentication](policies/block-legacy-authentication.md), [administrator MFA](policies/admin-mfa.md), and [device-code policy](policies/block-device-code-flow.md).
- [Contractor offboarding](policies/contractor-offboarding.md) and [emergency-access design](policies/break-glass.md).
- [PIM investigation](docs/pim-support-summary.md), [screenshot evidence](screenshots/README.md), and [build log](docs/build-log.md).

## Run the audit

Use PowerShell 5.1 or later with Microsoft.Graph.Authentication installed. Connect to your lab tenant with the read-only scopes documented in the usage notes. Run in that authenticated session:

```powershell
./scripts/Invoke-LabIdentityAudit.ps1 -ExpectedTenantId '<your-lab-tenant-id>'
```

The script validates the connected tenant and makes GET requests only. Output defaults to exports/lab-audit.json, excluded from version control. Failed reads, missing resources, and duplicate names are unknown results, not passing controls. Review output before sharing.

## Remaining work and limits

Resolve PIM with Microsoft support, then test eligibility and activation. The P2 trial expires October 27, 2026, with recurring billing off; ongoing licensing is not arranged. Taylor's license has not been reclaimed. Independent emergency credentials and recurring recovery drills remain outstanding. Security defaults disablement was instructed during transition but not separately confirmed.

Policies target configured lab users and administrator scope; this is not a baseline covering every future user. What If establishes matching, not enforcement. Disablement and group removal do not prove complete entitlement cleanup.

## Evidence and privacy

Selected screenshots have documented provenance, sanitization, and claim limits. Sensitive source screenshots remain outside the repository. Private exports and secrets are excluded by .gitignore. Never commit personal account details, private tenant/user identifiers, tokens, or unreviewed exports.
