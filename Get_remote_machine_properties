#Simple command using Get-WmiObject to get the output of all the required OS-related properties.

Get-WmiObject Win32_OperatingSystem -ComputerName "Remote_Machine_Name.domain" |
Select PSComputerName, Caption, OSArchitecture, Version, BuildNumber | FL
