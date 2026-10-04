# Conditional Access lab policy

Status: creation and Report-only state verified on 2026-10-01. What If shows the policy applies to the tested Azure Files / Windows / Browser scenario with the Multifactor authentication strength grant. Alex is associated with this run from the preceding setup context; the results screenshot omits the identity field. Both emergency accounts are explicitly excluded in the reviewed policy editor. Included group selection and live enforcement remain unverified.

## Purpose

Require MFA for access to resources by the three synthetic workforce users. Begin with report-only evaluation to check scope and results before enforcement.

## Planned configuration

| Setting | Value |
| --- | --- |
| Name | LAB-CA01-Require-MFA-Lab-Users |
| Include users | Identity-Security-Lab-Users group |
| Exclude users | breakglassadmin and breakglassadmin02 explicitly |
| Target resources | All resources |
| Conditions | No additional conditions |
| Grant | Grant access; require built-in Multifactor authentication strength |
| Session controls | None configured |
| Initial state | Report-only |

The regular administrator is outside the included group based on the reviewed membership. Explicit emergency-account exclusions preserve the intended scope if group membership changes. These exclusions apply only to this policy, not to app or platform MFA requirements.

## Baseline and rollout

Keep security defaults enabled during preparation. If the portal requires disabling security defaults to proceed, inspect that message and prepare the replacement baseline before changing the setting. This scoped pilot is not a tenant-wide replacement for security defaults. Appropriate licensing, administrator protection, legacy authentication controls, recovery access, and remaining tenant identities must be addressed for that transition.

Report-only does not enforce this MFA grant. Existing authentication claims can satisfy MFA; a fresh prompt on every sign-in is not the goal of this policy.

## Planned validation

- Inspect the saved scope, grant, and state.
- Use What If to check an included test user and excluded emergency accounts.
- Inspect real sign-in report-only results and authentication details; distinguish evaluation from enforcement and prior MFA from a new challenge.
- Enable only after the baseline transition is prepared; test an allowed sign-in and controlled failure to complete required MFA.
- If enforcement causes unintended impact, use an unaffected administrator to set this policy to Off and verify restoration. Preserve the other baseline controls.

## Observed validation

- What If included-user test, 2026-10-01: policy listed under Policies that will apply, grant Authentication strength - Multifactor authentication, state Report-only, Has filter No, session controls blank. Resource Azure Files, platform Windows, client Browser are visible. Alex.Employee was selected in the preceding setup screenshots but is outside the results crop.
- Evidence: [09-ca01-what-if-lab-user.png](../screenshots/09-ca01-what-if-lab-user.png).
- The original Azure Management resource searches returned no results; Azure Files was selected as an available simulation target. This did not provision storage or grant access.
- Emergency-account simulations, 2026-10-01: both supplied results show the lab policy under Policies that will not apply, reason Users and groups, state Report-only, using Azure Files / Windows / Browser. The user identified the first result as breakglassadmin and the second as breakglassadmin02; neither result crop shows the selected identity. This reason alone does not distinguish explicit exclusion from absence from the included group.
- Evidence: [10-ca01-what-if-breakglass.png](../screenshots/10-ca01-what-if-breakglass.png) and [11-ca01-what-if-breakglass02.png](../screenshots/11-ca01-what-if-breakglass02.png).
- Policy editor reviewed on 2026-10-01: Exclude > Users and groups lists breakglassadmin and breakglassadmin02 (2 users). Also shows All resources, Network not configured, 0 conditions, 1 grant control, and 0 session controls. Inclusion details and the selected grant are not open in this screenshot; the grant was observed in What If results.
- Evidence: [12-ca01-emergency-exclusions.png](../screenshots/12-ca01-emergency-exclusions.png), supplied with tenant-domain portions obscured.
- Real sign-in evaluation reviewed on 2026-10-02: supplied Alex.Employee sign-in screenshot shows the lab policy (name truncated) with Require authentication strength and Report-only: Success. The background list contains 2026-10-01 events, but the details panel does not expose the selected event's application or exact timestamp. Do not attribute a specific application or timestamp without further evidence.
- Interpretation: policy evaluation found its requirements satisfied for this event; the policy did not enforce the grant. This screenshot does not establish a fresh MFA challenge or its original method.
- Screenshot supplied in conversation; a public copy is pending cropping/redaction of background request identifiers.
- On 2026-10-02, user confirms Include selects Identity-Security-Lab-Users and security defaults is Enabled. Enforcement remains pending. What If and report-only results do not establish enforced access control or recovery readiness.

Reference: [Microsoft MFA policy guidance](https://learn.microsoft.com/en-us/entra/identity/conditional-access/policy-all-users-mfa-strength), adapted here to a pilot group rather than all users.

Activation update 2026-10-03: policy-list screenshot verifies this policy is now On. Earlier Report-only records remain historical. Evidence: [28-four-policies-on.png](../screenshots/28-four-policies-on.png). Post-activation live sign-in validation pending.

Live enabled-policy result reviewed 2026-10-03: Alex.Employee selected sign-in at 13:13:05 local shows CA01 Success under Conditional Access, with Require authentication strength; CA02-CA04 Not Applied. Enabled CA01 successfully evaluated this event. Fresh challenge/method not established by this tab. Supplied screenshot contains partial request identifiers and was not copied to public evidence.
