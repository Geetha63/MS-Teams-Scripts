

   $conDetails = Connect-AzureAD
   $tenantDomain = $conDetails.TenantDomain

#Declare the file path and sheet name
   $file = "D:\Input.xlsx"
   $sheetName = "Sheet1"

#Create an instance of Excel.Application and Open Excel file
   $objExcel = New-Object -ComObject Excel.Application
   $workbook = $objExcel.Workbooks.Open($file)
   $sheet = $workbook.Worksheets.Item($sheetName)
   $objExcel.Visible = $false
#Count max row
   $rowMax = ($sheet.UsedRange.Rows).count

#Declare the starting positions
   $rowGroupName, $colGroupName = 1, 1
   $rowAllowGroupCreation, $colAllowGroupCreation = 1, 2

#loop to get values and store it
   for ($i = 1; $i -le $rowMax - 1; $i++) {

   $GroupName = $sheet.Cells.Item($rowGroupName + $i, $colGroupName).text
    $AllowGroupCreation = $sheet.Cells.Item($rowAllowGroupCreation + $i, $colAllowGroupCreation).text


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
}
$objExcel.quit()