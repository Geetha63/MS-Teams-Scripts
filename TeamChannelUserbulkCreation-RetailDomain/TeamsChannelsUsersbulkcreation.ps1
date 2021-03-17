$logfile = "C:\Retailteamcreationlog_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"
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
 }}

Connect-MicrosoftTeams
$Groups=Import-Csv Input.csv

foreach($Group in $Groups)
{
$Teams = New-team -DisplayName $Group.TeamName -Visibility Private
$groupid = $Teams.GroupId
$channels=$Group.ChannelName -split(";")
foreach($Channel in $Channels)
{
try
{
$teamchannel = New-TeamChannel -DisplayName $Channel -GroupId $groupid
}
catch{
        $_.Exception.Message | out-file -Filepath $logfile -append
 }

}
$Members=$Group.Member -split(";")
foreach($Member in $Members)
{
try
{
$teamuser = Add-TeamUser -GroupId $groupid -User $Member -Role Member
}
catch{
        $_.Exception.Message | out-file -Filepath $logfile -append
 }
}
$Owners=$Group.Owner -split(";")
foreach($Owner in $Owners)
{
try
{
$teamOwner = Add-TeamUser -GroupId $groupid -User $Owner -Role Owner
}
catch{
        $_.Exception.Message | out-file -Filepath $logfile -append
 }
 }


}
foreach($Group1 in $Groups.TeamName)
{
$Team=get-team -DisplayName $Group1
#$Team.DisplayName

$TeamName=$Team.DisplayName
$TeamId=$Team.GroupId
$Owners=Get-TeamUser -GroupId $Team.GroupId -Role Owner
$Owner = [string]::Join("; ",$Owners.User)
$Members=Get-TeamUser -GroupId $Team.GroupId -Role Member
$Member = [string]::Join("; ",$Members.User)
$ChannelNames=Get-TeamChannel -GroupId $Team.GroupId
$ChannelName=[string]::Join("; ",$ChannelNames.DisplayName)
$ChannelID=[string]::Join("; ",$ChannelNames.ID)


            $file = New-Object psobject
            $file | add-member -MemberType NoteProperty -Name TeamName $TeamName
            $file | add-member -MemberType NoteProperty -Name Groupid $TeamId
            $file | add-member -MemberType NoteProperty -Name channelName $ChannelName
            $file | add-member -MemberType NoteProperty -Name channelId $ChannelID
            $file | add-member -MemberType NoteProperty -Name Owner $Owner
	        $file | add-member -MemberType NoteProperty -Name Member $Member
            $file | export-csv Output.csv  -NoTypeInformation -Append
            }
            
$end = [system.datetime]::Now
$resultTime = $end - $start
Write-Host "Execution took : $($resultTime.TotalSeconds) seconds." -ForegroundColor Cyan
