$logfile = "C:\RetailAppPermissionPolicylog_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"
$start = [system.datetime]::Now
Connect-MicrosoftTeams
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
if($id -match "admin@")
{
Write-Host "Skipping custom policy assignment to" "$id" -ForegroundColor Cyan
}
else{
try{
Grant-CsTeamsAppPermissionPolicy -Identity "$id" -PolicyName UsersPolicy
}
catch{
$_.Exception.Message | out-file -Filepath $logfile -append
     }
     }
     }
$end = [system.datetime]::Now
$resultTime = $end - $start
Write-Host "Execution took : $($resultTime.TotalSeconds) seconds." -ForegroundColor Cyan
