# Build log

## Checkpoint 0 — Personal lab readiness

Status: tenant baseline partially verified; recovery readiness remains pending.

- Dedicated personal tenant, separate from employer: confirmed by user
- Administrative access available: overview screenshot shows the current signed-in account with Global Administrator role; user and group creation completed by user.
- License edition and available user seats: initial tenant overview showed Entra ID Free; subsequent subscription screenshot on 2026-09-27 confirms an active Microsoft Entra ID P2 Trial with 100 licenses and 0 assigned.
- Trial expiration: 2026-10-27; recurring billing is Off, verified from the subscription screenshot.
- Current security defaults / Conditional Access baseline: security defaults enabled, reported by user; existing Conditional Access policies not inspected.
- Recovery readiness: user confirms breakglassadmin has Global Administrator assigned, Microsoft Authenticator enrollment completed, and a fresh sign-in with MFA approval reached the Entra Users page. A reviewed My Signins event shows Security Defaults applied and a previously satisfied MFA result accepted. The fresh portal challenge itself is not yet corroborated in the logs; independent recovery credentials, redundancy, and monitoring remain pending.

Record only non-sensitive summaries here. Do not record tenant identifiers, real email addresses, passwords, recovery codes, or billing details.

## Checkpoint 1 — Test users created

- Date: 2026-09-22
- Status: user creation verified from user-provided screenshot.
- Observed: Alex.Employee, Jamie.Admin, and Taylor.Contractor appear in All users as Member accounts.
- Evidence: screenshot supplied in conversation; publication copy still requires review and saving.
- Limitations: sign-in, role assignments, licensing, and authentication methods have not been verified. An account named breakglassadmin is visible, but its emergency-access configuration has not been verified.
- Next: create and verify the two lab security groups.

## Checkpoint 2 — Group membership verified

- Date: 2026-09-22
- Status: passed for expected direct membership, based on two user-provided screenshots.
- Identity-Security-Lab-Users: exactly three direct members — Alex.Employee, Jamie.Admin, Taylor.Contractor.
- Identity-Security-Lab-Privileged: exactly one direct member — Jamie.Admin.
- Evidence: two membership screenshots supplied in conversation; publication copies not yet saved to the repository.
- Limitations: group type, membership mode, role-assignability, and effective permissions are not established by these membership screenshots.
- Next: inspect license edition and security defaults, then verify emergency-access readiness before policy enforcement.

## Checkpoint 3 — Emergency access assessment

- Status: in progress.
- Role check: user reports Global Administrator appears under breakglassadmin > Assigned roles.
- Initial observation: screenshot showed "No usable methods," "No non-usable methods," and no default sign-in method. System-preferred MFA was enabled, but no system-preferred MFA method was present. This did not mean the account lacked a password.
- Remediation: user reports completing the Microsoft Authenticator enrollment instructions; post-enrollment Authentication methods view has not yet been reviewed.
- Fresh sign-in test: passed based on user report. User answered yes to both Authenticator prompt/approval and successful opening of Entra ID > Users > All users after following the private-session sign-in instructions.
- Test scope: MFA challenge and portal-page access; no privileged write operation or loss-of-normal-admin recovery drill was performed.
- Log evidence reviewed: supplied screenshot shows a successful interactive My Signins event on 2026-09-22 at 4:25:21 PM (portal local display), error code 0, multifactor authentication requirement, and Conditional Access Not Applied. This event has not been correlated with the reported Entra portal test; it may relate to enrollment.
- Authentication Details reviewed on 2026-09-23: screenshot shows Authentication Policies Applied = Security Defaults; Authentication method = Previously satisfied; Succeeded = true. Result detail is truncated as "MFA requirement satis..." and its full text is unverified. This supports acceptance of previously satisfied MFA, without identifying the original method or documenting a fresh challenge in this event.
- Saved evidence: [04-breakglass-mfa-signin.png](../screenshots/04-breakglass-mfa-signin.png), copied unchanged from the supplied cropped screenshot. No personal identifiers, credentials, or enrollment QR codes are visible in this image.
- Earlier event: My Signins at 4:22:52 PM shows Interrupted with error 50055. Microsoft documents this code as an expired-password condition; the particular password-change sequence has not been confirmed. Reference: https://learn.microsoft.com/en-us/entra/identity-platform/reference-error-codes
- Equipment check: on 2026-09-23, user reports no physical FIDO2 security key. Other independent authentication devices have not been assessed.
- Second account: on 2026-09-23, user reports breakglassadmin02 created and Microsoft Authenticator enrollment completed after following the second-account setup instructions.
- Second account sign-in test: on 2026-09-26, user reports testing the account successfully with MFA. Matching sign-in logs have not been reviewed; the statement does not establish its Global Administrator assignment.
- Second account role assignment: verified from screenshot supplied on 2026-09-26. Global Administrator is listed with Resource name Directory, Resource type Organization, Assignment path Direct, and Role type Built-in.
- Saved role evidence: [05-second-emergency-account-role.png](../screenshots/05-second-emergency-account-role.png), copied unchanged from the supplied screenshot; no personal identifiers or credentials are visible.
- Authentication terminology: user describes entering the browser's challenge number into Microsoft Authenticator; this is push MFA with number matching, distinct from entering an app-generated TOTP into a website.
- Next: check premium licensing/trial availability for Conditional Access and PIM while retaining the current security defaults baseline. Monitoring remains planned. See [emergency-access design](../policies/break-glass.md).
- Limitation: successful sign-in establishes basic access under current conditions. Resilience to loss of the normal administrator's device or authentication service has not been established.

