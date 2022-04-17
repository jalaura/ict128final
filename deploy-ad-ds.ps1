<#
.SYNOPSIS
	Deploy Active Directory On A Windows Server.

.DESCRIPTION
	This PowerShell script will install an Active Directory Server role on a Windows Server.

.EXAMPLE
	PS> ./deploy-ad-ds

Success Restart Needed Exit Code      Feature Result
------- -------------- ---------      --------------
True    No             Success        {Active Directory Domain Services, Group P...

#>

$CompName = read-host "Enter New computer Name"
$DName = read-host "Enter Domain Name"

Rename-Computer -NewName $CompName -Restart 
Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
Install-ADDSForest -DomainName "$DName" -InstallDNS 