# Global Administrator MFA pilot

Status: creation and Report-only state verified on 2026-10-02. Subsequent What If screenshots show CA03 applies with Multifactor authentication strength for the regular administrator scenario and does not apply for either emergency-account scenario due to Users and groups. Explicit role and exclusion settings and live evaluation remain pending.

Evidence: [16-three-policies-report-only.png](../screenshots/16-three-policies-report-only.png) shows CA01, CA02, and CA03 in Report-only, three user-created policies, and zero Microsoft-managed policies. The list does not establish the saved role selection or exclusions.

Purpose: cover the regular Global Administrator separately from the workforce lab group, using role-based Conditional Access targeting.

| Setting | Planned value |
| --- | --- |
| Name | LAB-CA03-Require-MFA-Global-Admins |
| Include | Directory roles > Global Administrator |
| Exclude | Users and groups > breakglassadmin and breakglassadmin02 |
| Target resources | All resources |
| Grant | Grant access; Require authentication strength > Multifactor authentication |
| Additional conditions / session controls | None |
| State | Report-only |

Prerequisites reported by user: regular administrator has a P2 license, Global Administrator listed, a successful fresh Authenticator number-matching challenge, and access to Entra admin center. No new matching sign-in log has been reviewed.

Scope limitation: this policy covers Global Administrator, not every administrative role. Review remaining role assignments before a tenant-wide baseline transition. Jamie remains protected by the workforce pilot once that policy is eventually enforced; any later PIM roles require their own scope review.

Authentication limitation: this lab uses standard MFA strength to accommodate the enrolled method. It is not phishing-resistant MFA. Microsoft's stronger administrator recommendation remains a future improvement after suitable credentials are provisioned and tested.

Planned validation: What If should apply this policy to the normal Global Administrator, not to either explicitly excluded emergency account, and not to an ordinary lab user with no Global Administrator assignment. Inspect real report-only results before enforcement. Preserve security defaults and existing administrator access while preparing the complete replacement baseline. Do not claim this policy is enforced until verified.

Observed scope checks: the corrected Alex simulation lists CA01 as the sole applicable policy; the earlier Alex discrepancy was resolved by a rerun, with its cause unconfirmed. These simulations establish applicability under the selected conditions, not enforcement. Some identity text is cropped or redacted, so account association also relies on the walkthrough context.

Live evaluation reviewed on 2026-10-03: CA03 has Require authentication strength and a result beginning Report-only: User action requir...; CA01 and CA02 are Not applied. This indicates additional user action would be needed for the CA03 grant in this event. Identity association follows the walkthrough; application and timestamp are absent from the crop. Authentication Details inspection remains pending. Evidence: [18-admin-ca03-user-action-required.png](../screenshots/18-admin-ca03-user-action-required.png).

Additional event reviewed on 2026-10-03: user describes it as about one minute earlier. CA03 shows Report-only: Success with Require authentication strength; CA01 and CA02 are Not applied. Event times, applications, and authentication methods are not shown in either panel, so the differing results remain separate observations with cause unconfirmed. Evidence: [19-admin-ca03-report-only-success.png](../screenshots/19-admin-ca03-report-only-success.png). Successful report-only evaluation is verified for this event; enforcement remains pending.

Rollback for future enforcement: use an unaffected administrator to set this policy Off while preserving other baseline protections.

References: [Microsoft administrator role targeting and phishing-resistant recommendation](https://learn.microsoft.com/en-us/entra/identity/conditional-access/policy-admin-phish-resistant-mfa) and [built-in MFA strength configuration](https://learn.microsoft.com/en-us/entra/identity/conditional-access/policy-all-users-mfa-strength). This design deliberately uses the narrower Global Administrator role and standard MFA strength for the current lab.

Emergency exclusions inspected by user on 2026-10-03: both breakglassadmin and breakglassadmin02 explicitly listed. User-confirmed, not screenshot-verified.

Saved settings confirmed by user on 2026-10-03: Include Directory roles selects Global Administrator; All resources; Report-only. Detailed settings are user-reported rather than screenshot-verified.

Activation update 2026-10-03: policy-list screenshot verifies this policy is now On. Earlier Report-only records remain historical. Evidence: [28-four-policies-on.png](../screenshots/28-four-policies-on.png). Post-activation live sign-in validation pending.

Live enabled-policy result reviewed 2026-10-03: selected regular-administrator Azure Portal sign-in shows Success, with CA03 Success under Conditional Access and CA01/CA02/CA04 Not Applied. Evidence [29-admin-ca03-live-success.png](../screenshots/29-admin-ca03-live-success.png). Identity redacted and timestamp omitted; association follows walkthrough. Authentication method and fresh challenge not established.
