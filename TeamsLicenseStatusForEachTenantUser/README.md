# TeamsLicenseStatusForEachTenantUser

# Description

This script will check each Tenant user license and MicrosotTeams subscription. If assigned license ia in disabled mode script will enable it. If user don’t have any of teams license it will print the user name in output file

# Prerequisites

[Create new Azure App](https://docs.microsoft.com/en-us/graph/auth-register-app-v2)

[How to apply permissions](https://docs.microsoft.com/en-us/graph/notifications-integration-app-registration) to your newly created App

#### Required Permissions

|Permission type	|Permissions (from least to most privileged)|
|---|----|
|Application	|User.Read.All, User.ReadWrite.All, Directory.Read.All, Directory.ReadWrite.All|

# Example

If user dont have Teams license it will export users list

If user assigned with Teams license but it is in disable status - it will enable status

# Parameters

`-isLicensed`

Whether or not the user has any licenses assigned

Type: SkuPartNumber

# Inputs

Client_Id, Client_Secret, Tenantid

# Procedure to run the script
 
   To excute `TeamsLicenseStatusForEachTenantUser` download/copy and paste the script into powershell
        
   Provide the input parameters Client_Id, Client_Secret, Tenantid and hit enter to proceed further on the script
   
   Please provide active directory admin credentials to connect `connect-msolservice` 
        
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

 Once the script executed , it generates the `Nolicense.csv` file contains no license users

##### Example

|UserName  | Userid  | Status |
|----------|---------|--------|
|David Chew|81701046-cb37-439b-90ce-2afd9630af7d|No|