## Checkpoint 4 — Premium feature licensing

- Status: P2 trial activation verified; license page shows three assigned seats and all three test users. Premium feature tests remain pending.
- Target: Microsoft Entra ID P2 in the existing personal lab tenant, for Conditional Access and PIM exercises.
- Microsoft documentation links to a P2 trial: https://learn.microsoft.com/en-us/entra/fundamentals/get-started-premium
- Offer observed on 2026-09-26: Microsoft Entra ID P2 - Trial, one month free with payment details required. The screenshot shows a new-account setup path for the user's personal Microsoft account, not confirmed activation in the existing lab tenant. The screenshot contains a personal email and is not copied to public evidence.
- Checkout observed on 2026-09-27: Microsoft 365 admin center shows organization Default Directory; product Microsoft Entra ID P2 Trial; one-month term; quantity 100; free during trial; total USD 0.00. Payment method must be added. The displayed notice says it will not be charged with this order and is used to verify identity. The summary says continuation can be purchased before trial expiry. No activation or completed order is yet confirmed.
- Activation verified from supplied subscription screenshot on 2026-09-27: Microsoft Entra ID P2 Trial; Subscription status Active; license count 0 / 100 assigned; expiration date 2026-10-27; recurring billing Off; initial purchase date 2026-09-27; unit price Free trial. Checkout and subscription billing screenshots are not copied to public evidence.
- Assignment attempt observed on 2026-10-01: screenshot reports all three assignments unsuccessful. Alex.Employee, Jamie.Admin, and Taylor.Contractor each show "License assignment cannot be done for user with invalid usage location." The underlying location field has not been inspected, so missing versus invalid values are not yet distinguished.
- Troubleshooting: user reported the value was not saving; the subsequent screenshot showed City selected in the bulk property editor. Guided user to select Usage location, save, and retry. Exact stored location values have not been inspected.
- Result observed on 2026-10-01: user reports success; supplied Microsoft Entra ID P2 license page shows 3 / 100 assigned and lists Alex.Employee, Jamie.Admin, and Taylor.Contractor. The side panel says "Your licenses are being assigned," so this records the displayed assignments rather than a completed premium-feature test.
- Saved evidence: [06-p2-test-user-licenses.png](../screenshots/06-p2-test-user-licenses.png). Supplied image contains synthetic user names and license counts without visible personal identifiers or payment details.
- Next: enroll Alex.Employee in Microsoft Authenticator, then the other test personas, while retaining security defaults.
- One-time lab setup exception: breakglassadmin02 was the advised tenant-native account for signup because the personal-account signup did not recognize the existing organization; this is setup activity, not an emergency recovery event. Return to the normal administrator session afterward.
- Preserve security defaults during licensing setup. Assign appropriate licenses to participating lab users before premium feature testing.

## Checkpoint 5 — Workforce MFA enrollment

