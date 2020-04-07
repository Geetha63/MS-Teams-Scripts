param(
      [Parameter(Mandatory=$true)][System.String]$Policyname,
      [Parameter(Mandatory=$true)][System.String]$user
      )
$credential = Get-credential
Import-Module SkypeOnlineConnector
$sfbSession = New-CsOnlineSession
Import-PSSession $sfbSession

Grant-CsTeamsAppsetupPolicy -policyname "$Policyname" -Identity  $user

get-csonlineuser -Identity "$user" |ft TeamsappsetupPolicy