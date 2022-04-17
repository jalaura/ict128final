<#
.SYNOPSIS
	Converts a .CSV file into a text file.
.DESCRIPTION
	This PowerShell script wil convert a .CSV file into a text file.
.EXAMPLE
	PS> ./convert-csv-txt samplesheet.csv
#>

param (
    [string] $Path = ""
    )
	if ($Path -eq "" ) { $Path = read-host "Enter path to CSV file" }
	$Table = Import-CSV -path "$Path" -header A,B,C,D,E,F,G,H
	foreach($Row in $Table) {
		write-output "* $($Row.A) $($Row.B) $($Row.C) $($Row.D) $($Row.E) $($Row.F) $($Row.G) $($Row.H)"
	}