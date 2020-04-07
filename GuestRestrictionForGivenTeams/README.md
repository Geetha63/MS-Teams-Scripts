#### Description:

This script will restrict the guest users in Teams by applying restriction for O365 Group.Script will take the input from current folder and create output in current folder (keep the info.json file in same folder where you are running the script)

Powershell 3.0 or more should be available.

Right-click Windows PowerShell, then select Run as Administrator. Click Yes at the UAC prompt.

Prepare input.csv file in below format and keep it in current location where script is running 

![Input](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/InkedGuestrestrictionForGivenTeams-Input_LI.jpg)

    Keep the Below details in info.json file
             "client_Id":  "please paste App provider application id here" 
              "Client_Secret":  "please paste App provided client secret here" 
              "Tenantid":  "please provide requester tenant id here"


**Note**: Client id and client secret will be same for every tenant. Only tenant id must be changed to requester tenant id

Run the script it will open webpage for grant permissions.

Please login with your tenant _USER ID_ and _PASSWORD_.

![Signin](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/Siginin.png)

Once you are login it will shows the below image for Grant permissions for the app to perform the operations

![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions.png)
![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions2.png)

**Click Accept**

If you have provided the correct credentials it will give success status `admin_consent = True`

![Admin Consent](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/AdminConsent.png)

Now press Y to proceed further in script.

Script will take the input from _input.csv_

Once the script executed below output.csv file will generate.

Sample Output:

|TeamsName	| AllowToAddGuests |
|-----------|------------------|
|HR	        | FALSE            |
|IT Team	| FALSE            |
|Admin      | FALSE            |
|Accounts   | FALSE            |
