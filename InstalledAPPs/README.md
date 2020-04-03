#### Description:
##### Prerequisites:
1. As an Administrator, type PowerShell in the start menu. Right-click Windows PowerShell, then select Run as Administrator.
Click Yes at the UAC prompt.

   Keep the Below details in info.json file
      "client_Id":  "please paste App provider application id here"\
      "Client_Secret":  "please paste App provided client secret here"\
      "Tenantid":  "please provide requester tenant id here"

Note: Client id and client secret will be same for every tenant. Only tenant id must be changed to requester tenant id

Run the script it will open webpage for grant permissions.

Please login with your tenant _USER ID_ and _PASSWORD_.
![Signin](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/Siginin.png)

Once you are login it will shows the 

![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions.png)
![GrantPermission](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/GrantPermissions2.png)

Click accept

If you provided correct credentials it will through success status `admin_consent = True`

![Admin Consent](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/AdminConsent.png)

Now press Y to proceed further in script.
Script will create 3files. 
`Apps.csv` is the final output file having Teams applications for each user.

Output file:

| ID | Displayname |UserPrincipalName | InstalledApps |




