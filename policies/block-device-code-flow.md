# Device code flow pilot

Status: creation reported complete by user on 2026-10-03 after the configuration instructions below. Saved configuration and evaluation are not yet independently verified. No enforcement demonstrated.

| Setting | Instructed value |
| --- | --- |
| Name | LAB-CA04-Block-Device-Code-Flow |
| Include | Identity-Security-Lab-Users plus regular P2-licensed administrator |
| Exclude | breakglassadmin and breakglassadmin02 |
| Target resources | All resources |
| Conditions > Authentication flows | Configure Yes; Device code flow |
| Grant | Block access |
| Other conditions | Unset |
| State | Report-only |

Purpose: evaluate device-code flow blocking for the active routine lab accounts before replacing security defaults. Report-only does not block authentication. Existing device-code dependencies must be reviewed before enforcement, including tools and shared devices. Emergency exceptions are intentional and do not establish independent recovery readiness.

Pending validation: simulate Alex.Employee and the regular administrator with Device code flow and compare an otherwise identical scenario without that flow. Confirm both emergency accounts do not match. Do not manufacture a real device-code sign-in merely to obtain evidence.

Security defaults remains Enabled during preparation. Future rollback: set this policy Off through an unaffected administrator while retaining other baseline protections.

Reference: [Microsoft authentication-flow blocking guidance](https://learn.microsoft.com/en-gb/entra/identity/conditional-access/policy-block-authentication-flows).

2026-10-03 evaluation: requested Alex comparison shows CA01 MFA, CA02 Block access, and CA04 Block access applicable in the first result. Second result shows CA04 not applicable due to Authentication flow and CA03 not applicable due to Users and groups. All displayed states are Report-only. Scenario selectors are outside the crops; identity and flow comparison are associated via the walkthrough. CA02's matching indicates overlap with its client condition, but the precise selected client option is not visible. Evidence: screenshots 23 and 24. Administrator and emergency scope tests remain pending; no live blocking demonstrated.

2026-10-03 scope results: three screenshots supplied after regular-admin / first-emergency / second-emergency test instructions. First shows Other clients and Device code flow with CA02 Block access, CA03 MFA strength, CA04 Block access applicable. Other two show Windows, Other clients, Device code flow, and all four policies not applicable due to Users and groups. All Report-only. Selected User fields and resource are outside screenshots; account associations follow requested sequence and are not independently established. Test User breadcrumb is navigation context, not proof of selected simulated identity. Evidence 25-27 saved unchanged. Explicit CA04 exclusions and device-code dependencies still require review.

2026-10-03: user confirms CA04 explicitly excludes both emergency accounts and reports no device-code sign-in dependencies for this tenant. User-reported checks. Pilot ready for the documented personal-lab transition; enforcement not yet reported.

Activation update 2026-10-03: policy-list screenshot verifies this policy is now On. Earlier Report-only records remain historical. Evidence: [28-four-policies-on.png](../screenshots/28-four-policies-on.png). Post-activation live sign-in validation pending.
