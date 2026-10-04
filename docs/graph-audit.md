# Read-only Graph audit

Run `scripts/Invoke-LabIdentityAudit.ps1` from the same PowerShell session used for the manual Graph checks. The script requires Microsoft.Graph.Authentication and an existing connection with User.Read.All, GroupMember.Read.All, LicenseAssignment.Read.All, Policy.Read.All, and RoleManagement.Read.Directory.

Pass the expected lab tenant ID explicitly using `-ExpectedTenantId`. The script checks that the current connection matches it; it does not connect or change tenant configuration. All API requests use GET. Collection pagination is followed before counts are reported.

The default output is `exports/lab-audit.json`, excluded from Git. The report includes only the known synthetic user, group, and policy names; other group members are redacted. Review any report before sharing it. No tenant IDs, object IDs, UPNs, tokens, or personal administrator names are exported.

Failed queries and missing or duplicate names are unknown results. A zero role count is meaningful only when its query status says Read succeeded. This snapshot does not establish enforcement, fresh MFA, revoked sessions, all administrator privileges, application access, or Azure resource roles.

## Validation

The individual queries were manually verified in the lab on October 4, 2026. The consolidated script passed a local PowerShell syntax check and was then run by the lab administrator in the authenticated session. Its saved report at 19:00:22 UTC contains 12 successful reads and no failed checks. All four synthetic users were found uniquely; Alex and Jamie were enabled with P2, Taylor was disabled with P2 retained, and Test User was disabled without a license. The users group contained Alex and Jamie, and the privileged group contained Jamie. All four named policies were enabled. Jamie and both groups each had zero active role assignments and zero eligible role instances. These results are observations, not a passing compliance verdict; PIM remains unresolved.
