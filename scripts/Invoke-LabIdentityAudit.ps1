#Requires -Version 5.1
#Requires -Modules Microsoft.Graph.Authentication
<#!
.SYNOPSIS
Read-only snapshot of the synthetic Entra lab identities and controls.
.DESCRIPTION
Reuses an existing Connect-MgGraph session. Uses GET requests only.
Reports observations, not a compliance verdict. No tenant IDs, object IDs,
UPNs, tokens, or personal administrator names are written to the report.
Required scopes: User.Read.All, GroupMember.Read.All, LicenseAssignment.Read.All,
Policy.Read.All, RoleManagement.Read.Directory.
!#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][guid]$ExpectedTenantId,
    [string]$OutputPath = (Join-Path $PSScriptRoot '../exports/lab-audit.json')
)
$ErrorActionPreference = 'Stop'
$context = Get-MgContext
if (-not $context -or $context.TenantId -ne $ExpectedTenantId.ToString()) {
    throw 'Connect to the expected lab tenant before running this audit.'
}

function Get-GraphCollection {
    param([string]$Uri, [hashtable]$Headers = @{})
    $seen = @{}
    while ($Uri) {
        if ($Uri -notlike 'https://graph.microsoft.com/v1.0/*' -or $seen.ContainsKey($Uri)) {
            throw 'Unexpected or repeated Graph pagination URL.'
        }
        $seen[$Uri] = $true
        $page = Invoke-MgGraphRequest -Method GET -Uri $Uri -Headers $Headers -ErrorAction Stop
        if (-not $page.ContainsKey('value')) { throw 'Graph did not return a collection.' }
        foreach ($item in $page['value']) { $item }
        $Uri = $page['@odata.nextLink']
    }
}

$script:checks = @()
function Read-AuditCollection {
    param([string]$Label, [string]$Uri, [hashtable]$Headers = @{})
    try {
        $items = @(Get-GraphCollection -Uri $Uri -Headers $Headers)
        $script:checks += [pscustomobject]@{ Check = $Label; Status = 'Read succeeded' }
        return $items
    } catch {
        # Avoid exporting raw exceptions that can include private request details.
        $script:checks += [pscustomobject]@{ Check = $Label; Status = 'Read failed; result unknown' }
        Write-Warning "$Label failed. Its report result is unknown."
        return @()
    }
}

$names = @('Alex.Employee', 'Jamie.Admin', 'Taylor.Contractor', 'Test User')
$groupNames = @('Identity-Security-Lab-Users', 'Identity-Security-Lab-Privileged')
$users = @(Read-AuditCollection 'Users' 'https://graph.microsoft.com/v1.0/users?$select=id,displayName,accountEnabled,assignedLicenses&$top=100')
$skus = @(Read-AuditCollection 'License products' 'https://graph.microsoft.com/v1.0/subscribedSkus?$select=skuId,skuPartNumber')
$skuNames = @{}
foreach ($sku in $skus) { $skuNames[[string]$sku['skuId']] = $sku['skuPartNumber'] }
$userReport = @(foreach ($name in $names) {
    $matches = @($users | Where-Object { $_['displayName'] -eq $name })
    if ($matches.Count -ne 1) {
        [pscustomobject]@{ Name = $name; Status = 'Missing, ambiguous, or read failed'; AccountEnabled = $null; Products = @() }
        continue
    }
    $user = $matches[0]
    $products = @(foreach ($license in $user['assignedLicenses']) {
        $product = $skuNames[[string]$license['skuId']]
        if ($product) { $product } else { 'Unknown product' }
    })
    [pscustomobject]@{ Name = $name; Status = 'Observed'; AccountEnabled = $user['accountEnabled']; Products = $products }
})

