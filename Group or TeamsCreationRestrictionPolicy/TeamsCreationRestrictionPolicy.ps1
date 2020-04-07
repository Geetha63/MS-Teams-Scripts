
param(
      [Parameter(Mandatory=$true)][System.String]$Groupname,
      [Parameter(Mandatory=$true)][System.String]$AllowGroupCreation
      )
$conDetails = Connect-AzureAD
$tenantDomain = $conDetails.TenantDomain

$settingsObjectID = (Get-AzureADDirectorySetting | Where-object -Property Displayname -Value "Group.Unified" -EQ).id
 if(!$settingsObjectID)
    {
	$template = Get-AzureADDirectorySettingTemplate | Where-object {$_.displayname -eq "group.unified"}
	$settingsCopy = $template.CreateDirectorySetting()
	New-AzureADDirectorySetting -DirectorySetting $settingsCopy
	$settingsObjectID = (Get-AzureADDirectorySetting | Where-object -Property Displayname -Value "Group.Unified" -EQ).id
     }

	$settingsCopy = Get-AzureADDirectorySetting -Id $settingsObjectID
	$settingsCopy["EnableGroupCreation"] = $AllowGroupCreation

 if($GroupName)
   {
	$settingsCopy["GroupCreationAllowedGroupId"] = (Get-AzureADGroup -SearchString $GroupName).objectid
    }

    Set-AzureADDirectorySetting -Id $settingsObjectID -DirectorySetting $settingsCopy

    (Get-AzureADDirectorySetting -Id $settingsObjectID).Values