- Status: all three workforce enrollments completed based on user reports; Alex's successful app-required MFA event reviewed. A fresh MFA challenge is not established by the reviewed event. Security defaults remains the intended baseline.
- Alex.Employee: Microsoft Authenticator enrollment completed, reported by user on 2026-10-01 after the enrollment walkthrough. Subsequent sign-in evidence is recorded below.
- Jamie.Admin and Taylor.Contractor: user confirmed completion after the walkthrough to enroll both accounts in separate private sessions. Authentication-method screenshots and matching sign-in logs have not been reviewed.
- Log investigation: the initial user-specific view returned no entries. A later view showed events; the precise cause of the earlier empty result is unconfirmed. The 09:19:53 local event had a single-factor requirement and was distinct from the My Signins event one second earlier.
- Reviewed result on 2026-10-01: Alex's My Signins event at 09:19:52 portal local time shows Success, error 0, Multifactor authentication requirement, and Conditional Access Not Applied. Authentication Details shows "App requires multifactor authentication," method "Previously satisfied," and Succeeded true. The result detail is truncated as "MFA requirement satis...".
- Conclusion: the app required MFA and accepted previously satisfied authentication. This event does not demonstrate a fresh Authenticator challenge, identify the original method, or establish custom Conditional Access enforcement. Do not attribute this event's MFA requirement to Security Defaults; the displayed source is the app.
- Evidence: [07-alex-app-mfa-previously-satisfied.png](../screenshots/07-alex-app-mfa-previously-satisfied.png), copied unchanged from the supplied details screenshot. Account and application association comes from the preceding log list and matching timestamp. The log list itself is not saved for publication because location information remains visible.
- Next: inspect Conditional Access policies and prepare a scoped lab policy. Keep security defaults enabled until a baseline transition is prepared.

## Checkpoint 6 — Conditional Access pilot

- Observed on 2026-10-01: Policies screenshot shows the first-policy introduction with no policies listed. New policy is available; no security-defaults banner is visible in this screenshot. This does not establish the current security-defaults setting.
- Prepared [pilot design](../policies/conditional-access.md): LAB-CA01-Require-MFA-Lab-Users, include the lab-users group, explicitly exclude both emergency accounts, target all resources, require built-in MFA strength, initially Report-only.
- Creation verified on 2026-10-01: supplied policy-list screenshot shows LAB-CA01-Require-MFA-Lab-Users in Report-only state; one user-created policy and zero Microsoft-managed policies. The screenshot confirms name and state, not detailed assignments or grant settings.
- Evidence: [08-ca01-report-only.png](../screenshots/08-ca01-report-only.png), copied unchanged from the supplied screenshot.
- What If result reviewed on 2026-10-01: Azure Files, Windows, Browser; policy appears under Policies that will apply with Authentication strength - Multifactor authentication, Report-only state, Has filter No, and blank session controls. Alex.Employee is associated via preceding setup screenshots; the result crop does not show the user field. The originally suggested Azure Management resource names returned no matches, so an available Azure Files resource was used for simulation.
- Saved simulation evidence: [09-ca01-what-if-lab-user.png](../screenshots/09-ca01-what-if-lab-user.png). No storage was created or accessed by this simulation. The result is not proof of live MFA enforcement.
- Emergency-account results reviewed on 2026-10-01: both simulations place LAB-CA01-Require-MFA-Lab-Users under Policies that will not apply with reason Users and groups and state Report-only. Azure Files, Windows, and Browser are visible. User confirms the first screenshot is breakglassadmin and the second is breakglassadmin02; identity selectors are outside both crops.
- Saved evidence: [10-ca01-what-if-breakglass.png](../screenshots/10-ca01-what-if-breakglass.png) and [11-ca01-what-if-breakglass02.png](../screenshots/11-ca01-what-if-breakglass02.png). The latter contains the shared Azure Files application ID, not a tenant-specific user identifier.
- Explicit exclusions reviewed on 2026-10-01: policy editor shows Exclude > Users and groups checked, 2 users, breakglassadmin and breakglassadmin02 listed. All resources, no configured network, 0 conditions, 1 grant control, and 0 session controls are also visible. Included-group details are not open.
- Saved evidence: [12-ca01-emergency-exclusions.png](../screenshots/12-ca01-emergency-exclusions.png).
- Real sign-in result reviewed on 2026-10-02: Alex.Employee's Report-only tab lists the lab policy (truncated name), Require authentication strength, and Report-only: Success. Background events are dated 2026-10-01; the exact selected event time and application are not visible in the details panel. Evaluation succeeded without establishing enforcement or a fresh MFA challenge.
- Evidence supplied in conversation; not copied to public screenshots because partial request identifiers remain visible behind the details panel. Prepare a cropped or redacted copy before publication.
- On 2026-10-02, user confirms the included group is Identity-Security-Lab-Users and security defaults remains Enabled.
- Next: prepare a scoped legacy-authentication block policy in Report-only. Tenant-wide replacement coverage, administrator protection, licensing of remaining participating accounts, and recovery readiness still need preparation before disabling security defaults. Only the three test users' P2 assignments are currently evidenced.

