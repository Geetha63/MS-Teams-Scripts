param(
      [Parameter(Mandatory=$true)][System.String]$SensitivityLabelname,
      [Parameter(Mandatory=$true)][System.String]$AdminUserPrincipalName
      )
$logfile = ".\GroupCreationlog_$(get-date -format `"MMddyyyy_hhmmsstt`").txt"
$start = [system.datetime]::Now

#Security & Compliance Center
Import-Module ExchangeOnlineManagement
Connect-IPPSSession 
try{
$SensitivityLabel=Get-Label|Where-Object{$_.Name -eq $SensitivityLabelname}
}
catch{
        $_.Exception.Message | out-file -Filepath $logfile -append
 }
#Exchange Online
Connect-ExchangeOnline
#Groups Creation
$Groups= Import-Csv -path ".\GroupCreation.csv"
foreach($Group in $Groups)
{
try{
$NewGroup=New-UnifiedGroup -DisplayName $Group.DisplayName -SensitivityLabelId $SensitivityLabel.Guid  -AccessType $Group.AccessType 
$groupid=$NewGroup.guid
$Members=$Group.Member -split(",")
foreach($Member in $Members)
{
try
{
$Groupuser =Add-UnifiedGroupLinks -Identity "$groupid" -LinkType Members -Links "$Member" -ErrorAction SilentlyContinue
}
catch{
        $_.Exception.Message | out-file -Filepath $logfile -append
 }
 }

$Owners=$group.Owner -split(",")
foreach($Owner in $Owners)
{
try
{
$GroupOwners = Add-UnifiedGroupLinks -Identity "$groupid" -LinkType Owners -Links "$Owner" -ErrorAction SilentlyContinue
}
catch{
        $_.Exception.Message | out-file -Filepath $logfile -append
 }
 }
 try{
 $Rmember=Remove-UnifiedGroupLinks -Identity $Group.DisplayName -LinkType Owners -Links "$AdminUserPrincipalName" -Confirm:$false 
 $Rowner=Remove-UnifiedGroupLinks -Identity $Group.DisplayName -LinkType Members -Links "$AdminUserPrincipalName" -Confirm:$false
 }
 catch{
        $_.Exception.Message | out-file -Filepath $logfile -append
 }

 foreach($id in $groupid)
 {
 $Owners=Get-UnifiedGroupLinks -Identity "$id" -LinkType Owners
 
 $Owner = [string]::Join(" ; ",$Owners.PrimarySmtpAddress)

 $Members=Get-UnifiedGroupLinks -Identity "$id" -LinkType Members
 
 $Member = [string]::Join(" ; ",$Members.PrimarySmtpAddress)
 }
if($NewGroup -ne $null)
{
            $file = New-Object psobject
            $file | add-member -MemberType NoteProperty -Name GroupName $NewGroup.DisplayName
            $file | add-member -MemberType NoteProperty -Name Groupid $NewGroup.Guid
            $file | add-member -MemberType NoteProperty -Name ExternalDirectoryObjectId $NewGroup.ExternalDirectoryObjectId
            $file | add-member -MemberType NoteProperty -Name Member $member
            $file | add-member -MemberType NoteProperty -Name Owner $Owner
            $file | add-member -MemberType NoteProperty -Name Description $Group.Description
            $file | export-csv -path ".\GroupsOutput.csv"  -NoTypeInformation -Append
            }
            }
 catch{
$_.Exception.Message | out-file -Filepath $logfile -append
}	    
}
#Teams
#Converting Created groups into Teams
Connect-MicrosoftTeams
$ExistingGroups=Import-Csv -path ".\GroupsOutput.csv"
foreach($ExistingGroup in $ExistingGroups)
{
try{
$Team=New-Team -GroupId $ExistingGroup.ExternalDirectoryObjectId 
$TeamDescription=set-team -GroupId $Team.groupid -Description $ExistingGroup.Description
}
catch{
$_.Exception.Message | out-file -Filepath $logfile -append
}

$file = New-Object psobject
            $file | add-member -MemberType NoteProperty -Name TeamName $Team.DisplayName
            $file | add-member -MemberType NoteProperty -Name Groupid $Team.GroupId
            $file | add-member -MemberType NoteProperty -Name Visibility $Team.Visibility
            $file | add-member -MemberType NoteProperty -Name Description $TeamDescription.Description
            $file | export-csv TeamsOutput.csv  -NoTypeInformation -Append
}

#Exporting Invalid users to .csv file   
Connect-AzureAD
$Users=Import-Csv -path ".\GroupCreation.csv"

foreach($User in $Users.Member)
{
$Members=$User -split(",")
$tempObj = "" | Select-Object Name
foreach($Member in $Members)
{
try
{
$AzureADUser = Get-AzureADUser -ObjectId "$Member" -ErrorAction SilentlyContinue
}
catch{
        $tempObj.Name = "$Member"
        $_.Exception.Message | out-file -Filepath $logfile -append
 }
 if($AzureADUser)
{
            $file = New-Object psobject
            $file | add-member -MemberType NoteProperty -Name InvalidUPN $tempObj.Name  
            $file | export-csv InvalidUserslist.csv -NoTypeInformation -Append 

       }
}
 }
$end = [system.datetime]::Now
$resultTime = $end - $start
Write-Host "Execution took : $($resultTime.TotalSeconds) seconds." -ForegroundColor Cyan