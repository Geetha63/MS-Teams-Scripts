param(
      [Parameter(Mandatory=$true)][System.String]$User,
      [Parameter(Mandatory=$true)][System.String]$PolicyName         
      )


#connecting to Skypeonline
 $credential = Get-credential
 Import-Module SkypeOnlineConnector
 $sfbSession = New-CsOnlineSession
 Import-PSSession $sfbSession

Grant-CsTeamsMessagingPolicy -Identity "$User" -PolicyName "$PolicyName"
write-host "$User is eing assigned the $PolicyName"
