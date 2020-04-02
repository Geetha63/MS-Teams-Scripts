#### Description:
##### Prerequisites:
1. As an Administrator, type PowerShell in the start menu. Right-click Windows PowerShell, then select Run as Administrator.
Click Yes at the UAC prompt.

2. Type the following within PowerShell and then press Enter:\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'**Install-Module MicrosoftTeams**'
  
3. Type Y at the prompt.Press Enter.

4. If you are prompted for an untrusted repository,then type A (Yes to All) and press Enter.The module will now install. 

To run the script please provide the global administrator credentials or Teams admin credentials.


This script will provide the teams details where user as owner for the team in your organization.

Script will export details of user as owner of microsoft Teams in your tenant with following details to a output.csv file.\
|Team Owner| Team Displayname|Teamid|
