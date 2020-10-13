$credential= get-credential
Connect-AzureAD -Credential $credential
$group = Get-AzureADGroup -SearchString "all teachers"
$groupid = $group.objectid
$user = Get-AzureADUser -All $true  | where {$_.AssignedLicenses  -like "*94763226-9b3c-4e75-a931-5c89701abe66*"}
$userid = $user.objectid
foreach ($userid in $userid){
Add-AzureADGroupMember -ObjectId $groupid -RefObjectId $userid
}
Get-AzureADSubscribedSku | ft  *skupart*,*consu*
(Get-AzureADGroupMember -all $true  -ObjectId $groupid).count
#end of script