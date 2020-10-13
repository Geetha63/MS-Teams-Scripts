$credential= get-credential
Connect-MicrosoftTeams -Credential $credential
Connect-AzureAD -Credential $credential
$group = Get-AzureADGroup -SearchString "all teachers"
$groupid = $group.objectid
New-CsGroupPolicyAssignment -GroupId $groupid -PolicyType TeamsChannelsPolicy -PolicyName "AllTeachers" -Rank 1
New-CsGroupPolicyAssignment -GroupId $groupid -PolicyType TeamsMeetingPolicy -PolicyName "AllTeachers" -Rank 1
New-CsGroupPolicyAssignment -GroupId $groupid -PolicyType TeamsMessagingPolicy -PolicyName "AllTeachers" -Rank 1