$logfile = "C:\SharePointstoragelimitlog_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"
$start = [system.datetime]::Now
# site name = https://contoso.sharepoint.com/sites/HrTeam
# StorageQuota = 20000 (input is in GB)
# StorageQuotaWarningLevel = 19000 (input is in GB)]

$SiteName=Read-Host "Please provide SiteName ex:https://contoso.sharepoint.com/sites/HrTeam"
$StorageQuota=Read-Host "Please provide StorageQuota"
$StorageQuotaWarningLevel =Read-Host "Please provide StorageQuotaWarningLevel"        
try{
Set-SPOSite -Identity $SiteName -StorageQuota $StorageQuota -StorageQuotaWarningLevel $StorageQuotaWarningLevel -NoWait
}
catch{
$_.Exception.Message | out-file -Filepath $logfile -append
}
$end = [system.datetime]::Now
$resultTime = $end - $start
Write-Host "Execution took : $($resultTime.TotalSeconds) seconds." -ForegroundColor Cyan
