$targetout=OU=Test,OU=Users,DC=yourdomain,DC=domainsuffix

Get-ADUser -Filter * -SearchBase $targetou | Foreach-Object{

    $sam = $_.SamAccountName
    Set-ADuser -Identity $_ -HomeDrive "U:" -HomeDirectory "\\yourdfsnamespace\public\Users\$sam"
	

	
	
	