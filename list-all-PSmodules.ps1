<#
.SYNOPSIS
	Lists all PowerShell modules.
.DESCRIPTION
	This PowerShell script will list all installed PowerShell modules.
.EXAMPLE
	PS> ./list-all-PSmodules

ModuleType Version    Name                                ExportedCommands
---------- -------    ----                                ----------------
Manifest   3.1.0.0    Microsoft.PowerShell.Management     {Add-Computer, Add-Content, Checkpoint-Computer, Clear-Content...}
Manifest   3.0.0.0    Microsoft.PowerShell.Security       {ConvertFrom-SecureString, ConvertTo-SecureString, Get-Acl, Get-AuthenticodeSignature...}
...
#>

function List-PSModules {
	Get-Module | Format-Table
}