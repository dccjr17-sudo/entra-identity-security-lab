# Emergency-access design

Status: lab implementation in progress; not a completed production recovery design.

## Purpose

Preserve access to the personal lab if the normal administrator account becomes unavailable. Emergency accounts are reserved for recovery and controlled validation.

## Current evidence

- breakglassadmin has Global Administrator assigned, according to the user.
- The user reports Microsoft Authenticator enrollment and successful MFA plus Entra portal access.
- A reviewed My Signins event shows Security Defaults applied and previously satisfied MFA accepted. It does not identify the original authentication method or corroborate a new challenge for the reported portal test.
- Security defaults remains enabled; no custom Conditional Access deployment has been verified.
- On 2026-09-23, the user reports creating breakglassadmin02 and completing Microsoft Authenticator enrollment. On 2026-09-26, the user reports a successful sign-in test with MFA. A supplied screenshot verifies its direct Global Administrator assignment for the directory; matching sign-in logs have not been reviewed.

## Second account sequence

1. Create breakglassadmin02 as a cloud-only member using the lab's existing onmicrosoft.com domain, with a unique password stored privately.
2. Keep it out of both test-persona groups and leave administrative roles unassigned during enrollment.
3. Enroll Microsoft Authenticator through the account's own Security info flow.
4. Once enrollment is confirmed, assign Global Administrator directly. The target emergency role assignment is permanently active, not dependent on PIM activation.
5. Test a fresh sign-in and portal access, then inspect the matching event and record the observed authentication result.

Creation, enrollment, and successful MFA sign-in are reported complete by the user. Direct Global Administrator assignment is verified from screenshot evidence. The exact group configuration and credential storage have not been independently checked. Matching sign-in log evidence remains pending.

## Limitations and target controls

- The user does not currently own a physical FIDO2 security key. Authenticator notification approval is an initial lab arrangement, not phishing-resistant authentication.
- If normal and emergency accounts share one phone, phone loss is a common point of failure. A second account alone does not resolve that dependency.
- The target design uses at least two emergency accounts with independently available, phishing-resistant credentials and secure credential storage. Authentication devices, supported methods, and their dependencies must be verified before claiming this target is implemented.
- A transition to Conditional Access requires suitable licensing, a prepared replacement baseline for security defaults, and tested emergency-access exclusions. Security defaults does not offer per-user exclusions.
- Monitoring and alerts, validation at least every 90 days, and recovery drills remain planned work.

## References

- [Microsoft emergency-access guidance](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/security-emergency-access)
- [Security defaults](https://learn.microsoft.com/en-us/entra/fundamentals/security-defaults)
- [Sign-in log details](https://learn.microsoft.com/en-us/entra/identity/monitoring-health/concept-sign-in-log-activity-details)

Post-activation check 2026-10-03: user confirms both emergency accounts can open Entra in separate private sessions and their new sign-ins show all four custom policies Not Applied. User-reported result. Independent credential/device readiness and outage recovery are not established.
