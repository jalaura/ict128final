<#
.SYNOPSIS
	View and list deleted objects/users in Active Directory server.

.DESCRIPTION
	This PowerShell script will view and export the result of the deleted objects/users in Active Directory server.

.EXAMPLE
	PS> ./list-deleted-users

#>

$ViewDeleted = Get-ADObject -Filter {(isdeleted -eq $true)} -includeDeletedObjects -property DistinguishedName,isDeleted,whenChanged,lastknownparent

$ViewDeleted | export-csv C:\sample-deleted.csv -NoTypeInformation