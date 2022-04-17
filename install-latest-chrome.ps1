<#
.SYNOPSIS
	Installs the latest Chrome browser
.DESCRIPTION
	This PowerShell script will install the latest Google Chrome Web browser.
.EXAMPLE
	PS> ./install-latest-chrome
#>

$StopWatch = [system.diagnostics.stopwatch]::startNew()
$Path = $env:TEMP;
$Installer = "chrome_installer.exe"
Invoke-WebRequest "http://dl.google.com/chrome/install/latest/chrome_installer.exe" -OutFile $Path\$Installer
Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -Wait
Remove-Item $Path\$Installer

[int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
"Success! installed Google Chrome in $Elapsed sec"
