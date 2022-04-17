<#
.SYNOPSIS
	Scans your network for open/closed ports
.DESCRIPTION
	This PowerShell script scans your network for open or closed ports.
.EXAMPLE
	PS> ./scan-network-ports 192.168.1.0 8080 1..254
#>



$networkIP = read-host "Enter network IP to scan ex. 192.168.1.0"
$portNum = read-host "Enter port number ex. 8080"
$rangeIP = read-host "Enter IP range ex. 1..254"
$ErrorActionPreference= "silentlycontinue"

foreach($count in $rangeIP) {
	$ipAll = "{0}.{1}" -F $networkIP,$count
	write-progress "Scanning IP $ipAll" -PercentComplete (($count/$rangeIP.Count)*100)
	if (Test-Connection -BufferSize 32 -Count 1 -quiet -ComputerName $ipAll) {
		$socket = new-object System.Net.Sockets.TcpClient($ipAll, $portNum)
		if ($socket.Connected) {
			write-output "TCP port $portNum at $ipAll is open"
			$socket.Close()
		} else {
			write-output "TCP port $portNum at $ipAll is not open"
		}
	}
}
