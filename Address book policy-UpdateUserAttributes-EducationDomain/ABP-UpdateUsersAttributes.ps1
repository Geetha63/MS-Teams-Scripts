﻿#Setting custom Attribute for students  
$logfile = "C:\log_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"
$start = [system.datetime]::Now

If(Get-Module -ListAvailable -Name AzureAD) 
 { 
 Write-Host "AzureAD Already Installed" 
 } 
 else { 
 try { Install-Module -Name AzureAD
 Write-Host "Installed AzureAD"
 }
 catch{
        $_.Exception.Message | out-file -Filepath $logfile -append
 }}
 If(Get-Module -ListAvailable -Name MicrosoftTeams) 
 { 
 Write-Host "MicrosoftTeams Already Installed" 
 } 
 else { 
 try { Install-Module -Name MicrosoftTeams
 Write-Host "Installed MicrosoftTeams"
 }
 catch{
        $_.Exception.Message | out-file -Filepath $logfile -append
 }}
 
 try{
$credential= get-credential
Connect-AzureAD -Credential $credential
Connect-ExchangeOnline -credential $credential
}
catch{
        $_.Exception.Message | out-file -Filepath $logfile -append
 }
 #Setting custom Attribute for Students
 

$group = Get-AzureADGroup -SearchString "Students of" -All $true
foreach ($group in $group){
$school= $group.displayname
$school = $school -replace("students of","")
$school=$school.Where({ $_ -ne "" })
$school=$school.Trim()
try{
$group | Get-AzureADGroupMember | Get-EXOMailbox | Set-Mailbox -CustomAttribute10 $school
}catch{
        $_.Exception.Message | out-file -Filepath $logfile -append
 }}


#Setting custom Attribute for teachers
$group = Get-AzureADGroup -SearchString "teachers of" -All $true
foreach ($group in $group){
$school= $group.displayname
$school = $school -replace("teachers of","")
$school=$school.Where({ $_ -ne "" })
$school=$school.Trim()
try{
$group | Get-AzureADGroupMember | Get-EXOMailbox | Set-Mailbox -CustomAttribute10 $school
}
catch{
        $_.Exception.Message | out-file -Filepath $logfile -append
 }}
$end = [system.datetime]::Now
$resultTime = $end - $start
Write-Host "Execution took : $($resultTime.TotalSeconds) seconds." -ForegroundColor Cyan
