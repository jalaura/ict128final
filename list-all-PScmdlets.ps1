<#
.SYNOPSIS
	Lists all PowerShell cmdlets.
.DESCRIPTION
	This PowerShell script will list all PowerShell cmdlets.
.EXAMPLE
	PS> ./list-all-PScmdlets

CommandType     Name                                  Version    Source
-----------     ----                                  -------    ------
Function        New-NetQosPolicy                      2.0.0.0    NetQos
Function        New-NetRoute                          1.0.0.0    NetTCPIP
...
#>

function List-CommandLets {
	Get-Command -Command-Type cmdlet
}