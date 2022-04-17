<#
.SYNOPSIS
	Launch your current default browser.
.DESCRIPTION
	This PowerShell script will open the default Web browser, optional with a given URL.
.EXAMPLE
	PS> ./launch-default-browser
#>

function Launch-Default-Browser {
    param (
        [string] $URL = "https://www.google.com"
    )
    Start-Process $URL
}