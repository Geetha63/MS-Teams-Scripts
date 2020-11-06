# GuestRestrictionForGivenTeams

# Description

This script will restrict the guest users in Teams by applying restriction to O365 Group. It will take the input from current folder and create the output in current folder 

Powershell 3.0 or more should be available

[How to create Azure App](https://docs.microsoft.com/en-us/graph/auth-register-app-v2)

[How to apply permissions](https://docs.microsoft.com/en-us/graph/notifications-integration-app-registration)

#### Requried Permissions

# Example

# Parameters

# Inputs

Prepare input.csv file in below format and keep it in current location where script is running 

![Input](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/InkedGuestrestrictionForGivenTeams-Input_LI.jpg)

# Procedure to run the script

 To excute `GuestRestrictionForGivenTeams` download/copy and paste the script into powersell
 
 Provide the input parameters client_Id,Client_Secret,Tenantid and hit enter to proceed further on the script
 
 Now script will redirect to web page for login
 
 ![Signin](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/Siginin.png)
 
 Provide the admin credentials i.e user ID and password 
        
 Press enter to continue
   
 Once you are login it will shows the below image for Grant permissions for the app to perform the operations

 ![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions.png)
 
 ![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions2.png)
 
 **Click Accept**

 If you have provided the correct credentials it will give success status `admin_consent = True`

 Now press Y to proceed further in script

 Script will take the input from _input.csv_

 Once the script is executed below output.csv file will generate.

# Output
    ##### Example

|TeamsName	| AllowToAddGuests |
|-----------|------------------|
|HR	        | FALSE            |
|IT Team	| FALSE            |
|Admin      | FALSE            |
|Accounts   | FALSE            |
