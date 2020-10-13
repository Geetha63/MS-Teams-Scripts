#Setting custom Attribute for students  
$group = Get-AzureADGroup -SearchString "Students of" -All $true
foreach ($group in $group){
$school= $group.displayname
$school = $school -replace("students of","")
$school=$school.Where({ $_ -ne "" })
$school=$school.Trim()
$group | Get-AzureADGroupMember | Get-EXOMailbox | Set-Mailbox -CustomAttribute10 $school
}

#Setting custom Attribute for teachers
$group = Get-AzureADGroup -SearchString "teachers of" -All $true
foreach ($group in $group){
$school= $group.displayname
$school = $school -replace("teachers of","")
$school=$school.Where({ $_ -ne "" })
$school=$school.Trim()
$group | Get-AzureADGroupMember | Get-EXOMailbox | Set-Mailbox -CustomAttribute10 $school
}