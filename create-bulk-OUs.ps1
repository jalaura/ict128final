<#
.SYNOPSIS
	Create multiple Organizational Units in Active Directory.

.DESCRIPTION
	This Powershell script will perform the bulk creation of Organizational Units on the Active Directory.

.EXAMPLE
	PS> ./create-bulk-OUs

Name 		Path
----------- -------
IT       	OU=ACME Users,DC=ad,DC=acmesolutions,DC=com
HR        	OU=ACME Users,DC=ad,DC=acmesolutions,DC=com
Accounting  OU=ACME Users,DC=ad,DC=acmesolutions,DC=com

#>

Import-Module activedirectory

$ADOU = Import-csv C:\ou-list.csv
	foreach ($ou in $ADOU) {
	$name = $ou.name
	$path = $ou.path
	New-ADOrganizationalUnit `
	-Name $name `
	-path $path `
}