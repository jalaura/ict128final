<#
.SYNOPSIS
	Configure static network configuration on Windows systems.

.DESCRIPTION
 	This PowerShell script will Configure static network configuration on a Windows system.

.EXAMPLE
	PS> ./server-network-configuration

InterfaceAlias       : Ethernet
InterfaceIndex       : 5
InterfaceDescription : Microsoft Hper-V Network Adapter
NetProfile.Name      : Network
IPv4Address          : 192.168.1.1
IPv6DefaultGateway   :
IPv4DefaultGateway   : 192.168.1.254
DNSServer            : 8.8.8.8
                       1.1.1.1

#>

$StaticIP = read-host "Enter static IP address ex. 192.168.1.1"
$CIDR = read-host "Enter the prefix length for /24 ex. 24"
$Gateway = read-host "Enter default gateway ex.192.168.1.254"
$DNS1 = read-host "Enter DNS server 1 ex. 8.8.8.8"
$DNS2 = read-host "Enter DNS server 2 ex. 1.1.1.1"


New-NetIPAddress -InterfaceIndex 5 -IPAddress $StaticIP -PrefixLength $CIDR -DefaultGateway $Gateway
Set-DnsClientServerAddress -InterfaceIndex 5 -ServerAddresses $DNS1,$DNS2