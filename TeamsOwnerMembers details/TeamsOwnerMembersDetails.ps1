# This script will provide the Teams Member and Owner details 


connect-microsoftteams
$Teams = get-team 
foreach ($team in $Teams) 
    {

 

        $groupid = $team.Groupid
        $displayname = $team.DisplayName
        $Teammember = get-teamuser -GroupId "$groupid" -Role Member
        $TeamOwner = get-teamuser -GroupId "$groupid" -Role Owner
        $Members = [string]::Join("; ",$Teammember.User)
        $Owner = [string]::Join("; ",$TeamOwner.User)
        #$groupid
        #$Memebrs
        #Owner
 

       
            $file = New-Object psobject
            $file | add-member -MemberType NoteProperty -Name Teamid $groupid
            $file | add-member -MemberType NoteProperty -Name TeamDisplayname $displayname
            $file | add-member -MemberType NoteProperty -Name Owner  $Owner
            $file | add-member -MemberType NoteProperty -Name Member $Members
        
         
            $file | export-csv output.csv -NoTypeInformation -Append
            
    
    }