<#
.SYNOPSIS
	Opens the default email client to write a new email
.DESCRIPTION
	This PowerShell script will open the default email client to create a new email.
.EXAMPLE
	PS> ./start-create-email name@gmail.com
#>


    param (
        [string]$EmailAddress = ""
    )
    $EmailAddress = read-host "Enter an email address ex. name@gmail.com"
    $URL="mailto:$EmailAddress"
    Start-Process $URL
