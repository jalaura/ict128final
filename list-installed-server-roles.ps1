<#
.SYNOPSIS
	List all installed Server Roles and Features
.DESCRIPTION
	This PowerShell script will list all installed Server Roles and Features which will be displayed in the console and report will be saved in a file.
.EXAMPLE
	PS> ./list-installed-server-roles

#>

$ErrorActionPreference = "SilentlyContinue"
 
$Servers = (Get-ADComputer -Properties operatingsystem `
-Filter 'operatingsystem -like "*server*" -and enabled -eq "true"').Name

$Result = @()
foreach ($Item in $Servers) {
    $Test = Test-Connection $Item -Count 1
    If ($Test.Status -eq 'Success' -or $Test.StatusCode -eq '0') {
        $Roles = Get-WindowsFeature -ComputerName $Item |
        Where-Object InstallState -EQ 'Installed'
        $Result += New-Object -TypeName PSObject -Property ([ordered]@{
        'Server' = $Item
        'Roles' = $Roles.Name -join "`r`n" })
    }
}
 
Write-Output $Result | Format-Table -Wrap

$Date = Get-Date -Format MM.dd.yyyy
$Result | Format-Table -Wrap |
Out-File "$HOME\ServerRoles$Date.txt"
Write-Warning "Output file ServerRoles$Date.txt generated in $HOME ... Opening file ..."
 
Start-Process $HOME\"ServerRoles$Date.txt"