## Checkpoint 7 — Legacy authentication pilot

- Status: creation, Report-only state, and client-condition comparison verified on 2026-10-02; emergency-account Other clients tests passed by user report. Explicit CA02 exclusions, complete configuration inspection, and enforcement remain pending.
- Design: [legacy authentication policy](../policies/block-legacy-authentication.md).
- Evidence: [13-ca01-ca02-report-only.png](../screenshots/13-ca01-ca02-report-only.png), supplied screenshot showing LAB-CA01-Require-MFA-Lab-Users and LAB-CA02-Block-Legacy-Auth-Lab-Users both in Report-only. Two user-created policies and zero Microsoft-managed policies are displayed.
- Comparison reviewed on 2026-10-02: Other clients (UI label Mobile apps and desktop clients - Other clients) shows CA01 and CA02 under Policies that will apply, with MFA strength and Block access respectively. Browser shows CA02 will not apply due to Client app. Both policies remain Report-only. Alex and the first result's target resource are associated from test context; both crops omit identity, and only the second shows Azure Files.
- Evidence: [14-ca02-what-if-other-clients.png](../screenshots/14-ca02-what-if-other-clients.png) and [15-ca02-what-if-browser.png](../screenshots/15-ca02-what-if-browser.png), copied unchanged. These results are simulations, not evidence of a blocked real sign-in.
- Emergency-account results: supplied Browser screenshots show both policies do not apply due to Users and groups; user identifies breakglassadmin and breakglassadmin02. After correction to the requested Other clients scenario, user confirms on 2026-10-02 that both match the expected CA02 non-applicability result. Corrected runs are confirmed by report only, not screenshots.
- Next: establish which account is used for routine administration and verify its MFA/licensing before preparing administrator policy coverage. Explicit CA02 exclusion inspection remains pending. Keep security defaults Enabled and both policies Report-only while preparing administrator and remaining-account coverage.

## Checkpoint 8 — Regular administrator preparation

- On 2026-10-02, user identifies the selected personal-name account in All users as their routine administrator, separate from the two emergency accounts and Jamie.Admin.
- Screenshot displays Member and an onmicrosoft.com UPN for that object. Identity provider, current role assignments, P2 licensing, and authentication methods are not established by the user list. Do not infer the underlying sign-in identity type solely from the UPN.
- Personal name and identifiers are omitted from project documentation; supplied image is not saved as public evidence because tenant-domain fragments remain visible.
- On 2026-10-02, user reports the regular administrator is now licensed after the P2 assignment walkthrough. No updated assignment screenshot or total seat count has been reviewed; do not present 4 / 100 as observed.
- On 2026-10-02, user reports Global Administrator listed, an Authenticator number-matching challenge completed during the instructed fresh-session test, and successful Entra admin center access. These are user-reported checks; matching logs and a current role screenshot have not been inspected.
- Next: create the Global Administrator MFA pilot in Report-only and evaluate the normal administrator and emergency exceptions. Keep the current administrator session open during tests.
- Keep security defaults Enabled and both existing lab policies Report-only during preparation.

## Checkpoint 9 — Global Administrator MFA pilot

- Status: CA03 creation and Report-only state verified on 2026-10-02; configuration details and evaluation remain pending.
- Design: [Global Administrator MFA policy](../policies/admin-mfa.md). Scope is the Global Administrator directory role, with both emergency accounts explicitly excluded.
- Uses built-in Multifactor authentication strength for the current Authenticator lab setup. Phishing-resistant administrator authentication remains a future improvement, not a completed control.
- Evidence: [16-three-policies-report-only.png](../screenshots/16-three-policies-report-only.png), supplied screenshot showing all three policies in Report-only. Policy names and states are verified; CA03's configured role and exclusions are not visible here.
- What If results reviewed: regular administrator scenario shows CA03 applies with Multifactor authentication strength; both emergency-account scenarios show CA03 does not apply due to Users and groups. Azure Files / Windows / Browser is visible in each supplied result. Some identity text is clipped or redacted; account association also follows the requested test sequence.
- Alex initially showed all policies not applicable. After the requested rerun, the supplied result shows CA01 as the sole applicable policy with Multifactor authentication strength and Report-only state. The cause of the earlier discrepancy is unconfirmed; do not claim a configuration change or cache issue was established.
- Evidence supplied in conversation; administrator screenshot requires further redaction before public saving. Corrected Alex result saved as [17-alex-ca01-rerun.png](../screenshots/17-alex-ca01-rerun.png). The result crop omits the identity selector; association is based on the test sequence.
- Next: inspect a real regular-administrator sign-in's CA03 report-only result. Explicit CA03 exclusion and role-selection inspection remain pending before enforcement. Keep security defaults Enabled and all three policies Report-only.

