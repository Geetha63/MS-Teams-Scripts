$logfile = "C:\TeamsAppSetupPolicylog_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"
$start = [system.datetime]::Now
Connect-MicrosoftTeams
$UserPrincipalNames=Import-Csv AppSetupPolicyInput.csv
Get-CSTeamsAppsetuppolicy |fl Identity
$PolicyName=Read-Host "Please provide the PolicyName"
foreach($UserPrincipalName in $UserPrincipalNames.UserPrincipalName)
{
    try{
    Get-CsOnlineUser -Identity "$UserPrincipalName" | fl TeamsAppSetupPolicy 
    Grant-CsTeamsAppSetupPolicy -identity "$UserPrincipalName" -PolicyName  "$PolicyName"
    }
    catch{
          $_.Exception.Message | out-file -Filepath $logfile -append
    }
}
$end = [system.datetime]::Now
$resultTime = $end - $start
Write-Host "Execution took : $($resultTime.TotalSeconds) seconds." -ForegroundColor Cyan
