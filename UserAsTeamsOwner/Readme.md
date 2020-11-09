# User As Teams Owner

# Description

 Script will provide the Teams details where user as owner of a team in your organization
 
# Prerequisite 

 **`Install-Module MicrosoftTeams`** [Link](https://www.powershellgallery.com/packages/MicrosoftTeams/1.0.6)
 
# Procedure

1. As an Administrator, type PowerShell in the start menu. Right-click on Windows PowerShell, then select Run as Administrator.
Click Yes at the UAC prompt.

2. Type the following within PowerShell and then press enter.\
    **`Install-Module MicrosoftTeams`**
  
3. Type Y at the prompt.Press Enter

4. If you are prompted for an untrusted repository,then type A (Yes to All) and press Enter.The module will now install. 

   - Script will prompt you for input user,provide the input to proceed.
   - To connect to microsoftteams provide the global administrator credentials or Teams admin credentials.
   - Script will get the teams details where user as owner for the team in your organization. 
   - Exports details to a output.csv file.

# Example 

User: dmx1@example.com

|Team Owner| Team Displayname|Teamid|
|-----|----|---|
|dmx1@example.com| HR| 208bfb7a-9d4c-xxxx-8677-18cc7fcxxxxx |
|dmx1@example.com|Accounts|48ddcc0e-xxxx-4131-abf8-36axxxxx86ba|

# Parameters

`-UserPrincipalName`

Speicifies the user ID of the user to retrieve.

Type:	String
***
Position:	Named
***
Default value:	None
***
Accept pipeline input:	True
***
Accept wildcard characters:	False
 
# Input 

UserPrincipalName

# Output
 Script will export details of user as owner of microsoft Teams in your tenant with following details to a output.csv file.\
|Team Owner| Team Displayname|Teamid|