- Live CA03 result reviewed on 2026-10-03: supplied Report-only panel shows CA03 with Require authentication strength and truncated result "Report-only: User action requir..."; CA01 and CA02 both show Report-only: Not applied. Associated with the regular administrator by the walkthrough; screenshot omits identity, application, and timestamp.
- Interpretation: CA03 matched the event and would require user action to satisfy its grant. Report-only did not enforce that action. This result does not establish a failed sign-in or a completed fresh MFA challenge in this event. Inspect Authentication Details and event context before changing policy state.
- Saved evidence: [18-admin-ca03-user-action-required.png](../screenshots/18-admin-ca03-user-action-required.png), copied unchanged from the supplied cropped panel with no personal identifiers visible.

- Additional live CA03 result reviewed on 2026-10-03: user reports opening an event about one minute earlier; supplied Report-only panel shows CA03 Success with Require authentication strength, while CA01 and CA02 are Not applied. Exact event times and applications remain outside the crop. This establishes successful report-only evaluation for the earlier event; it does not invalidate the separate User action required result or establish the method used.
- Saved evidence: [19-admin-ca03-report-only-success.png](../screenshots/19-admin-ca03-report-only-success.png).
- Next coverage step: add the licensed regular administrator explicitly to CA02 Include alongside the lab-users group, preserving both emergency exclusions and Report-only. This closes the planned legacy-client coverage gap for the routine administrator; the additional Test User account and remaining baseline protections still require review before disabling security defaults.

## Reusable test record

- 2026-10-03: user reports CA04 creation complete after instructions to include the lab-users group and regular administrator, exclude both emergency accounts, target All resources, select Device code flow condition, Block access, and Report-only. See [device-code pilot](../policies/block-device-code-flow.md). Configuration is user-reported; simulation and dependency review remain pending. Security defaults remains Enabled.

- 2026-10-03 administrator Browser comparison passed: CA03 alone applies; CA02 does not apply due to Client app and CA01 due to Users and groups. All Report-only. Result crops saved as evidence 21 and 22; account and Browser association follows the requested walkthrough. Next inspect explicit CA02/CA03 emergency exclusions and remaining saved settings before any enforcement transition.

- 2026-10-03 administrator CA02 scope-extension test: requested Windows / Other clients rerun shows CA02 Block access and CA03 Multifactor authentication strength applicable, both Report-only. Saved as [20-admin-ca02-ca03-other-clients.png](../screenshots/20-admin-ca02-ca03-other-clients.png). Identity and resource are associated through the walkthrough rather than visible selectors. Browser comparison and explicit saved exclusions remain pending; security defaults stays Enabled.

- Date:
- Control and business risk:
- Prerequisites:
- Configuration:
- Expected result:
- Actual result:
- Evidence filename:
- Recovery / rollback:
- Limitations:
- Status: not run / passed / failed / blocked

- 2026-10-03: user confirms CA02 and CA03 each explicitly exclude breakglassadmin and breakglassadmin02 under Users > Exclude > Users and groups. User-reported configuration inspection; no new screenshot supplied. Both remain Report-only; remaining client-app and role-selection checks pending.

- 2026-10-03: user confirms CA02 Client apps Configure Yes with only Exchange ActiveSync clients and Other clients selected; CA03 Include Directory roles has Global Administrator selected; both target All resources and remain Report-only. These are user-reported saved-setting inspections. Security defaults remains Enabled. Next resolve the additional Test User account's intended use and baseline coverage.

