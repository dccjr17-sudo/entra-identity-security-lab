# Evidence collection

Keep raw captures in the ignored `private-evidence/` folder and out of Git. Only reviewed, sanitized images belong here.

Initial evidence, after configuration:

1. `01-test-users.png`: the three fictional users.
2. `02-lab-users-members.png`: all three members of the standard group.
3. `03-lab-privileged-members.png`: Jamie as the only privileged-group member.

Capture the relevant panel with enough context to show what was tested. Crop or permanently redact real email addresses, tenant and object IDs, tenant domains, IP addresses, personal details, billing information, passwords, tokens, recovery codes, and MFA enrollment QR codes. Never include employer data. Reopen the final image and inspect it before adding it to GitHub.

Reference evidence from the build log alongside actual observed results. Screenshots of settings alone do not demonstrate successful enforcement.

## Saved evidence

- [19-admin-ca03-report-only-success.png](19-admin-ca03-report-only-success.png): supplied on 2026-10-03 for an event the user describes as about a minute earlier than the User action required event. CA03 shows Success and Require authentication strength; CA01 and CA02 are Not applied. Event identity, application, timestamp, and authentication method are outside the crop. Demonstrates successful evaluation, not enforcement.

- [18-admin-ca03-user-action-required.png](18-admin-ca03-user-action-required.png): supplied on 2026-10-03. Shows CA03's Require authentication strength grant and a truncated User action required result; CA01 and CA02 are Not applied. Event identity, application, and timestamp are outside the crop; regular-admin association follows the walkthrough. Indicates action would be required, not an enforced challenge or failed sign-in.

- [17-alex-ca01-rerun.png](17-alex-ca01-rerun.png): corrected Alex What If result after an initially unexpected result. Shows Azure Files / Windows / Browser and CA01 as the sole applicable policy, with Multifactor authentication strength and Report-only state. Identity selector is outside the crop; Alex is associated via the requested rerun. Earlier discrepancy's cause remains unconfirmed.

- [16-three-policies-report-only.png](16-three-policies-report-only.png): supplied on 2026-10-02. Shows CA01, CA02, and CA03 in Report-only with three user-created policies and zero Microsoft-managed policies. Does not establish CA03's assignments or grant configuration.

- [14-ca02-what-if-other-clients.png](14-ca02-what-if-other-clients.png) and [15-ca02-what-if-browser.png](15-ca02-what-if-browser.png): supplied on 2026-10-02. CA02 applies with Block access for Other clients, and does not apply for Browser due to Client app. Both identity selectors are outside the crops; Alex is associated from the walkthrough. Azure Files is visible only in the Browser crop, including its shared application ID. These establish simulated matching, not live blocking.

- [13-ca01-ca02-report-only.png](13-ca01-ca02-report-only.png): supplied on 2026-10-02. Confirms both lab policies exist in Report-only state. Does not establish CA02's detailed conditions or grant controls.

- [12-ca01-emergency-exclusions.png](12-ca01-emergency-exclusions.png): supplied on 2026-10-01. Explicitly lists both emergency accounts under Exclude > Users and groups. Also shows all resources, no configured network, 0 conditions, and 0 session controls. Tenant-domain portions are obscured. Does not show included-group details or the policy state.

- [10-ca01-what-if-breakglass.png](10-ca01-what-if-breakglass.png) and [11-ca01-what-if-breakglass02.png](11-ca01-what-if-breakglass02.png): supplied on 2026-10-01; user identifies the respective emergency accounts because identity selectors are outside the crops. Both show the lab policy will not apply due to Users and groups in Azure Files / Windows / Browser simulations. This does not distinguish explicit exclusion from lack of inclusion. The second image includes the shared Azure Files application ID, not a private tenant or user ID.

- [09-ca01-what-if-lab-user.png](09-ca01-what-if-lab-user.png): supplied on 2026-10-01. Shows Azure Files / Windows / Browser simulation and the lab policy under Policies that will apply, with Multifactor authentication strength and Report-only state. Alex's identity is established by preceding setup context, not the crop itself. Demonstrates simulated applicability only.

- [08-ca01-report-only.png](08-ca01-report-only.png): supplied on 2026-10-01. Shows LAB-CA01-Require-MFA-Lab-Users in Report-only state, one user-created policy, and zero Microsoft-managed policies. Does not show assignments, grant settings, or policy evaluation results.

- [07-alex-app-mfa-previously-satisfied.png](07-alex-app-mfa-previously-satisfied.png): Authentication Details for the 2026-10-01 09:19:52 local My Signins event associated with Alex.Employee in the preceding log list. Shows app-required MFA, Previously satisfied, and Succeeded true. Result detail is truncated. Proves acceptance of prior authentication for an MFA requirement, not a fresh challenge or custom Conditional Access enforcement.

