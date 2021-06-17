# This script will create Microsoft Teams messaging policy (Restricting peer - peer chat) using PowerShell cmdlets.

param(
      [Parameter(Mandatory=$true)][System.String]$PolicyName
      )

$logfile = ".\CreateNew-CsTeamsMessagingPolicylog_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"
$start = [system.datetime]::Now

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
 } }     
 try{
Connect-MicrosoftTeams
}
 catch{
        $_.Exception.Message | out-file -Filepath $logfile -append
 } 
 try{
New-CsTeamsMessagingPolicy -Identity "$PolicyName" -AllowUserChat $false
}
catch{
$_.Exception.Message | out-file -Filepath $logfile -append
}
Write-Host "AllowUserChat is set to False"
$end = [system.datetime]::Now
$resultTime = $end - $start
Write-Host "Execution took : $($resultTime.TotalSeconds) seconds." -ForegroundColor Cyan
