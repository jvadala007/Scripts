$DaysInactive = 30
$OU = "OU=Computers,OU=yourou,DC=domainname,DC=domainsuffix"
$time = (Get-Date).Adddays(-($DaysInactive))
Get-ADComputer -Filter {LastLogonTimeStamp -lt $time} -SearchBase $OU -ResultPageSize 2000 -resultSetSize $null -Properties Name, OperatingSystem, SamAccountName, DistinguishedName, LastLogonTimeStamp | Select-Object -Property Name,OperatingSystem, SamAccountName, DistinguishedName, @{n="LastLogonTimeStamp";e={[DateTime]::FromFileTime($_.LastLogontimestamp)}} | export-csv "C:\users\administrator\desktop\ADComputers.csv" -NoTypeInformation