- 2026-10-03: user confirms Test User Account enabled set to No and saved following the recommended unused-account handling. Account retained; sign-in disabled based on user report, not screenshot verification. Existing sessions have not been reviewed or revoked. Active routine-account baseline remains the three synthetic lab users and licensed regular administrator; two emergency accounts retain documented exceptions.

- 2026-10-03 CA04 Alex comparison reviewed: CA04 Block access applies in the first result and does not apply due to Authentication flow in the second. CA01/CA02 also apply in first; exact client selection is outside crop, so overlap is recorded without attributing a particular client option. Evidence 23/24 saved unchanged. Administrator and emergency-account scope checks pending.

- 2026-10-03: CA04 scope screenshots 25-27 match requested admin and two emergency scenarios. Admin result CA02/03/04 apply; emergency results all four not applied due to Users and groups. Device code flow and Other clients visible. Selected identities outside crops; association based on requested sequence. All Report-only. Remaining checks: explicit CA04 emergency exclusions and device-code dependency review.

- 2026-10-03: user confirms explicit CA04 emergency exclusions and reports no device-code dependencies. Pilot validation complete for current known routine accounts. Prepared transition: preserve regular-admin session, verify emergency portal access in separate private session, disable security defaults then immediately switch CA01-CA04 On, and validate fresh Alex/admin sign-ins and Conditional Access results. No transition or enforcement reported yet. Emergency credential independence remains a documented limitation; P2 trial expiry 2026-10-27 requires a licensing or rollback decision.

- 2026-10-03 activation: supplied policy-list screenshot verifies CA01, CA02, CA03, and CA04 all On, four user-created policies, zero Microsoft-managed policies. Evidence 28 saved unchanged. Security defaults disablement and separate emergency portal test were instructed but are not directly shown or separately confirmed by this screenshot. Actual post-activation sign-in evaluation remains pending.

- 2026-10-03 post-activation Alex sign-in: screenshot shows Alex.Employee log with selected event 13:13:05 local and Conditional Access tab CA01 Success (Require authentication strength); CA02, CA03, CA04 Not Applied. Establishes successful live evaluation of enabled CA01, not proof of a fresh MFA challenge or live block-policy tests. Authentication Details not inspected. Screenshot retained in conversation only because background exposes partial request identifiers; sanitized crop needed before public evidence saving. Next validate regular-admin live CA03 result.

- 2026-10-03 post-activation regular-administrator test: supplied redacted screenshot shows selected Azure Portal Success event and Conditional Access CA03 Success with Require authentication strength; CA01/CA02/CA04 Not Applied. Saved as evidence 29 unchanged. Account association follows walkthrough; timestamp and Authentication Details omitted. Establishes enabled-policy satisfaction, not a fresh MFA challenge or success for every listed event; another background event shows Failure with cause unexamined. Next verify post-activation emergency access and policy exclusions.

- 2026-10-03: user reports both emergency accounts pass post-activation private-session Entra portal access and new-sign-in checks showing all four lab policies Not Applied. User-confirmed recovery/access test; no new screenshot supplied. Does not establish independent authentication devices, phishing-resistant credentials, or outage recovery. Live MFA policy checks complete for Alex and regular admin; actual legacy/device-code blocking remains untested.

- 2026-10-03 PIM assignment attempt: Jamie.Admin eligible Reports Reader assignment failed at 21:22:06 UTC with message 'The role is not found.' No successful assignment established. Cause not yet confirmed; investigate fresh role selection and alternate user Assigned roles route before changing privileges. Screenshot contains tenant/correlation identifiers and was not saved to public evidence.

- 2026-10-03 PIM investigation: Jamie audit screenshot shows two PIM RoleManagement Add eligible member activities failed with RoleNotFound at 14:22:06 and 14:24:03 local. Confirms second attempt same error category. Eligible assignments screenshot filtered Reports Reader shows No results. No assignment succeeded. Tenant-specific target identifiers visible, so audit screenshot not copied into public evidence. Role initialization or portal resolution issue remains a hypothesis, not established.

- 2026-10-03 third eligible Reports Reader assignment attempt failed after opening the role page and refreshing, with 'The role is not found' at 21:31:42 UTC based on returned notification context and user confirmation. Stop portal retries. Next read-only Microsoft Graph unified role-definition inspection; no Active workaround or added privileges authorized by this troubleshooting step.

