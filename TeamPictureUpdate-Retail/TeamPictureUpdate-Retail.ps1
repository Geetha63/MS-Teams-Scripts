﻿$logfile = "C:\TeamPictureUpdateRetaillog_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"
$start = [system.datetime]::Now
Connect-MicrosoftTeams
$TeamName=Read-Host "Enter TeamName"
$GroupId=Get-Team -DisplayName "$TeamName" 
$ImagePath= Read-Host "Enter the image path"
try{
Set-TeamPicture -GroupId $GroupId.groupid -ImagePath $ImagePath
}
catch{
$_.Exception.Message | out-file -Filepath $logfile -append
}
$end = [system.datetime]::Now
$resultTime = $end - $start
Write-Host "Execution took : $($resultTime.TotalSeconds) seconds." -ForegroundColor Cyan
