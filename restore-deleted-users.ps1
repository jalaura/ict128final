<#
.SYNOPSIS
	Restore deleted objects/users in Active Directory server.

.DESCRIPTION
	This PowerShell script will restore the deleted objects/users in Active Directory server according to time of deletion.

.EXAMPLE
	PS> ./restore-deleted-users

#>

$DeleteTime = New-Object Datetime(2022, 8, 22, 1, 40, 00)
Get-ADObject -filter 'whenChanged -gt $DeleteTime -and isDeleted -eq $true' -IncludeDeletedObjects -properties * | Foreach-Object {Restore-ADObject  $_.objectguid -NewName $_.deletedusers -TargetPath $_.LastKnownParent}

ForEach ($DeletedUsers in Get-Content "C:\deleted-users.txt") {
$user = $DeletedUsers
Get-ADObject -Filter {deletedusers -eq $user} -IncludeDeletedObjects -Properties * | ForEach-Object {Restore-ADObject $_.objectguid -NewName $_.deletedusers -TargetPath $_.LastKnownParent}
}