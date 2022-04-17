<#
.SYNOPSIS
	Create multiple local user accounts on the Active Directory.

.DESCRIPTION
	This Powershell script will perform the bulk creation of user accounts on the Active Directory.

.EXAMPLE
	PS> ./create-bulk-ADUsers

SamAccountName Enabled
-------------- -------
mariano        True
jasmine        True
andrew         True

#>

$CSV = Import-Csv "C:\userlist.csv"
$CSV = Import-Csv "C:\userlist.csv"
foreach($Row in $CSV)
{
$NewUser = "$($Row.USERNAME)"
$NewPass = "$($Row.PASSWORD)" 
$SecurePass = ConvertTo-SecureString –AsPlainText -Force -String "$NewPass"
New-ADUser -Name $NewUser -Enabled $true -AccountPassword $SecurePass
}
$CSV = "C:\userlist.csv"
Import-CSV $CSV | ForEach-Object { 
Get-ADUser -Filter "SamAccountName -like '*$($_.USERNAME)*'"  -Properties SamAccountName, Enabled | select SamAccountName, Enabled
}