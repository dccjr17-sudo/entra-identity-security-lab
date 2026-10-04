# PIM Reports Reader eligibility failure

Prepared October 4, 2026. User submitted a Microsoft support case on October 4 at 10:39 AM Pacific. Screenshot verifies Open status, severity C, included technical support, email contact, and advanced diagnostic permission granted. Case identifiers and personal contact details are omitted here. No support response is shown yet.

## Problem

Assigning Jamie.Admin time-bound eligible Reports Reader at tenant scope fails with RoleNotFound / "The role is not found." Reproduced through PIM, the user's Assigned roles page, and Microsoft Graph v1.0. No successful eligible assignment has been established; an Active assignment was not used as a workaround.

## Verified checks

- Graph unified role-definition read succeeds: Reports Reader, isBuiltIn true, isEnabled true, id and templateId both `4a5d8f65-41da-4de4-8968-e035b65339cf`.
- Graph Explorer's initial 403 read failure was resolved after the instructed read-permission consent; role-definition response was then inspected.
- Tenant directoryRole lookup initially returned 404. POST /v1.0/directoryRoles using the Reports Reader template returned 201 Created. This created the role instance without adding members.
- Portal eligible assignment still failed after role initialization.
- POST /v1.0/roleManagement/directory/roleEligibilityScheduleRequests also fails with 404 RoleNotFound, using adminAssign, the verified role-definition ID, Jamie's principal ID, directoryScopeId `/`, and expiration `2026-10-21T00:00:00Z`.
- Direct failures observed October 4 at 17:04:45 UTC and again 17:12:58 UTC (10:12:58 AM Pacific).
- Waiting after initialization did not resolve the observed failure. The underlying cause is unconfirmed.
- P2 trial is active; Jamie's P2 assignment was shown in earlier licensing evidence. Regular administrator is Global Administrator based on user confirmation.

## Support request

Please investigate why the PIM service cannot resolve this enabled built-in role for eligible assignment, despite a successful unified role-definition read and successful tenant directoryRole creation. Please check PIM tenant/role provisioning and advise a supported remediation that preserves eligible, time-limited access.

Provide tenant ID, Jamie object ID, latest request ID and client-request-id privately through Microsoft support from the original failure response. They are intentionally omitted from this public-safe summary. Never include an access token.
