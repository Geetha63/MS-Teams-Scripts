# DeleteTeamsWhereTeamMembersdontHaveGivenJobtitles

# Description

This script checks the each Team member job title, if at least one job title does not match to given job titles,Script will delete those teams.It will generate the ouput.csv file in current folder and sent an email to deleted team owners.

This is Graph API script, to excute the script user needs to create an Azure App and provide the necessary permisssons 

[How to create Azure App](https://docs.microsoft.com/en-us/graph/auth-register-app-v2)

[How to apply permissions](https://docs.microsoft.com/en-us/graph/notifications-integration-app-registration)

### Requried Permissions

|Permission type	          |  Permissions (from least to most privileged)|
|----------|-------------------|
|Delegated (work or school account)|Group.ReadWrite.All, Mail.Send| 
|Application|Directory.AccessAsUser.All, Mail.Send|

# Example

mailsener AdeleV@contoso.com

keepjobtitles Manager,Hr,Associate 

script will delete HR Team if anyone of team member jobtitle does not match and script will send an email to HR team owner behalf of mailsender(AdeleV@contoso.com)

# Parameters

 `mailsender`
 
   User Principal Name(for example: AdeleV@contoso.com) to send an email to Teams owner of deleted Teams 
   
   Type: string 

 `KeepJobtitles`
 
   Designation of the employe(for example: Manager)
   
   Type: string 
      

# Inputs
   
   client_Id
   
   Client_Secret
   
   Tenantid
   
   mailsender
   
   KeepJobtitles
        
 # Procedure to run the script
 
   To excute `DeleteTeamsWhereTeamMembersdontHaveGivenJobtitles` download/copy and paste the script into powersell
        
   Provide the input parameters mailsender,client_Id,Client_Secret,Tenantid,KeepJobtitles and hit enter to proceed further on the script
        
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
 
 Script will export the output.csv file which contains list of deleted Teams along with owners,also it will send an email to Teams owner behalf of mail sender
 
 ##### Example
 
 |DeletedTeam|TeamsOwner        |
 |-----------|------------------|
 |HR         |fannyd@contoso.com|
 |Accounts   |danas@contoso.com |
