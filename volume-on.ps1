<#
.SYNOPSIS
	Turn system audio on
.DESCRIPTION
	This PowerShell script will immediately unmutes the audio output.
.EXAMPLE
	PS> ./volume-on
#>

$VOn = new-object -com wscript.shell
$VOn.SendKeys([char]173)
Write-Output "Audio is on."