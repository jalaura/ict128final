<#
.SYNOPSIS
	Lists all drives
.DESCRIPTION
	This PowerShell script will list all local drives on the computer as a table.
.EXAMPLE
	PS> ./list-all-drives

Name Root Used (GB) Free (GB)
---- ---- --------- ---------
C    C:\      142.2     334.1
D    D:\      642.3     289.2

#>

Get-PSDrive -PSProvider FileSystem | format-table -property Name,Root,@{n="Used (GB)";e={[math]::Round($_.Used/1GB,1)}},@{n="Free (GB)";e={[math]::Round($_.Free/1GB,1)}}