<#
.SYNOPSIS
	Checks an IPv4 address if valid or not.
.DESCRIPTION
	This PowerShell script will check the given IPv4 address for validity.
.EXAMPLE
	PS> ./ipv4-validation 192.168.1.1
      Success! IPv4 192.168.1.1 is valid
#>

    param (
        [string]$IPv4Address = ""
    )
    $IPv4Rand = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
    $IPv4Address = read-host "Enter IPv4 address to validate"
    if ($IPv4Rand -eq $IPv4Address) {
        "Success! IPv4 $IPv4Address is valid"
    } else {
        write-warning "Invalid IPv4 address: $IPv4Address"
    }
