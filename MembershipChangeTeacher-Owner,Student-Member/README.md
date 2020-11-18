# MembershipChangeTeacher-Owner,Student-Member

# Description

This script will change the Teams membership role based on the user license. After the script execution teacher license user will convert as Owner and student license users will converts as members, if users dont have Microsoft Teams license it will export the users list

# Prerequisites

[Create Azure App](https://docs.microsoft.com/en-us/graph/auth-register-app-v2)

[How to apply permissions](https://docs.microsoft.com/en-us/graph/notifications-integration-app-registration) to your newly created App

#### Requried Permissions

|Permission type	|Permissions (from least to most privileged)|
|---|----|
|Application	|TeamSettings.Read.Group*, TeamSettings.ReadWrite.Group*, Team.ReadBasic.All, TeamSettings.Read.All, TeamSettings.ReadWrite.All, Group.Read.All, Group.ReadWrite.All, Directory.Read.All, Directory.ReadWrite.All, User.Read.All, User.ReadWrite.All, Directory.Read.All, Directory.ReadWrite.All|

# Example

##### Case1:(If user having faculty license and be part of ownerlist)

   This user having Faculty license and already owner of the team message will populate on the screen
   
##### Case2: (If user having faculty license and not part of ownerlist)

   Faculty Membership role has been changed to Owner of the team message will populate on the screen

##### Case3:(If user having STUDENT license and not part of ownerlist)

  This user having STUDENT license and already member of the team message will populate on the screen

##### Case4:(If user having STUDENT license and part of ownerlist)

  Student Membership role has been changed to member message will populate on the screen

##### Case5:(If user dont have license)

  User have the different license and expots the user list message will populate on the screen

# Parameters

`-isLicensed`

 Whether or not the user has any licenses assigned
 
 Type: SkuPartNumber
 
# Inputs

Client_Id,Client_Secret,Tenantid

# Procedure to run the script
 
   To excute `MembershipChangeTeacher-Owner,Student-Member` download/copy and paste the script into powershell
        
   Provide the input parameters Client_Id,Client_Secret,Tenantid and hit enter to proceed further on the script
    
   Please provide the Teams admin credentials to connect to Microsoft Teams
   
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

List of users who has no licnese, output.csv will be generated 

##### Example

|UserName  | Userid  |
|----------|---------|
|David Chew|81701046-cb37-439b-90ce-2afd9630af7d|
