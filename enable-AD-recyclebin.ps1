<#
.SYNOPSIS
	Enables the recycle bin feature in Active Directory server.

.DESCRIPTION
	This PowerShell script will enable the recycle bin feature in Active Directory server which allows you to quickly recover deleted objects without the need to restore a backup.

.EXAMPLE
	PS> ./enable-AD-recyclebin

#>

Import-module ActiveDirectory
$Rootdomain = Read-Host -Prompt "Enter the root domain name"

Enable-ADOptionalFeature 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target $Rootdomain