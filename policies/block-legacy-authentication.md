# Legacy authentication pilot

Status: creation, Report-only state, and Other clients versus Browser simulation results verified on 2026-10-02. Both emergency-account Other clients tests passed based on user confirmation. Full configuration, explicit exclusions, and live enforcement remain unverified.

Evidence: [13-ca01-ca02-report-only.png](../screenshots/13-ca01-ca02-report-only.png) shows both lab policies in Report-only, two user-created policies, and zero Microsoft-managed policies. Names and states alone do not establish the saved client conditions or grant controls.

Purpose: evaluate blocking legacy clients that cannot satisfy modern MFA requirements, initially for the three licensed synthetic users.

| Setting | Planned value |
| --- | --- |
| Name | LAB-CA02-Block-Legacy-Auth-Lab-Users |
| Include | Identity-Security-Lab-Users |
| Exclude | breakglassadmin and breakglassadmin02 |
| Target resources | All resources |
| Conditions > Client apps | Configure Yes; Exchange ActiveSync clients and Other clients only |
| Grant | Block access |
| Other conditions / session controls | None |
| State | Report-only |

## Observed tests

- Other clients: screenshot labels the selection "Mobile apps and desktop clients - Other clients" and shows Windows. CA02 appears under Policies that will apply with Block access; CA01 also applies with Multifactor authentication strength. Both remain Report-only.
- Browser: CA02 appears under Policies that will not apply, reason Client app. Windows and Azure Files are visible. This screenshot does not show the applicable-policy tab for CA01.
- Alex.Employee and the first screenshot's target resource are associated via the requested test sequence; the identity selector is outside both crops. These are client-condition simulations, not real legacy connections to Azure Files.
- Evidence: [14-ca02-what-if-other-clients.png](../screenshots/14-ca02-what-if-other-clients.png) and [15-ca02-what-if-browser.png](../screenshots/15-ca02-what-if-browser.png).

- Emergency accounts: two supplied Browser screenshots show CA01 and CA02 will not apply due to Users and groups. User identifies the accounts as breakglassadmin and breakglassadmin02. After being asked to rerun with Other clients, user confirms on 2026-10-02 that both still match the expected non-applicability result. The corrected Other clients results are user-reported, not screenshot-verified. Users and groups does not distinguish explicit exclusion from absence from the included group.

Remaining tests: review explicit exclusions and full saved client conditions. Inspect actual legacy sign-in evidence if available; absence of legacy traffic is not proof of enforcement. Do not enable obsolete protocols merely to manufacture evidence.

This pilot does not replace security defaults across the tenant. Before transition, cover normal administrators and other active accounts, establish appropriate licensing and MFA, review device-code flow protection, and document emergency-access limitations. Keep security defaults enabled during preparation. Report-only does not block sign-ins.

Scope-extension test reviewed on 2026-10-03: the requested regular-administrator What If rerun shows Windows / Other clients, with CA02 Block access and CA03 Multifactor authentication strength both applicable in Report-only. Identity and target-resource selectors are outside the crop; administrator association follows the requested test sequence. This verifies simulated matching after the requested extension, not the precise saved Include configuration or live blocking. The table above reflects the initial design. Explicit exclusions and the administrator Browser check remain pending.

Evidence: [20-admin-ca02-ca03-other-clients.png](../screenshots/20-admin-ca02-ca03-other-clients.png).

Administrator Browser comparison reviewed on 2026-10-03: CA03 is the sole applicable policy with Multifactor authentication strength; CA02 does not apply due to Client app, and CA01 does not apply due to Users and groups. All remain Report-only. The two result crops omit scenario selectors; Browser and regular-administrator association follow the requested comparison. Evidence: [21-admin-browser-applies.png](../screenshots/21-admin-browser-applies.png) and [22-admin-browser-not-applies.png](../screenshots/22-admin-browser-not-applies.png). The Browser comparison is complete; explicit saved exclusions and full client conditions still require inspection.

Rollback after any future enforcement: set this policy Off using an unaffected administrator while preserving remaining baseline protections.

Reference: [Microsoft legacy authentication policy](https://learn.microsoft.com/en-us/entra/identity/conditional-access/policy-block-legacy-authentication), adapted to the lab group for the pilot.

Emergency exclusions inspected by user on 2026-10-03: both breakglassadmin and breakglassadmin02 explicitly listed. User-confirmed, not screenshot-verified.

Saved settings confirmed by user on 2026-10-03: Client apps Configure Yes, only Exchange ActiveSync clients and Other clients selected; All resources; Report-only. Detailed settings are user-reported rather than screenshot-verified.

Activation update 2026-10-03: policy-list screenshot verifies this policy is now On. Earlier Report-only records remain historical. Evidence: [28-four-policies-on.png](../screenshots/28-four-policies-on.png). Post-activation live sign-in validation pending.
