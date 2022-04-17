<#
.SYNOPSIS
	Checks the ping latency of your local computer to selected Internet hosts.
.DESCRIPTION
	This PowerShell script will check the ping latency from the local computer to selected Internet hosts.
	The hosts by default are: youtube.com,google.com,espn.com,facebook.com,yahoo.com,instagram.com
.EXAMPLE
	PS> ./check-average-ping
	
	Done! 20ms average ping time (15ms min, 28ms max)
#>

param (
    [string]$hosts = "youtube.com,google.com,espn.com,facebook.com,yahoo.com,instagram.com"
)
write-progress "Sending pings to $hosts..."
$HostsList = $hosts.Split(",")
$PingTime = test-connection -count 1 -computerName $HostsList   
[int]$Min = 9999999
[int]$Max = 0
[int]$Avg = 0
foreach($Ping in $PingTime) {
    if ($IsLinux) {
        [int]$Latency = $Ping.latency
    } else {
        [int]$Latency = $Ping.ResponseTime
    }
    if ($Latency -lt $Min) { $Min = $Latency }
    if ($Latency -gt $Max) { $Max = $Latency }
    $Avg += $Latency
}
$Avg = $Avg / $PingTime.count
  
Write-Host "$($Avg)ms average ping time ($($Min)ms min, $($Max)ms max)"