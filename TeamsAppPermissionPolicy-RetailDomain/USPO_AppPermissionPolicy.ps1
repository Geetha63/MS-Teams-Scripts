$logfile = "C:\RetailAppPermissionPolicylog_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"
$start = [system.datetime]::Now
 if(Get-Module -ListAvailable -Name SkypeOnlineConnector) 
 { 
 Write-Host "SkypeOnlineConnector Already Installed" 
 } 
 else { 
 try { 
  Install-Module -Name SkypeOnlineConnector
 }
 catch{
        $_.Exception.Message | out-file -Filepath $logfile -append
 }
 }
Import-Module SkypeOnlineConnector
$sfbSession = New-CsOnlineSession 
Import-PSSession $sfbSession -AllowClobber

$Users=Get-CsOnlineUser|Where-Object{$_.Title -match 'Manager'}
$UPN=$Users.UserPrincipalName
foreach($user in $UPN)
{
try
{
Grant-CsTeamsAppPermissionPolicy -Identity "$user" -PolicyName Level1Policy
}
catch{
$_.Exception.Message | out-file -Filepath $logfile -append
     }
}

$upns=Get-CsOnlineUser|Where-Object{$_.Title -notmatch 'Manager'}
$Names=$upns.UserPrincipalName

foreach($id in $Names)
{
try{
Grant-CsTeamsAppPermissionPolicy -Identity "$id" -PolicyName UsersPolicy
}
catch{
$_.Exception.Message | out-file -Filepath $logfile -append
     }
     }
$end = [system.datetime]::Now
$resultTime = $end - $start
Write-Host "Execution took : $($resultTime.TotalSeconds) seconds." -ForegroundColor Cyan