- [06-p2-test-user-licenses.png](06-p2-test-user-licenses.png): supplied on 2026-10-01 after usage-location troubleshooting. Microsoft Entra ID P2 shows 3 / 100 assigned and lists Alex.Employee, Jamie.Admin, and Taylor.Contractor. The side panel still reports assignment in progress; this does not demonstrate premium-feature enforcement.

- [05-second-emergency-account-role.png](05-second-emergency-account-role.png): supplied on 2026-09-26. Shows breakglassadmin02 with Global Administrator assigned directly to the directory. This establishes the role assignment, not a successful privileged operation or recovery drill.

- [04-breakglass-mfa-signin.png](04-breakglass-mfa-signin.png): Authentication Details supplied on 2026-09-23 while investigating the previously shown My Signins event. Security Defaults applied; authentication method reads Previously satisfied; Succeeded is true. The image supports acceptance of prior MFA and does not show a fresh Authenticator challenge. Result detail and part of the timestamp are truncated. Association with the earlier event is based on conversation context; the crop itself omits account and application details.
# Latest administrator scope test

- [21-admin-browser-applies.png](21-admin-browser-applies.png) and [22-admin-browser-not-applies.png](22-admin-browser-not-applies.png): supplied 2026-10-03. CA03 alone applies with MFA strength; CA01 does not apply due to Users and groups, CA02 due to Client app. All Report-only. Scenario selectors are outside the crops; regular administrator / Browser association follows the requested test sequence. No enforcement demonstrated.

- [20-admin-ca02-ca03-other-clients.png](20-admin-ca02-ca03-other-clients.png): supplied 2026-10-03. Windows / Other clients simulation shows CA02 Block access and CA03 Multifactor authentication strength applicable, both Report-only. Identity and resource selectors are outside the crop; association follows the regular-administrator walkthrough. Simulated matching does not prove enforcement or explicit emergency exclusions.


- [23-alex-device-code-applies.png](23-alex-device-code-applies.png) and [24-alex-device-code-not-applies.png](24-alex-device-code-not-applies.png): supplied 2026-10-03 following the Alex device-code comparison instructions. First shows CA01, CA02, CA04 apply; second CA04 not applied due to Authentication flow and CA03 due to Users and groups. All Report-only. Input selectors omitted; no enforcement demonstrated.

- [25-admin-device-code-applies.png](25-admin-device-code-applies.png), [26-emergency-device-code-not-applies.png](26-emergency-device-code-not-applies.png), [27-emergency02-device-code-not-applies.png](27-emergency02-device-code-not-applies.png): supplied 2026-10-03 in requested admin/emergency/emergency02 sequence. Other clients and Device code flow visible; first CA02/03/04 apply, others all four not applied due to Users and groups. Report-only. User selectors omitted; breadcrumb does not establish simulated identity.

- [28-four-policies-on.png](28-four-policies-on.png): supplied 2026-10-03. Verifies all four custom policies On. Does not establish an individual sign-in evaluation, fresh MFA challenge, live legacy/device-code blocking, or emergency recovery test.

- [29-admin-ca03-live-success.png](29-admin-ca03-live-success.png): supplied 2026-10-03 after regular-admin fresh-session test instructions. Selected Azure Portal event Success and live Conditional Access CA03 Success; CA01/02/04 Not Applied. Personal identity obscured. Timestamp and Authentication Details omitted; no fresh-challenge claim. Other background events are not assessed by this selected event.

- [30-contractor-review-created.png](30-contractor-review-created.png): October 4 creation of LAB-AR01 for Identity-Security-Lab-Users, status Not started. Does not prove saved scope/reviewer settings, completed review, or applied removals.

## PIM validation — October 6, 2026

- [31-pim-assignment-success.png](31-pim-assignment-success.png): success notification names Jamie.Admin and Reports Reader at 19:47:56 UTC. Private tenant name/ID and correlation ID are obscured in the supplied image. Does not alone distinguish eligible from active assignment.
- [32-pim-reports-reader-activated.png](32-pim-reports-reader-activated.png): My roles Active assignments shows Reports Reader, Direct, Activated, ending at 1:52:39 PM Pacific. Jamie association follows the sign-in walkthrough; account selector is omitted. No fresh-MFA or privileged-operation claim.
- [33-pim-active-empty-after-end.png](33-pim-active-empty-after-end.png): Active assignments shows No results, empty search field, desktop clock 1:53 PM on October 6. Supports absence from active list after scheduled end; does not show backend expiration event or token invalidation.
- [34-pim-eligibility-retained.png](34-pim-eligibility-retained.png): Eligible assignments shows direct Reports Reader through October 20 at 12:47:26 PM, with Activate available. Account identity association follows the walkthrough. All four images copied unchanged from user-supplied evidence after visual privacy review.
