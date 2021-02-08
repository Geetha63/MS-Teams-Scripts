﻿$logfile = "C:\log_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"
$start = [system.datetime]::Now

 If(Get-Module -ListAvailable -Name MicrosoftTeams) 
 { 
 Write-Host "MicrosoftTeams Already Installed" 
 } 
 else { 
 try { Install-Module -Name MicrosoftTeams
 Write-Host "Installed MicrosoftTeams"
 }
 If(Get-Module -ListAvailable -Name AzureAD) 
 { 
 Write-Host "AzureAD Already Installed" 
 } 
 else { 
 try { Install-Module -Name AzureAD
 Write-Host "Installed AzureAD"
 }
 
 try{
 $credential= get-credential
 }catch{
$_.Exception.Message | out-file -Filepath $logfile -append
}
try{
Connect-MicrosoftTeams -Credential $credential
}catch{
$_.Exception.Message | out-file -Filepath $logfile -append
}
try{
Connect-AzureAD -Credential $credential
}
catch{
$_.Exception.Message | out-file -Filepath $logfile -append
}


$group = Get-AzureADGroup -SearchString "all teachers"
$groupid = $group.objectid
try{
New-CsGroupPolicyAssignment -GroupId $groupid -PolicyType TeamsChannelsPolicy -PolicyName "AllTeachers" -Rank 1
New-CsGroupPolicyAssignment -GroupId $groupid -PolicyType TeamsMeetingPolicy -PolicyName "AllTeachers" -Rank 1
New-CsGroupPolicyAssignment -GroupId $groupid -PolicyType TeamsMessagingPolicy -PolicyName "AllTeachers" -Rank 1
}
catch{
$_.Exception.Message | out-file -Filepath $logfile -append
}


$end = [system.datetime]::Now
$resultTime = $end - $start
Write-Host "Execution took : $($resultTime.TotalSeconds) seconds." -ForegroundColor Cyan
