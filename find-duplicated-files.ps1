<#
.SYNOPSIS
	Find duplicate files on folders.
.DESCRIPTION
	This PowerShell script will find duplicate files on folders.
.EXAMPLE
	PS> ./find-duplicated-files
#>

$Path = Read-Host "Enter file path for searching duplicate files (ex. C:\)"

If (Test-Path $Path) {
    Write-Warning 'Searching for duplicates ... Please wait ...'
    $Duplicates = Get-ChildItem $Path -File -Recurse `
    -ErrorAction SilentlyContinue |
    Get-FileHash |
    Group-Object -Property Hash |
    Where-Object Count -GT 1

        If ($Duplicates.count -lt 1) {
            Write-Warning 'No duplicates found.'
            Break ''
        } else {
            Write-Warning "Duplicates found."
            $Result = foreach ($I in $Duplicates) {
            $I.Group | Select-Object -Property Path, Hash
        }
    $Date = Get-Date -Format "MM/dd/yyy"
    $Items = $Result |
    Out-GridView -Title `
    "Select files (CTRL for multiple) and press OK. Selected files will be moved to C:\Duplicates_$Date" `
    -PassThru

    If ($Items) {
        New-Item -ItemType Directory `
        -Path $env:SystemDrive\Duplicates_$Date -Force
        Move-Item $Items.Path `
        -Destination $env:SystemDrive\Duplicates_$Date -Force
        Write-Warning `
        "Mission accomplished. Selected files moved to C:\Duplicates_$Date"
        Start-Process "C:\Duplicates_$Date"
    } else {
        Write-Warning "Operation aborted. No files selected."
    }
} else {
Write-Warning `
"Folder not found. Use full path to directory ex. C:\documents\personal"
}