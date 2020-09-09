# APP Installation:

  Script is to Add TeamsApp to Teams or Tenant by providing the parameters $OwnerPrincipalName,$AppName and selecting the input 
  
  Input 1 for add App to Team ,enter the Team name to add App to team
  
  Input 2 for add App to Tenant, script will fectch the Teams in tenant and adds given App to Teams
  
  ### Inputs
  
  Tenant_Id 
  [Find your tenant ID](https://docs.microsoft.com/en-us/onedrive/find-your-office-365-tenant-id#:~:text=In%20this%20article,your%20organization%20name%20or%20domain.)
  $OwnerPrincipalName
  $AppName
  UserId and Password: Teams Administrator/Global Administrator
    
  ### Example 
    To install Notepad, please provide App displayname Notepad for parameter $AppName, Notepad will be installed after successful running of the script 
    

1. As an Administrator, type PowerShell in the start menu. Right-click on Windows PowerShell, then select Run as Administrator.
Click Yes at the UAC prompt.

**Note**: Client id and client secret will be same for every tenant. Only tenant id must be changed to requester tenant id

Run the script it will open webpage for grant permissions.

Please login with your tenant _USER ID_ and _PASSWORD_.

![Signin](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/Siginin.png)


Once you are login it will shows the below image for Grant permissions for the app to perform the operations

![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions.png)

![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions2.png)

**Click Accept**

If you provided correct credentials it will through success status `admin_consent = True`

![Admin Consent](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/AdminConsent.png)

Now press Y to proceed further in script.

#### Expected Output
Notepad has been installed  

