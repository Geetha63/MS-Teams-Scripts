# Send Notification to Selected Audience and Direct them to a Deep Link App

# Description:

Script will accept target audience from user(CSV/Team Members/SG/DL), destination we need to point the users to App / Deep Link to a specific entity and 
send notification

# Prerequisites
  
 [Create new Azure App.](https://docs.microsoft.com/en-us/graph/auth-register-app-v2)

 [How to apply permissions](https://docs.microsoft.com/en-us/graph/notifications-integration-app-registration) to your newly created App.
 
 Please collect client id, client secret from created Azure app and tenant id from Azure portal
 
##### Required Permissions
 
|Permission type	|Permissions (from least to most privileged)|
|----|----|
|Application	|TeamsAppInstallation.ReadWriteForTeam.All, Group.ReadWrite.All, Directory.ReadWrite.All|

 # Example
  Input 1 to send notification to user chat
  
  Input 2 send notification to specific Team
  
  Input 3 send notification to user installed app
  
  Input 4 send notification to Distribution list
  
  Input 5 send notification to Bulk users for installed app(csv)
  
  Input 6 send notification to specific tab in application"
   

  # Parameters
 
`-TeamId`

Team identifier in Microsoft Teams

Type:	String
***
Aliases:	GroupId
***
Position:	Named
***
Default value:	None
***
Accept pipeline input:	True
***
Accept wildcard characters:	False

`-AppId`

Teams App identifier in Microsoft Teams

Type:	String
***
Position:	Named
***
Default value:	None
***
Accept pipeline input:	True
***
Accept wildcard characters:	False

`-TenantId`

Specifies the unique ID of the tenant on which to perform the operation. The default value is the tenant of the current user. This parameter applies only to partner users.

Type:	Guid
***
Position:	Named
***
Default value:	None
***
Accept pipeline input:	True
***
Accept wildcard characters:	False
  
# Inputs
  
  Tenant_Id, Client_Id, Client_Secret
  
  [Find your tenant ID](https://docs.microsoft.com/en-us/onedrive/find-your-office-365-tenant-id#:~:text=In%20this%20article,your%20organization%20name%20or%20domain.)
  
  OwnerPrincipalName
  
  AppName
  
  TeamName
    
# Procedure to run the script
 
   To excute `Add App to Teams and Tenant` download/copy and paste the script into powershell
        
   Provide the input parameters OwnerPrincipalName, AppName, Client_Id, Client_Secret, Tenantid and hit enter to proceed further on the script
   
   Please provide the global administrator credentials or Teams administrator credentials to `Connect-microsoftteams`
        
   Now script will redirect to web page for login
        
   ![Signin](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/Siginin.png)
        
   Provide admin credentials i.e user ID and password 
        
   Press enter to continue
   
   Once you are login it will shows the below image for grant permissions for the app to perform the operations

 ![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions.png)	
 
 ![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions2.png)
 
 **Click Accept**

 If you have provided the correct credentials it will give success status `admin_consent = True`
 
 Please choose the option 1 for add app to Team and enter the Team name 
 
 2 for add app to Tenant

 ### Example 
 
    To install Notepad, please provide app displayname: Notepad for parameter $AppName, Notepad will be installed after successful running of the script 
    
