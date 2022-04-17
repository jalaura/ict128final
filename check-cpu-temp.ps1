<#
.SYNOPSIS
	Checks the current CPU temperature.
.DESCRIPTION
	This PowerShell script will check the CPU temperature.
.EXAMPLE
	PS> ./check-cpu-temp

	Done! CPU is 90.7 °C extremely hot!
#>

if (test-path "/sys/class/thermal/thermal_zone0/temp" -pathType leaf) {
    [int]$IntTemp = get-content "/sys/class/thermal/thermal_zone0/temp"
    $CPUTemp = [math]::round($IntTemp / 1000.0, 1)
} else {
    $data = Get-WMIObject -Query "SELECT * FROM Win32_PerfFormattedData_Counters_ThermalZoneInformation" -Namespace "root/CIMV2"
    $CPUTemp = @($data)[0].HighPrecisionTemperature
    $CPUTemp = [math]::round($CPUTemp / 100.0, 1)
}

if ($CPUTemp -gt 80) {
    $Read = "CPU is $($CPUTemp)°C extremely hot!"
} elseif ($CPUTemp -gt 50) {
    $Read = "CPU is $($CPUTemp)°C hot."
} elseif ($CPUTemp -gt 0) {
    $Read = "CPU is $($CPUTemp)°C warm."
} elseif ($CPUTemp -gt -20) {
    $Read = "CPU is $($CPUTemp)°C cold."
} else {
    $Read = "CPU is $($CPUTemp)°C extremely cold!"
}

Write-Host "$Read"