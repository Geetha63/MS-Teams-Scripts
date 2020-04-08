#### Description:

This script check the each Team members job title, if at least one job title does not match to given job titles , Script will delete those teams and sent an email to owners of the team.

1.	As an Administrator, type PowerShell in the start menu. Right-click on Windows PowerShell, then select Run as Administrator. Click Yes at the UAC prompt.


        Keep the Below details in info.json file
                 "client_Id": "please paste App provider application id here" 
                 "Client_Secret": "please paste App provided client secret here" 
                 "Tenantid": "please provide requester tenant id here"
                

**Note**: Client id and client secret will be same for every tenant. Only tenant id must be changed to requester tenant id

Please provide the parameter mailsender address from which you wnat to send an email to Teamsowner.

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

Once the script executed below `output.csv` file will generate.

Sample Output:

 | DeletedTeam |OwnerName  |
 |-------------|-----------|
