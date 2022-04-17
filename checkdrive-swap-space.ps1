<#
.SYNOPSIS
	Checks the swap space on the drive.
.DESCRIPTION
	This PowerShell script will check the free swap space on the drive.
.EXAMPLE
	PS> ./checkdrive-swap-space

	Swap space has only 1234 GB left to use! (12 of 1234 GB used)
#>

param (
    [int]$MinLevel = 50
)
$Items = get-wmiobject -class "Win32_PageFileUsage" -namespace "root\CIMV2" -computername localhost 
foreach ($Item in $Items) { 
    [int]$Total = $Item.AllocatedBaseSize
    [int]$Used = $Item.CurrentUsage
    [int]$Free = ($Total - $Used)
} 
if ($Total -eq "0") {
    $Reply = "No swap space configured!"
    Write-Host $Reply
} elseif ($Free -lt $MinLevel) {
    $Reply = "Swap space has only $Free GB left to use! ($Used of $Total GB used, minimum is $MinLevel GB)"
    Write-Host $Reply
} else {
    $Reply = "Swap space has $Free GB left ($Total GB total)"
    Write-Host $Reply
}