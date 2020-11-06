# MembershipChangeTeacher-Owner,Student-Member

# Description

This script will change the Teams membership role based on the user license. After the script execution teacher license user will convert as Owner and student license users will converts as members, if user dont have Microsoft Teams license it will export the users list

[How to create Azure App](https://docs.microsoft.com/en-us/graph/auth-register-app-v2)

[How to apply permissions](https://docs.microsoft.com/en-us/graph/notifications-integration-app-registration)

#### Requried Permissions

# Example

##### Case1:(If user having faculty license and be part of ownerlist)

   This user having Faculty license and already owner of the team message will populate on the screen
   
##### Case2: (If user having faculty license and not part of ownerlist)

   Faculty Membership role has been changed to Owner of the team will populate on the screen

##### Case3:(If user having STUDENT license and not part of ownerlist)

  This user having STUDENT license and already member of the team will populate on the screen

##### Case4:(If user having STUDENT license and part of ownerlist)

  Student Membership role has been changed to member will populate on the screen

##### Case5:(If user dont have license)

  User have the different license and expots the user list will populate on the screen

# Parameters

# Inputs

Client_Id,Client_Secret,Tenantid

# Procedure to run the script
 
   To excute `MembershipChangeTeacher-Owner,Student-Member` download/copy and paste the script into powersell
        
   Provide the input parameters Client_Id,Client_Secret,Tenantid and hit enter to proceed further on the script
        
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

##### Example

|UserName  | Userid  |
|----------|---------|
|David Chew|81701046-cb37-439b-90ce-2afd9630af7d|
