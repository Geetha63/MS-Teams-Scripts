# User As Teams Owner
# Description:
 Script will provide the teams details where user as owner of a team in your organization
 
### Prerequisite 

 **`Install-Module MicrosoftTeams`** [Link](https://www.powershellgallery.com/packages/MicrosoftTeams/1.0.6)
 
## Procedure

1. As an Administrator, type PowerShell in the start menu. Right-click on Windows PowerShell, then select Run as Administrator.
Click Yes at the UAC prompt.

2. Type the following within PowerShell and then press enter.\
    **`Install-Module MicrosoftTeams`**
  
3. Type Y at the prompt.Press Enter.

4. If you are prompted for an untrusted repository,then type A (Yes to All) and press Enter.The module will now install. 

- Script will prompt you for input user,provide the input to proceed.
- To connect to microsoftteams provide the global administrator credentials or Teams admin credentials.
- Script will get the teams details where user as owner for the team in your organization. 
- Exports details to a output.csv file.

# Example 
 ```bash
 Get-TeamUser -GroupId 5e4aac3a-2547-4645-bb56-dafdb8733ccd -Role Owner | Where-Object {$_.User -match 'John megh'}
 ```

# Parameters
 User : the user whom you want to get the data.\
 example:- User:'John megh'
# Input 
User :'John megh'
# Output
 The details of teams will stores in output.csv file.

