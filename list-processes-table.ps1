<#
.SYNOPSIS
	Lists all local computer processes.
.DESCRIPTION
	This PowerShell script will list all local computer processes in a table.
.EXAMPLE
	PS> ./list-processes-table

   Id  CPU(s) ProcessName
   --  ------ -----------
 5408   0.23% AcrobatNotificationClient
 6624   0.19% acrotray
 2944   7.89% AdobeCollabSync
 8080   0.09% AdobeCollabSync
...

#>

Get-Process | Format-Table -Property Id, @{Label="CPU(s)";Expression={$_.CPU.ToString("N")+"%"};Alignment="Right"}, ProcessName -AutoSize