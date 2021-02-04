$logfile = "C:\GroupTeamsCreationRestrictionPolicylog_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"
$start = [system.datetime]::Now
$Groupname = Read-host "Please provide group name"
$AllowGroupCreation = Read-host "Please provide allow group creation yes or no"
try{
$conDetails = Connect-AzureAD
$tenantDomain = $conDetails.TenantDomain
}
catch{
$_.Exception.Message | out-file -Filepath $logfile -append
}

$settingsObjectID = (Get-AzureADDirectorySetting | Where-object -Property Displayname -Value "Group.Unified" -EQ).id
 if(!$settingsObjectID)
    {try{
	$template = Get-AzureADDirectorySettingTemplate | Where-object {$_.displayname -eq "group.unified"}
	$settingsCopy = $template.CreateDirectorySetting()
	New-AzureADDirectorySetting -DirectorySetting $settingsCopy
	$settingsObjectID = (Get-AzureADDirectorySetting | Where-object -Property Displayname -Value "Group.Unified" -EQ).id
     } 
     catch{
$_.Exception.Message | out-file -Filepath $logfile -append
}
     }

	$settingsCopy = Get-AzureADDirectorySetting -Id $settingsObjectID
	$settingsCopy["EnableGroupCreation"] = $AllowGroupCreation

 if($GroupName)
   {try{
	$settingsCopy["GroupCreationAllowedGroupId"] = (Get-AzureADGroup -SearchString $GroupName).objectid
    }
    catch{
$_.Exception.Message | out-file -Filepath $logfile -append
}}
$end = [system.datetime]::Now
$resultTime = $end - $start
Write-Host "Execution took : $($resultTime.TotalSeconds) seconds." -ForegroundColor Cyan


    Set-AzureADDirectorySetting -Id $settingsObjectID -DirectorySetting $settingsCopy

    (Get-AzureADDirectorySetting -Id $settingsObjectID).Values
