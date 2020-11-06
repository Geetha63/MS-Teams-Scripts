# TeamsLoginLogs

# Description

Retrieve the MicrosoftTeams user log-ins for your tenant, Script will check audit logs and export the file, contains teams login username along with device name

[How to create Azure App](https://docs.microsoft.com/en-us/graph/auth-register-app-v2)

[How to apply permissions](https://docs.microsoft.com/en-us/graph/notifications-integration-app-registration)

#### Requried Permissions

# Example

# Parameters

# Inputs

Client_Id, Client_Secret, Tenantid

 # Procedure to run the script
 
   To excute `TeamsLoginLogs` download/copy and paste the script into powersell
        
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

# Output

 Script will generate the _loginstatusoutput.csv_ output file
 
 #### Example
 
 | UserUPN	| CreatedDateTime	| AppDisplayName	| IsInteractive |	DeviceDetail |
 |----------|-------------------|-------------------|---------------|----------------|
