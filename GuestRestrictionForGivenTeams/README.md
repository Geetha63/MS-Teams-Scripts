# GuestRestrictionForGivenTeams

# Description

This script will restrict the guest users in Teams by changing the O365 group AllowToAddGuests parameter value to false. It takes the input from current folder and create the output in current folder 

PowerShell 3.0 or more should be available

# Prerequisites

[Create new Azure App](https://docs.microsoft.com/en-us/graph/auth-register-app-v2)

[How to apply permissions](https://docs.microsoft.com/en-us/graph/notifications-integration-app-registration) to your newly created App

#### Required Permissions

| Permission type | Permissions (from least to most privileged)|
|-----------------|--------------------------------------------|
|Application|Group.Create, Group.ReadWrite.All, Directory.ReadWrite.All|

# Example

|TeamsName 	| AllowToAddGuests |
|-----------|------------------|
|HR	        | FALSE            |

# Parameters

`-Group.Unified.Guest`

Boolean indicating whether or not a guest user can have access to Microsoft 365 groups content. This setting does not require an Azure Active Directory Premium P1 license

AllowGuestsToAccessGroups
***
Type: Boolean
***
Default: True
 
# Inputs

Prepare `input.csv` file in below format and keep it in current location where script is running 

![Input](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/InkedGuestrestrictionForGivenTeams-Input_LI.jpg)

# Procedure to run the script

 To excute `GuestRestrictionForGivenTeams` download/copy and paste the script into PowerShell
 
 Provide the input parameters Client_Id, Client_Secret, Tenantid and hit enter to proceed further on the script
 
 Now script will redirect to web page for login
 
 ![Signin](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/Siginin.png)
 
 Provide the Global Administrator credentials i.e user ID and password 
        
 Press enter to continue
   
 Once you are login it will shows the below image for grant permissions for the app to perform the operations

 ![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions.png)
 
 ![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions2.png)
 
 **Click Accept**

 If you have provided the correct credentials it will give success status `admin_consent = True`

 Now press Y to proceed further in script

 Script will take the input from _input.csv_

 Once the script is executed below output.csv file will generate

# Output
##### Example

|TeamsName 	| AllowToAddGuests |
|-----------|------------------|
|HR	        | FALSE            |
|IT Team	   | FALSE            |
|Admin      | FALSE            |
|Accounts   | FALSE            |
