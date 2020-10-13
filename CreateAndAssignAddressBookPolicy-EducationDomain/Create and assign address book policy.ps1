#Creating and assigning address policy
$cred = Connect-ExchangeOnline
$user=  Get-Mailbox -ResultSize unlimited
$school = $user.CustomAttribute10 |  Sort-Object | Get-Unique
$school=$school.Where({ $_ -ne "" })
$school=$school.Trim()
foreach ($school in $school){
New-AddressList -Name $school   -ConditionalCustomAttribute10 $school -IncludedRecipients "AllRecipients"
$addresslist = (Get-AddressList $school).name+' GAL'
New-GlobalAddressList -Name "$addresslist" -ConditionalCustomAttribute10  $school -IncludedRecipients "AllRecipients"
$GAL=  $school+' GAL'
New-OfflineAddressBook -Name $school -AddressLists "\$gal"
New-AddressBookPolicy -Name $school -AddressLists "\$school" -RoomList "\All Rooms" -OfflineAddressBook "$school" -GlobalAddressList "$gal"
Get-Mailbox | where{$_.customattribute10 -like "*$school*"} | Set-Mailbox -AddressBookPolicy $school
}
