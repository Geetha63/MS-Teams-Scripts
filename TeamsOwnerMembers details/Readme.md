### Description:

#### Prerequisites:

1. As an Administrator, type PowerShell in the start menu.Right-click Windows PowerShell,then select Run as Administrator.
Click Yes at the UAC prompt.

2. Type the following within PowerShell and then press Enter:\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**`Install-Module MicrosoftTeams`**
    
3. Type Y at the prompt.Press Enter.

4. If you are prompted for an untrusted repository,then type A (Yes to All) and press Enter.The module will now install. 
To run the script please provide the global administrator credentials or Teams admin credentials.

This script will export details of microsoft Teams in your tenant with following details to a .csv file.\
Team Displayname,Teamid,Team owner,member

First it will get the available Teams in the tenat\
For each Team it will fetch the Owner and members of the team\
output contain **_Team Name_, _Team id_, _Team Owner_,_Team member_**\
**Output.csv** will store in the current folder.
