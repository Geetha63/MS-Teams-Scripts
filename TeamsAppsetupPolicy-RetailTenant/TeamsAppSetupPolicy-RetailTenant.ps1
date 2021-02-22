$logfile = "C:\TeamsAppSetupPolicylog_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"
$start = [system.datetime]::Now
Import-Module SkypeOnlineConnector
$sfbSession = New-CsOnlineSession 
Import-PSSession $sfbSession -AllowClobber

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
