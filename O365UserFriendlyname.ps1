
$Msolcred = Import-Clixml "E:\PowershellScripts-KyndrylManaged\O365License\cred.xmls"

Connect-MsolService -Credential $MsolCred

Get-MsolAccountSku | Export-Csv -Path ".\GetLicenseinfo.csv" -NoTypeInformation
$license=Import-Csv -Path ".\GetLicenseinfo.csv"
$report = @()

$timestamp = Get-Date -UFormat %Y%m%d-%H%M
$date = ( get-date ).ToString('MM/dd/yyyy')
$random = -join(48..57+65..90+97..122 | ForEach-Object {[char]$_} | Get-Random -Count 6)
$reportfile = "MailboxReport-$timestamp-$random.csv"

$licenseReference = @{
    'SPZA_IW' = 'APP CONNECT IW';
    'MCOMEETADV' = 'Microsoft 365 Audio Conferencing';
    'AAD_BASIC' = 'AZURE ACTIVE DIRECTORY BASIC';
    'AAD_PREMIUM' = 'AZURE ACTIVE DIRECTORY PREMIUM P1';
    'AAD_PREMIUM_P2' = 'AZURE ACTIVE DIRECTORY PREMIUM P2';
    'RIGHTSMANAGEMENT' = 'AZURE INFORMATION PROTECTION PLAN 1';
    'DYN365_ENTERPRISE_PLAN1' = 'DYNAMICS 365 CUSTOMER ENGAGEMENT PLAN ENTERPRISE EDITION';
    'DYN365_ENTERPRISE_CUSTOMER_SERVICE' = 'DYNAMICS 365 FOR CUSTOMER SERVICE ENTERPRISE EDITION';
    'DYN365_FINANCIALS_BUSINESS_SKU' = 'DYNAMICS 365 FOR FINANCIALS BUSINESS EDITION';
    'DYN365_ENTERPRISE_SALES_CUSTOMERSERVICE' = 'DYNAMICS 365 FOR SALES AND CUSTOMER SERVICE ENTERPRISE EDITION';
    'DYN365_ENTERPRISE_SALES' = 'DYNAMICS 365 FOR SALES ENTERPRISE EDITION';
    'DYN365_ENTERPRISE_TEAM_MEMBERS' = 'DYNAMICS 365 FOR TEAM MEMBERS ENTERPRISE EDITION';
    'Dynamics_365_for_Operations' = 'DYNAMICS 365 UNF OPS PLAN ENT EDITION';
    'EMS' = 'ENTERPRISE MOBILITY + SECURITY E3';
    'EMSPREMIUM' = 'ENTERPRISE MOBILITY + SECURITY E5';
    'EXCHANGESTANDARD' = 'EXCHANGE ONLINE (PLAN 1)';
    'EXCHANGEENTERPRISE' = 'EXCHANGE ONLINE (PLAN 2)';
    'EXCHANGEARCHIVE_ADDON' = 'EXCHANGE ONLINE ARCHIVING FOR EXCHANGE ONLINE';
    'EXCHANGEARCHIVE' = 'EXCHANGE ONLINE ARCHIVING FOR EXCHANGE SERVER';
    'EXCHANGEESSENTIALS' = 'EXCHANGE ONLINE ESSENTIALS';
    'EXCHANGE_S_ESSENTIALS' = 'EXCHANGE ONLINE ESSENTIALS';
    'EXCHANGEDESKLESS' = 'EXCHANGE ONLINE KIOSK';
    'EXCHANGETELCO' = 'EXCHANGE ONLINE POP';
    'INTUNE_A' = 'INTUNE';
    'M365EDU_A1' = 'Microsoft 365 A1';
    'M365EDU_A3_FACULTY' = 'Microsoft 365 A3 for faculty';
    'M365EDU_A3_STUDENT' = 'Microsoft 365 A3 for students';
    'M365EDU_A5_FACULTY' = 'Microsoft 365 A5 for faculty';
    'M365EDU_A5_STUDENT' = 'Microsoft 365 A5 for students';
    'O365_BUSINESS' = 'MICROSOFT 365 APPS FOR BUSINESS';
    'SMB_BUSINESS' = 'MICROSOFT 365 APPS FOR BUSINESS';
    'OFFICESUBSCRIPTION' = 'MICROSOFT 365 APPS FOR ENTERPRISE';
    'O365_BUSINESS_ESSENTIALS' = 'MICROSOFT 365 BUSINESS BASIC';
    'SMB_BUSINESS_ESSENTIALS' = 'MICROSOFT 365 BUSINESS BASIC';
    'O365_BUSINESS_PREMIUM' = 'MICROSOFT 365 BUSINESS STANDARD';
    'SMB_BUSINESS_PREMIUM' = 'MICROSOFT 365 BUSINESS STANDARD';
    'SPB' = 'MICROSOFT 365 BUSINESS PREMIUM';
    'SPE_E3' = 'MICROSOFT 365 E3';
    'SPE_E5' = 'Microsoft 365 E5';
    'SPE_E3_USGOV_DOD' = 'Microsoft 365 E3_USGOV_DOD';
    'SPE_E3_USGOV_GCCHIGH' = 'Microsoft 365 E3_USGOV_GCCHIGH';
    'INFORMATION_PROTECTION_COMPLIANCE' = 'Microsoft 365 E5 Compliance';
    'IDENTITY_THREAT_PROTECTION' = 'Microsoft 365 E5 Security';
    'IDENTITY_THREAT_PROTECTION_FOR_EMS_E5' = 'Microsoft 365 E5 Security for EMS E5';
    'M365_F1' = 'Microsoft 365 F1';
    'SPE_F1' = 'Microsoft 365 F3';
    'FLOW_FREE' = 'MICROSOFT FLOW FREE';
    'MCOEV' = 'MICROSOFT 365 PHONE SYSTEM';
    'MCOEV_DOD' = 'MICROSOFT 365 PHONE SYSTEM FOR DOD';
    'MCOEV_FACULTY' = 'MICROSOFT 365 PHONE SYSTEM FOR FACULTY';
    'MCOEV_GOV' = 'MICROSOFT 365 PHONE SYSTEM FOR GCC';
    'MCOEV_GCCHIGH' = 'MICROSOFT 365 PHONE SYSTEM FOR GCCHIGH';
    'MCOEVSMB_1' = 'MICROSOFT 365 PHONE SYSTEM FOR SMALL AND MEDIUM BUSINESS';
    'MCOEV_STUDENT' = 'MICROSOFT 365 PHONE SYSTEM FOR STUDENTS';
    'MCOEV_TELSTRA' = 'MICROSOFT 365 PHONE SYSTEM FOR TELSTRA';
    'MCOEV_USGOV_DOD' = 'MICROSOFT 365 PHONE SYSTEM_USGOV_DOD';
    'MCOEV_USGOV_GCCHIGH' = 'MICROSOFT 365 PHONE SYSTEM_USGOV_GCCHIGH';
    'WIN_DEF_ATP' = 'Microsoft Defender Advanced Threat Protection';
    'CRMPLAN2' = 'MICROSOFT DYNAMICS CRM ONLINE BASIC';
    'CRMSTANDARD' = 'MICROSOFT DYNAMICS CRM ONLINE';
    'IT_ACADEMY_AD' = 'MS IMAGINE ACADEMY';
    'TEAMS_FREE' = 'MICROSOFT TEAM (FREE)';
    'ENTERPRISEPREMIUM_FACULTY' = 'Office 365 A5 for faculty';
    'ENTERPRISEPREMIUM_STUDENT' = 'Office 365 A5 for students';
    'EQUIVIO_ANALYTICS' = 'Office 365 Advanced Compliance';
    'ATP_ENTERPRISE' = 'Office 365 Advanced Threat Protection (Plan 1)';
    'STANDARDPACK' = 'OFFICE 365 E1';
    'STANDARDWOFFPACK' = 'OFFICE 365 E2';
    'ENTERPRISEPACK' = 'OFFICE 365 E3';
    'DEVELOPERPACK' = 'OFFICE 365 E3 DEVELOPER';
    'ENTERPRISEPACK_USGOV_DOD' = 'Office 365 E3_USGOV_DOD';
    'ENTERPRISEPACK_USGOV_GCCHIGH' = 'Office 365 E3_USGOV_GCCHIGH';
    'ENTERPRISEWITHSCAL' = 'OFFICE 365 E4';
    'ENTERPRISEPREMIUM' = 'OFFICE 365 E5';
    'ENTERPRISEPREMIUM_NOPSTNCONF' = 'OFFICE 365 E5 WITHOUT AUDIO CONFERENCING';
    'DESKLESSPACK' = 'OFFICE 365 F1/F3';
    'MIDSIZEPACK' = 'OFFICE 365 MIDSIZE BUSINESS';
    'LITEPACK' = 'OFFICE 365 SMALL BUSINESS';
    'LITEPACK_P2' = 'OFFICE 365 SMALL BUSINESS PREMIUM';
    'WACONEDRIVESTANDARD' = 'ONEDRIVE FOR BUSINESS (PLAN 1)';
    'WACONEDRIVEENTERPRISE' = 'ONEDRIVE FOR BUSINESS (PLAN 2)';
    'POWERAPPS_PER_USER' = 'POWER APPS PER USER PLAN';
    'POWER_BI_STANDARD' = 'POWER BI (FREE)';
    'POWER_BI_ADDON' = 'POWER BI FOR OFFICE 365 ADD-ON';
    'POWER_BI_PRO' = 'POWER BI PRO';
    'PROJECTCLIENT' = 'PROJECT FOR OFFICE 365';
    'PROJECTESSENTIALS' = 'PROJECT ONLINE ESSENTIALS';
    'PROJECTPREMIUM' = 'PROJECT ONLINE PREMIUM';
    'PROJECTONLINE_PLAN_1' = 'PROJECT ONLINE PREMIUM WITHOUT PROJECT CLIENT';
    'PROJECTPROFESSIONAL' = 'PROJECT ONLINE PROFESSIONAL';
    'PROJECTONLINE_PLAN_2' = 'PROJECT ONLINE WITH PROJECT FOR OFFICE 365';
    'SHAREPOINTSTANDARD' = 'SHAREPOINT ONLINE (PLAN 1)';
    'SHAREPOINTENTERPRISE' = 'SHAREPOINT ONLINE (PLAN 2)';
    'MCOIMP' = 'SKYPE FOR BUSINESS ONLINE (PLAN 1)';
    'MCOSTANDARD' = 'SKYPE FOR BUSINESS ONLINE (PLAN 2)';
    'MCOPSTN2' = 'SKYPE FOR BUSINESS PSTN DOMESTIC AND INTERNATIONAL CALLING';
    'MCOPSTN1' = 'SKYPE FOR BUSINESS PSTN DOMESTIC CALLING';
    'MCOPSTN5' = 'SKYPE FOR BUSINESS PSTN DOMESTIC CALLING (120 Minutes)';
    'VISIOONLINE_PLAN1' = 'VISIO ONLINE PLAN 1';
    'VISIOCLIENT' = 'VISIO Online Plan 2';
    'WIN10_PRO_ENT_SUB' = 'WINDOWS 10 ENTERPRISE E3';
    'WIN10_VDA_E5' = 'Windows 10 Enterprise E5';
    'WINDOWS_STORE' = 'WINDOWS STORE FOR BUSINESS';
    'PHONESYSTEM_VIRTUALUSER' = 'Phone System - Virtual User';
    'MCOCAP' = 'Common Area Phone';
    'MEETING_ROOM' = 'Microsoft Teams Rooms Standard';
    'MCOPSTNC' = 'Communications Credits (Pay as you go)';
    'POWERAPPS_VIRAL' = 'Microsoft Power Apps Plan 2 Trial';
    'RIGHTSMANAGEMENT_ADHOC' = 'Rights Management Adhoc';
    'STREAM' = 'Microsoft Stream Trial';
    'Win10_VDA_E3' = 'Windows 10 Enterprise E3 Demo Trial';
    'TEAMS_EXPLORATORY' = 'Microsoft Teams Exploratory';
    'TEAMS_COMMERCIAL_TRIAL' = 'Microsoft Teams Commercial Cloud (User Initiated)'
    'DYN365_BUSCENTRAL_TEAM_MEMBER' = ''
    'PBI_PREMIUM_P2_ADDON' = ''
    'MICROSOFT_BUSINESS_CENTER' = 'Microsoft Business Center'
    'DYN365_BUSCENTRAL_ESSENTIAL' = 'Dynamics 365 Business Central Team Member'
    'POWERAPPS_INDIVIDUAL_USER' = 'PowerApps and Logic Flows'
    'POWER_BI_INDIVIDUAL_USER' = 'Power BI for Office 365 Individual'
    }

