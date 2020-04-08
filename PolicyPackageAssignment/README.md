#### Description:

This script will check the user license. After script execution Teacher license users will be assigned with “Education Teacher”.Student license users assigned with  “Education_SecondaryStudent” policy packages.

##### Prerequisites:

1. As an Administrator, type PowerShell in the start menu. Right-click on Windows PowerShell, then select Run as Administrator. Click Yes at the UAC prompt.


        Keep the Below details in info.json file
                 "client_Id": "please paste App provider application id here" 
                 "Client_Secret": "please paste App provided client secret here" 
                 "Tenantid": "please provide requester tenant id here"
                

**Note**: Client id and client secret will be same for every tenant. Only tenant id must be changed to requester tenant id

Run the script 

Please provide the global administrator credentials or Teams admin credentials to coneect  to `connect-microsoftteams` 

It will open webpage for grant permissions.

Please login with your tenant _USER ID_ and _PASSWORD_.

![Signin](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/Siginin.png)

Once you are login it will shows the below image for Grant permissions for the app to perform the operations

![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions.png)
![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions2.png)

**Click Accept**

If you have provided the correct credentials it will give success status `admin_consent = True`

![Admin Consent](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/AdminConsent.png)

Now press Y to proceed further in script.

Once the script executed , it generates the `output.csv` file contains no license users.

Sample Output:

|UserName  | Userid  |
|----------|---------|