- 2026-10-03 Graph diagnostic: corrected GET roleManagement/directory/roleDefinitions query returns 403 Authorization_RequestDenied, insufficient privileges. Role definition has not been inspected yet. This Graph authorization error is separate from the earlier PIM RoleNotFound failures. Next grant only required read permission to Graph Explorer and rerun; no role-write permission needed for this diagnostic.

- 2026-10-04 Graph role-definition read succeeded (200 user-reported, response screenshot inspected): Reports Reader id/templateId 4a5d8f65-41da-4de4-8968-e035b65339cf, isBuiltIn true, isEnabled true. Confirms unified role definition exists and is enabled; does not resolve PIM RoleNotFound or establish directoryRole instance initialization. Next read directoryRoles by template ID.

- 2026-10-04: Graph GET directoryRoles by Reports Reader template ID returns 404 Request_ResourceNotFound. Unified role definition previously exists/enabled. Missing tenant directoryRole instance is supported by these reads and is a plausible cause of PIM RoleNotFound, not yet proven causal. Next initialize directoryRole via documented POST without adding members, then retry time-bound eligibility. Raw screenshot request identifiers not saved publicly.

- 2026-10-04 Reports Reader initialization: inspected Graph Explorer POST /v1.0/directoryRoles with Reports Reader template ID returns 201 Created and displayName Reports Reader. Tenant directoryRole instance now exists; operation does not assign members or grant Jamie active access. Tenant-specific role-instance ID visible, so screenshot not saved publicly. Next retry Jamie time-bound eligible Reports Reader assignment ending October 20; causal resolution of prior PIM failure remains unverified until assignment succeeds.

- 2026-10-04 at 17:03:28 UTC: portal retry after successful directoryRole initialization still fails with 'The role is not found.' Initialization did not resolve the issue; no eligible assignment established. Next use documented Graph eligibility schedule request with verified unified role-definition ID to distinguish portal from service behavior.

- 2026-10-04 17:04:45 UTC: direct Graph POST roleEligibilityScheduleRequests using verified Reports Reader unified role-definition ID, Jamie principal ID, tenant scope and expiration returns 404 RoleNotFound. Confirms error occurs in PIM service as well as portal; no assignment created. Directory-role initialization alone has not fixed eligibility. Allow propagation then one bounded retry; if persistent, collect Microsoft support diagnostic rather than assign Active or substitute elevated role.

- 2026-10-04 17:12:58 UTC (10:12:58 Pacific): bounded direct eligibility retry still returns 404 RoleNotFound. Stop repeated writes. No Jamie eligible assignment established; propagation hypothesis not validated. Prepared docs/pim-support-summary.md for Microsoft investigation; no case submitted. PIM phase unresolved, other lab phases may proceed.

- 2026-10-04 10:39 AM Pacific: user-created Microsoft support case verified Open, severity C, technical support Included, email contact and advanced diagnostic permission granted. No messages shown yet. Personal contact details and support identifiers intentionally omitted from public notes; screenshot not copied. PIM remains unresolved pending Microsoft investigation.

- 2026-10-04: user confirms Taylor.Contractor remains a member of Identity-Security-Lab-Users before access-review/offboarding exercise. Baseline user-reported. No membership removal or sign-in change performed at this checkpoint. Next prepare one-time native group access review with regular-admin reviewer and automatic application disabled.

- 2026-10-04: screenshot verifies LAB-AR01-Lab-Users-Contractor-Review created for Identity-Security-Lab-Users, resource Group, status Not started, creation date October 4. Evidence 30 saved unchanged. Saved reviewer, Everyone scope, schedule, no-response behavior and auto-apply settings not yet inspected; no decisions or membership changes established.

- 2026-10-04 My Access review screenshot verifies LAB-AR01 decisions: Alex.Employee Approved, Jamie.Admin Approved, Taylor.Contractor Denied, by designated regular administrator. Recommendations were Approve for all three; Taylor denial reflects instructed simulated contract end. Justification text and applied status not visible. No membership removal established. Screenshot exposes personal reviewer and tenant UPNs, so not saved to public evidence. Next disable Taylor sign-in and revoke sessions before applying group removal to avoid leaving an active user outside group-scoped MFA.

- 2026-10-04: user reports Taylor.Contractor Account enabled set to No and sessions revoked following offboarding instructions. User-reported, no screenshot inspection of those settings. Review denial recorded; applying membership removal remains pending. Disablement precedes removal because CA01, CA02 and CA04 include Taylor through Identity-Security-Lab-Users, not an all-users baseline. Session revocation is not claimed to instantly invalidate every existing application access token.

