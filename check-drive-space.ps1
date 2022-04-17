<#
.SYNOPSIS
	Checks your drive for free space left.
.DESCRIPTION
	This PowerShell script will check a drive for free space left (50 GB by default).
.EXAMPLE
	PS> ./check-drive-space C
	
	Done! 190 GB left on drive C (89 of 255 GB used)
#>

param (
    [string] $HDrive = "", 
    [int] $MinLevel = 50
)

if ($HDrive -eq "" ) { $HDrive = read-host "Enter drive to check" }

$DriveInfo = (get-psdrive $HDrive)
[int]$Free = (($DriveInfo.Free / 1024) / 1024) / 1024
[int]$Used = (($DriveInfo.Used / 1024) / 1024) / 1024
[int]$Total = ($Used + $Free)

if ($Free -lt $MinLevel) {
    write-warning "Drive $HDrive has only $Free GB left to use! ($Used of $Total GB used, minimum is $MinLevel GB)"	
}
Write-Host "Drive $HDrive has $Free GB left ($Total GB total)"