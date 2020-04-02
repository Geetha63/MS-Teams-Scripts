# This script will provide the teams details where user is owner for the team

param(
      [Parameter(Mandatory=$true)][System.String]$user
      )

connect-microsoftteams
$Data = get-team -User "$user"
foreach ($teams in $Data) 
    {

        $groupid = $teams.Groupid
        $displayname = $teams.DisplayName
        $owner = get-teamuser -GroupId "$groupid" -Role Owner | Where-Object {$_.User -match "$user"}
        $owners = [string]::Join("; ",$owner.User)
        $groupid
        $owners

        if (!($owner -eq $null))
                    {
                    $file = New-Object psobject
                    $file | add-member -MemberType NoteProperty -Name Teams_Owner $owners
                    $file | add-member -MemberType NoteProperty -Name Teams_Displayname $displayname
                    $file | add-member -MemberType NoteProperty -Name Teams_Groupid $groupid
                    $file | export-csv output.csv -NoTypeInformation -Append
                    }
    
    }



