# site name = https://contoso.sharepoint.com/sites/HrTeam
# StorageQuota = 20000 (input is in GB)
# StorageQuotaWarningLevel = 19000 (input is in GB)]

param(
      [Parameter(Mandatory=$true)][System.String]$SiteName,
      [Parameter(Mandatory=$true)][System.String]$StorageQuota,
      [Parameter(Mandatory=$true)][System.String]$StorageQuotaWarningLevel    
      )


Set-SPOSite -Identity $SiteName -StorageQuota $StorageQuota -StorageQuotaWarningLevel $StorageQuotaWarningLevel -NoWait