foreach($lic in $license)
{

$remaining=($lic.ActiveUnits - $lic.ConsumedUnits)

$Description = $licenseReference[$lic.SkuPartNumber]

 $file = New-Object psobject
                    $file | add-member -MemberType NoteProperty -Name SkuPartNumber  $lic.SkuPartNumber
                    $file | add-member -MemberType NoteProperty -Name ActiveUnits $lic.ActiveUnits
                    $file | add-member -MemberType NoteProperty -Name ConsumedUnits $lic.ConsumedUnits
                    $file | add-member -MemberType NoteProperty -Name RemainingUnits $remaining
                    $file | add-member -MemberType NoteProperty -Name Description $Description
                    $file | export-csv FluorLicensedetailsww1.csv -NoTypeInformation -Append

    #Add the object to the report
	$report = $report += $file
}

$report | Export-Csv -Path $reportfile -NoTypeInformation
#$body = Get-Content $reportfile -raw
((get-adgroup "M365_Baseline_UserPkg" -properties members).members).count
((get-adgroup "M365_Baseline_SharedMB_Pkg" -properties members).members).count


Send-MailMessage  -From "FluorO365License@fluor.com" -To "Saravanan.S@Kyndryl.com","Ramesh.Palanivel@kyndryl.com","Brooke.Scocozzo@kyndryl.com" -Cc "Martin.Thomas@kyndryl.com","Phani.Kumar.Kannegolla@kyndryl.com","sayeemoh@kyndryl.com" -Subject "$date Fluor O365 Daily License report" -SmtpServer "smtp.fdglobal.com" -attachments $reportfile
#Send-MailMessage  -From "FluorO365License@fluor.com" -To "sayeemoh@kyndryl.com" -Subject "$date Fluor O365 Daily License report" -SmtpServer "smtp.fdglobal.com" -attachments $reportfile