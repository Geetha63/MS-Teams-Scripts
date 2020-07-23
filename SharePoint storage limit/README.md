#### Description:

To limit the SharePoint storage limit

### Storage

Each team in Microsoft Teams has a team site in SharePoint Online, and each channel in a team gets a folder within the default team site document library. Files shared within a conversation are automatically added to the document library, and permissions and file security options set in SharePoint are automatically reflected within Teams.

##### Prerequisites:

Please fallow the below steps to modify the Sharepoint storage limit
1)	Install [sharepoint-online](https://docs.microsoft.com/en-us/powershell/sharepoint/sharepoint-online/connect-sharepoint-online?view=sharepoint-ps)
2)	Run the `**SharePoint storage limit.ps1**`
3) Provide the parameters `$SiteName`,`$StorageQuota` and `$StorageQuotaWarningLevel`







