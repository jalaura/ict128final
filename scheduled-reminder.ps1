<#
.SYNOPSIS
	Creates a scheduled task displayed in a popup message.
.DESCRIPTION
	This PowerShell script will create a scheduled task that will be displayed in a popup message.
.EXAMPLE
	PS> ./scheduled-reminder "Submit Project" "4/17/2022 11:59 PM"

	TaskPath                                       TaskName                          State
	--------                                       --------                          -----
	\                                              Reminder_12345                Ready
#>

param (
    [string]$Remind = "", [datetime]$Time
    )
	if ($Remind -eq "") { 
        $Remind = read-host "Enter reminder message" 
    }
	$SchedTask = New-ScheduledTaskAction -Execute msg -Argument "* $Remind"
	$Prompt = New-ScheduledTaskTrigger -Once -At $Time
	$Rand = (Get-Random)
	Register-ScheduledTask -Action $SchedTask -Trigger $Prompt -TaskName "Reminder_$Rand" -Description "Reminder"