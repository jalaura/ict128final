<#
.SYNOPSIS
	Turn system audio off
.DESCRIPTION
	This PowerShell script will mute the default audio device.
.EXAMPLE
	PS> ./volume-off
#>

$VOff = new-object -com wscript.shell
$VOff.SendKeys([char]173)
Write-Output "Audio is off."

