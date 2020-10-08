
param(
      [Parameter(Mandatory=$true)][System.String]$PolicyName         
      )

#connecting to Skypeonline

 $credential = Get-credential
 Import-Module SkypeOnlineConnector
 $sfbSession = New-CsOnlineSession
 Import-PSSession $sfbSession
 
New-CsTeamsMessagingPolicy -Identity "$PolicyName" -AllowUserChat $false
Write-Host "AllowUserChat is set to False"
