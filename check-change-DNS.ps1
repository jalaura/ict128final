<#
.SYNOPSIS
	Check the changes for the DNS.

.DESCRIPTION
	This PowerShell script will check any updates in the DNS cache.

.EXAMPLE
	PS> ./check-change-DNS

#>

param(
    [string]$MyDomain,
    [string]$CheckType
);

$StaticPath = Read-Host -Prompt "Enter the static path to the file to compare ex. C:\document\staticfile.txt"
$DynamicPath = Read-Host -Prompt "Enter the dynamic path to the file to compare ex. C:\document\dynamicfile.txt"
Resolve-DnsName -Name $MyDomain -Type $CheckType | Select Name, Type, IPAddress | Out-File $StaticPath

While ($true)
{
    Resolve-DnsName -Name $MyDomain -Type $CheckType | Select Name, Type, IPAddress | Out-File $DynamicPath
    if (Compare-Object -ReferenceObject $(Get-Content $StaticPath) -DifferenceObject (Get-Content $DynamicPath))
    {
        Get-Content $DynamicPath
        Write-Host -ForegroundColor Green "Yay, there has been changes to the file"
        Write-Host "----------------------------" ##
        Write-Host "Static File, before changes." ##
        Get-Content $StaticPath                   ## Formats Output of the changes
        Write-Host "Dynamic File, after changes"  ##
        Get-Content $DynamicPath                  ##
        Write-Host "----------------------------" ##
        break
    } else
    {
        Write-Host -ForegroundColor Red "No changes yet.."
        Get-Content $StaticPath
    }
    Start-Sleep -Seconds 15
}