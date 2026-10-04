# Contractor access review and offboarding

Personal-lab scenario: Taylor.Contractor is an internal Member account simulating contract end, not a B2B guest.

## Observed results — October 4, 2026

- User confirmed Taylor's initial membership in Identity-Security-Lab-Users.
- LAB-AR01-Lab-Users-Contractor-Review created for the group; screenshot verified. Overview later showed Everyone scope, one-time recurrence, October 4–5 review period, and selected-user reviewers.
- My Access screenshot verified Alex and Jamie Approved, Taylor Denied. Recommendation was Approve for all; denial reflects the instructed simulated business decision. Justification text was not inspected.
- User reported disabling Taylor's account and revoking sessions before applying group removal.
- Following the requested Stop/Apply sequence, group screenshot verifies exactly two direct members, Alex and Jamie; Taylor absent. Separate review Applied status/audit has not been inspected.
- Two subsequent My Signins failures showed error 50057 (UserDisabled) in the supplied sign-in log screenshot. The Graph audit independently verified Taylor's accountEnabled False and absence from the lab-users group. Revocation is user-reported and is not proof all existing application tokens stopped immediately.

## Control dependency

CA01, CA02 and CA04 include Taylor through the lab-users group. Removing that membership also removes this policy coverage. Block sign-in before removing group membership. Any future rehire must restore appropriate licensing and protective group membership before enabling the account.

## Limits

Auto-apply and no-response settings were instructed but not independently inspected. This exercise does not establish removal of every possible application assignment, group, role or external entitlement. License reclamation has not been performed. Sensitive screenshots remain in conversation; no personal reviewer information or partial object IDs were copied into public evidence.