$groups = @(Read-AuditCollection 'Groups' 'https://graph.microsoft.com/v1.0/groups?$select=id,displayName&$top=100')
$groupReport = @(foreach ($name in $groupNames) {
    $matches = @($groups | Where-Object { $_['displayName'] -eq $name })
    if ($matches.Count -ne 1) {
        [pscustomobject]@{ Group = $name; Status = 'Missing, ambiguous, or read failed'; Members = @() }
        continue
    }
    $uri = 'https://graph.microsoft.com/v1.0/groups/' + $matches[0]['id'] + '/members?$select=displayName'
    $members = @(Read-AuditCollection "Members: $name" $uri)
    $safeMembers = @(foreach ($member in $members) {
        if ($member['displayName'] -in $names) { $member['displayName'] } else { 'Other member (redacted)' }
    })
    [pscustomobject]@{ Group = $name; Status = $script:checks[-1].Status; Members = $safeMembers }
})

$policies = @(Read-AuditCollection 'Conditional Access' 'https://graph.microsoft.com/v1.0/identity/conditionalAccess/policies?$select=displayName,state')
$policyNames = @('LAB-CA01-Require-MFA-Lab-Users', 'LAB-CA02-Block-Legacy-Auth-Lab-Users', 'LAB-CA03-Require-MFA-Global-Admins', 'LAB-CA04-Block-Device-Code-Flow')
$policyReport = @(foreach ($name in $policyNames) {
    $matches = @($policies | Where-Object { $_['displayName'] -eq $name })
    if ($matches.Count -eq 1) { $state = $matches[0]['state'] } else { $state = 'Unknown: missing, ambiguous, or read failed' }
    [pscustomobject]@{ Policy = $name; State = $state }
})

$roleReport = @()
$jamie = @($users | Where-Object { $_['displayName'] -eq 'Jamie.Admin' })
$principals = @()
if ($jamie.Count -eq 1) { $principals += @{ Name = 'Jamie.Admin'; Id = $jamie[0]['id']; Type = 'User' } }
foreach ($group in $groups) {
    if ($group['displayName'] -in $groupNames) {
        $duplicates = @($groups | Where-Object { $_['displayName'] -eq $group['displayName'] })
        if ($duplicates.Count -eq 1) { $principals += @{ Name = $group['displayName']; Id = $group['id']; Type = 'Group' } }
    }
}
foreach ($principal in $principals) {
    foreach ($kind in @('roleAssignments', 'roleEligibilityScheduleInstances')) {
        $uri = 'https://graph.microsoft.com/v1.0/roleManagement/directory/' + $kind + '?$filter=principalId%20eq%20%27' + $principal.Id + '%27&$expand=roleDefinition'
        $label = "$kind : $($principal.Name)"
        $roles = @(Read-AuditCollection $label $uri)
        $status = $script:checks[-1].Status
        $count = $null
        if ($status -eq 'Read succeeded') { $count = $roles.Count }
        $roleReport += [pscustomobject]@{
            Principal = $principal.Name; Type = $principal.Type; Query = $kind
            Status = $status; Count = $count
            Roles = @($roles | ForEach-Object { $_['roleDefinition']['displayName'] })
        }
    }
}

$report = [ordered]@{
    GeneratedAtUtc = [DateTime]::UtcNow.ToString('o')
    Scope = 'Four synthetic users, two named lab groups, four named policies, and direct role/eligibility assignments to Jamie and those groups.'
    Limitations = @('Snapshot only; does not prove MFA challenges or blocked sign-ins.', 'Does not audit all administrators, application access, Azure RBAC, or session revocation.', 'Failed reads and missing/duplicate names are unknown, not passing results.', 'Group membership and role eligibility activation require separate interpretation.')
    Checks = $script:checks; Users = $userReport; Groups = $groupReport
    Policies = $policyReport; Roles = $roleReport
}
$absoluteOutput = [IO.Path]::GetFullPath($OutputPath)
$parent = Split-Path -Parent $absoluteOutput
if (-not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
$report | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath $absoluteOutput -Encoding UTF8
$userReport | Select-Object Name, AccountEnabled, @{Name='Products';Expression={$_.Products -join ', '}} | Format-Table -AutoSize
$groupReport | Select-Object Group, Status, @{Name='Members';Expression={$_.Members -join ', '}} | Format-Table -AutoSize
$policyReport | Format-Table -AutoSize
$roleReport | Select-Object Principal, Query, Status, Count | Format-Table -AutoSize
$script:checks | Format-Table -AutoSize
Write-Host "Report saved: $absoluteOutput"