- 2026-10-04 post-review membership screenshot verifies Identity-Security-Lab-Users now has exactly two direct members: Alex.Employee and Jamie.Admin. Taylor.Contractor absent from direct members after requested Stop/Apply sequence. Review application status/audit not separately inspected; membership outcome verified. Partial object IDs visible so screenshot not saved publicly. Taylor disablement/session revocation user-reported; fresh blocked sign-in test pending.

- 2026-10-04 Taylor offboarding validation: supplied interactive sign-in list shows two My Signins failures for Taylor.Contractor at approximately 11:12 and 11:13 local, both error 50057. Confirms disabled-account sign-in failure per Microsoft error definition. User asks about logged IP differing from laptop IP; addresses not disclosed, source of comparison unknown. IP attribution not determined. Screenshot partial request/user IDs and location not copied publicly.

- 2026-10-04 PowerShell Graph audit first read verified: Alex.Employee and Jamie.Admin accountEnabled True; Taylor.Contractor and Test User False. Screenshot of dictionary-to-PSCustomObject formatted output inspected. Graph.Authentication 2.41.0 installed on Windows PowerShell 5.1; process RemoteSigned resolved module import; delegated Process authentication verified. Initial Select-Object formatting produced blank fields for dictionary rows; corrected explicit key extraction succeeded. Next verify lab group membership through Graph.

- 2026-10-04 Graph audit membership check verified: direct members query for Identity-Security-Lab-Users returns Alex.Employee and Jamie.Admin only, matching portal post-review membership. Taylor absent. Read-only GET result inspected in supplied PowerShell screenshot.

- 2026-10-04 Graph audit policy-state query verifies LAB-CA01, CA02, CA03, CA04 all state enabled, matching portal On evidence. License and role audit reads remain pending.

- 2026-10-04 Graph audit assigned-license counts inspected: Alex.Employee 1, Jamie.Admin 1, Taylor.Contractor 1, Test User 0. Product identity not yet established by count query. Taylor retains license after disablement/group removal; no license reclamation performed. Next map assigned SKU IDs to subscribed product codes.

- 2026-10-04 Graph license product mapping verified: Alex.Employee, Jamie.Admin, and Taylor.Contractor each assigned AAD_PREMIUM_P2; Test User has no assigned product. Taylor retains P2 after account disablement and lab group removal. No license reclamation performed.

- 2026-10-04 Graph eligibility audit verified: Jamie.Admin roleEligibilityScheduleInstances query succeeded with zero instances. No eligible role assignment established; PIM remains unresolved pending Microsoft support. Active role assignment check remains pending.

- 2026-10-04 Graph active-role audit verified: Jamie.Admin has zero direct roleAssignments, alongside zero roleEligibilityScheduleInstances. Group-inherited roles have not yet been checked. PIM assignment remains unresolved.

- 2026-10-04 Jamie transitive group membership query returned Identity-Security-Lab-Privileged and Identity-Security-Lab-Users, with no next page. isAssignableToRole rendered blank for both; this is not treated as an explicit False. Direct group role-assignment checks remain pending.

- 2026-10-04 Jamie group-inherited active-role check verified: Identity-Security-Lab-Privileged and Identity-Security-Lab-Users each have zero roleAssignments and no next page. Combined with Jamie's zero direct active assignments, no active Entra role is present through the inspected direct/group paths. Jamie's direct eligibility instance count is also zero; group eligibility was not queried. The privileged group name alone does not grant a role. PIM remains unresolved pending support.

- 2026-10-04 Consolidated read-only audit script live run verified: saved JSON generated at 19:00:22 UTC inspected locally; all 12 reads succeeded. Users, products, memberships, and policy states match prior checks. Jamie and both named lab groups each have zero active role assignments and zero eligible role instances. Sanitized narrative snapshot saved in docs/audit-results-2026-10-04.md. Raw generated report remains under ignored exports/.

- 2026-10-04 Portfolio review: all 27 saved PNG screenshots (04-30) visually inspected. No visible full personal UPN/domain, private tenant/user/request IDs, personal IP/location, or credentials found. Shared Azure Files application IDs and placeholder IP examples remain visible; they are not private tenant data. Existing synthetic names and redactions retained. Text privacy scan found only shared Reports Reader template IDs and generic domain references. Markdown local links validated with zero broken links. Publication not yet performed.
