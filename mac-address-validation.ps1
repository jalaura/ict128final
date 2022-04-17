<#
.SYNOPSIS
	Checks the given MAC address if valid or not.
.DESCRIPTION
	This PowerShell script will check the given MAC address for validity.
.EXAMPLE
	PS> ./mac-address-validation 00:11:22:33:44:55
	Success! MAC address 00:11:22:33:44:55 is valid
#>


    param (
        [string]$MACAddress = ""
    )
    $MacRand = "^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})|([0-9A-Fa-f]{2}){6}$"
    $MACAddress = read-host "Enter MAC address to validate"
    if ($MacRand -eq $MACAddress) {
        "Success! MAC address $MAC is valid"
    } else {
        write-warning "Invalid MAC address: $MAC"
    }
