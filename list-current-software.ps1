<#
.SYNOPSIS
	Lists all the installed software on the computer.
.DESCRIPTION
	This PowerShell script will list all the installed software on the computer.
.EXAMPLE
	PS> ./list-current-software

DisplayName                                                        DisplayVersion   InstallDate
-----------                                                        --------------   -----------
7-Zip 21.07 (x64)                                                  21.07
Cisco Packet Tracer 8.1.0 64Bit                                                     20211223 
...

#>

Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*, HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*, HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | select-object DisplayName,DisplayVersion,InstallDate | format-table -autoSize