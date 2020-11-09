# APP Installation

# Description

  Script is to Add TeamsApp to Teams or Tenant by providing the parameters $OwnerPrincipalName,$AppName and selecting the input 
  
 [How to create Azure App](https://docs.microsoft.com/en-us/graph/auth-register-app-v2)

 [How to apply permissions](https://docs.microsoft.com/en-us/graph/notifications-integration-app-registration)
  
 ##### Required Permissions
 
|Permission type	|Permissions (from least to most privileged)|
|----|----|
|Delegated (work or school account)	|TeamsAppInstallation.ReadWriteForTeam, Group.ReadWrite.All, Directory.ReadWrite.All|
|Delegated (personal Microsoft account)	|Not supported|
|Application	|TeamsAppInstallation.ReadWriteForTeam.All, Group.ReadWrite.All, Directory.ReadWrite.All|
  
 # Example
  
   Input 1 for add App to Team ,enter the Team name to add App 
  
   Input 2 for add App to Tenant, script will fectch the Teams in tenant and adds given App to Teams
   
 # Parameters
 
`-TeamId`

Team identifier in Microsoft Teams.

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
  
  Tenant_Id, client_Id, Client_Secret
  
  [Find your tenant ID](https://docs.microsoft.com/en-us/onedrive/find-your-office-365-tenant-id#:~:text=In%20this%20article,your%20organization%20name%20or%20domain.)
  
  OwnerPrincipalName
  
  AppName
  
  TeamName
    
# Procedure to run the script
 
   To excute `APP Installation` download/copy and paste the script into powershell
        
   Provide the input parameters OwnerPrincipalName, AppName, client_Id, Client_Secret, Tenantid and hit enter to proceed further on the script
   
   Please provide the global administrator credentials or Teams administrator credentials to `Connect-microsoftteams`
        
   Now script will redirect to web page for login
        
   ![Signin](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/Siginin.png)
        
   Provide admin credentials i.e user ID and password 
        
   Press enter to continue
   
   Once you are login it will shows the below image for Grant permissions for the app to perform the operations

 ![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions.png)	
 
 ![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions2.png)
 
 **Click Accept**

 If you have provided the correct credentials it will give success status `admin_consent = True`
 
 Please choose the option 1 for Add app to Team and enter the Team name 
 
 2 for Add app to Tenant

 ### Example 
 
    To install Notepad, please provide App displayname: Notepad for parameter $AppName, Notepad will be installed after successful running of the script 
    
#### Expected Output
Notepad has been installed  

