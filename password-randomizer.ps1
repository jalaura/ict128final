<#
.SYNOPSIS
	Generate random passwords.
.DESCRIPTION
	This PowerShell script will generate random passwords.
.EXAMPLE
	PS> ./password-randomizer

Ex. /!-3Qi1qnN-Ex[S   
#>

param (
    [int]$PasswordLength = 15, 
    [int]$Columns = 1, 
    [int]$Rows = 1
    )
    $MinChar = 33
    $MaxChar = 126

	Write-Output ""
	$Randomizer = New-Object System.Random
	for ($j = 0; $j -lt $Rows; $j++) {
		$Result = ""
		for ($k = 0; $k -lt $Columns; $k++) {
			for ($i = 0; $i -lt $PasswordLength; $i++) {
				$Result += [char]$Randomizer.next($MinChar,$MaxChar)
			}
			$Result += "   "
		}
		Write-Output "$Result"
	}
	Write-Output ""