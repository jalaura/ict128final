<#
.SYNOPSIS
	Create a new virtual machine in Hyper-V

.DESCRIPTION
	This PowerShell script will create Hyper-V virtual machines using templates systematically, and you can also automate the whole process.

.EXAMPLE
	PS> ./create-new-VM VM Name, VM Memory, Path...

#>

$Path = read-host "Enter the path"
$VMName = read-host "Enter the VM Name"
$VMMemory = read-host "Enter the VM Memory"
$HDDName = read-host "Enter the HDD Name with the *.vhdx ex. Name.vhdx"
$HDDSize = read-host "Enter the HDD Size"
$ISOPath = read-host "Enter the ISO path"
$HDDPath = $Path + $HDDName


New-VM -Name $VMName -MemoryStartupBytes $VMMemory -Path $Path
New-VHD -Path $HDDPath -SizeBytes $HDDSize -Dynamic
Add-VMHardDiskDrive -VMName DC -Path $HDDPath"
Set-VMDvdDrive -VMName $VMName -ControllerNumber 1 -Path "$ISOPath