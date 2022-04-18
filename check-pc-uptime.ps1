<#
.SYNOPSIS
	Check the uptime of the current pc.

.DESCRIPTION
	This PowerShell script will check the current pc for uptime.

.EXAMPLE
	PS> ./check-pc-uptime

#>

[CmdletBinding()]
Param()

$Lastboottime = (Get-CimInstance -ClassName win32_operatingsystem).LastBootUpTime
$Uptime = (Get-Date) - $Lastboottime
$Time = Get-Date -Format "T"  

Write-Host " $Time up" $Uptime.days "days," $Uptime.hours "hours," $Uptime.minutes "minutes," $Uptime.seconds "seconds"