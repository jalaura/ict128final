<#
.SYNOPSIS
	Lists the user's PowerShell profiles
.DESCRIPTION
	This PowerShell script lists the user's PowerShell profiles.
.EXAMPLE
	PS> ./list-all-PSprofiles
	
Level Profile                Location                                                                Existent
----- -------                --------                                                                --------
1     AllUsersAllHosts       C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1                  no
2     AllUsersCurrentHost    C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.VSCode_profile.ps1 no
3     CurrentUserAllHosts    C:\Users\John\Documents\WindowsPowerShell\profile.ps1                   no
4     CurrentUserCurrentHost C:\Users\John\Documents\WindowsPowerShell\Microsoft.VSCode_profile.ps1  no
#>

function List-PSProfiles { param([int]$Level, [string]$Profile, [string]$Location)
	if (test-path "$Location") { $Existent = "yes" } else { $Existent = "no" }
	New-Object PSObject -Property @{ 'Level'="$Level"; 'Profile'="$Profile"; 'Location'="$Location"; 'Existent'="$Existent"	}
}

function List-PSProfiless { 
	List-PSProfiles 1 "AllUsersAllHosts"       $PROFILE.AllUsersAllHosts
	List-PSProfiles 2 "AllUsersCurrentHost"    $PROFILE.AllUsersCurrentHost
	List-PSProfiles 3 "CurrentUserAllHosts"    $PROFILE.CurrentUserAllHosts
	List-PSProfiles 4 "CurrentUserCurrentHost" $PROFILE.CurrentUserCurrentHost
}

List-PSProfiless | format-table -property Level,Profile,Location,Existent