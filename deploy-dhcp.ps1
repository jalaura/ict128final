<#
.SYNOPSIS
	Deploy DHCP On A Windows Server.

.DESCRIPTION
 	This PowerShell script will install an DHCP Server role on a Windows Server.

.EXAMPLE
	PS> ./deploy-dhcp

#>

$DNSServerIP = read-host "Enter DNS server IP ex. 192.168.1.1"
$DHCPServerIP = read-host "Enter DHCP server IP ex. 192.168.1.1"
$StartRange = read-host "Enter DHCP scope start range ex.192.168.1.50"
$EndRange = read-host "Enter DHCP scope end range ex.192.168.1.99"
$Subnet = read-host "Enter Subnet mask ex. 255.255.255.0"
$Router = read-host "Enter router IP address ex. 192.168.1.254"

Install-WindowsFeature -Name 'DHCP' –IncludeManagementTools
Add-DhcpServerV4Scope -Name "DHCP Scope" -StartRange $StartRange -EndRange $EndRange -SubnetMask $Subnet
Set-DhcpServerV4OptionValue -DnsServer $DNSServerIP -Router $Router
Set-DhcpServerv4Scope -ScopeId $DHCPServerIP -LeaseDuration 1.00:00:00
Restart-service dhcpserver