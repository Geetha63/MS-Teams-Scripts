# TeamsSigninLogs

# Description

Retrieve the MicrosoftTeams user sign-ins for your tenant, Script will check audit logs and export the file, it contains the Teams signin username along with device name

[How to create Azure App](https://docs.microsoft.com/en-us/graph/auth-register-app-v2)

[How to apply permissions](https://docs.microsoft.com/en-us/graph/notifications-integration-app-registration)

#### Required Permissions

  | Permission type	                   |  Permissions (from least to most privileged)|
  |------------------------------------|---------------------------------------------|
  | Delegated (work or school account)	| AuditLog.Read.All and Directory.Read.All    |
  | Application	                       | AuditLog.Read.All and Directory.Read.All    |
 
# Parameters

`-Auditlogs`

 records of system activities
 
 Type: Logs

# Inputs

Client_Id, Client_Secret, Tenantid

 # Procedure to run the script
 
   To excute `TeamsSigninLogs` download/copy and paste the script into powershell
        
   Provide the input parameters Client_Id, Client_Secret, Tenantid and hit enter to proceed further on the script
        
   Now script will redirect to web page for login
        
   ![Signin](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/Siginin.png)
        
   Provide admin credentials i.e user ID and password 
        
   Press enter to continue
   
   Once you are login it will shows the below image for Grant permissions for the app to perform the operations

 ![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions.png)	
 
 ![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions2.png)
 
 **Click Accept**

 If you have provided the correct credentials it will give success status `admin_consent = True`
 
 Now press Y to proceed further in script

# Output:

_Signinoutput.csv_ is the final output file having signin details 

 | UserUPN	| CreatedDateTime	| resourceDisplayName | AppDisplayName	| IsInteractive |	DeviceDetail |
 |----------|-------------------|---------------------|------------------|--------------|----------------|
 |davidchew@contoso.com|2020-03-23T15:10:59.2906713Z|Microsoft Teams Web Client	|FALSE	|@{deviceId=; displayName=; operatingSystem=Windows 10; browser=Chrome 80.0.3987; isCompliant=; isManaged=; trustType=}|
