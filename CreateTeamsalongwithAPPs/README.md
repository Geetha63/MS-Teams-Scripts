# CreateTeamsalongwithAPPs

# Description:

Create MicrosoftTeams along with APP for your tenant

[How to create Azure App](https://docs.microsoft.com/en-us/graph/auth-register-app-v2)

[How to apply permissions](https://docs.microsoft.com/en-us/graph/notifications-integration-app-registration)
                
#### Requried Permissions

# Example

Group Name: HR, OwnerPrincipalName: AdeleV@contoso.com, AppName: OneNote

OneNote has been added to HR 

# Parameters

# Inputs

Groupname, OwnerPrincipalName, AppName, client_Id, Client_Secret,Tenantid

# Procedure to run the script

   To excute `CreateTeamsalongwithAPPs` download/copy and paste the script into powersell
        
   Provide the input parameters Groupname, OwnerPrincipalName, AppName, client_Id,Client_Secret,Tenantid and hit enter to proceed further on the script
        
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

Script will execute and Create the Teams using provided Group Name, OwnerPrincipalName and APPName

App has been added to team
