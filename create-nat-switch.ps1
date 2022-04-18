<#
.SYNOPSIS
	Create NAT switch on Hyper-V.

.DESCRIPTION
 	This PowerShell script will create a NAT-Switch in Hyper-V for test environment when you dont want to use the external switch.

.EXAMPLE
	PS> ./create-nat-switch

Name       					: VMNAT
ExternalIPInterfaceAddressPrefix 	: 
InrnalIPInterfaceAddressPrefix 	: 192.168.1.0/24
IcmpQueryTimeout				: 30
TcpEstablishedConnectionTimeout 	: 1800
...

#>

$StaticIP = read-host "Enter static IP address ex. 192.168.1.1"
$CIDR = read-host "Enter the prefix length for /24 ex. 24"
$NetworkADD = read-host "Enter network address with CIDR ex. 192.168.1.0/24"
$NatName = read-host "Enter NAT name ex. VMNAT"

New-VMSwitch -Name NAT-Switch -SwitchType Intern
New-NetIPAddress -IPAddress $StaticIP -PrefixLength $CIDR -InterfaceIndex 5
New-NetNat -Name $NatName -InternalIPInterfaceAddressPrefix $NetworkADD
Get-NetNat