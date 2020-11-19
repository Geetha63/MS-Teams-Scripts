# Teams Owner Members details

# Description
Script will fetch the Teams owner and members details

# Prerequisite
   **`Install-Module MicrosoftTeams`** [link](https://www.powershellgallery.com/packages/MicrosoftTeams/1.0.6)

# Procedure

1. As an Administrator, type PowerShell in the start menu. Right-click Windows PowerShell, then select Run as Administrator.
Click Yes at the UAC prompt

2. Type the following within PowerShell command prompt and then press enter\

    **`Install-Module MicrosoftTeams`** 
    
3. Type Y at the prompt, press enter

4. If you are prompted for an untrusted repository, then type A (Yes to All) and press Enter. The module will now install

- Get the script from 'Teams_Owner and Members details.ps1' and paste it in windows powershell command prompt
- Run the script ,script will process the below steps

  1. Provide the Teams Administrator credentials to connect to MicrosoftTeams
  2. It will get the available Teams in the tenant
  3. After getting the available teams in tanant, script will fetch the owner and members of each team\
 Then exports the details of Teams in your tenant to a .csv file,**Output.csv** will store in the current folder
# Example 
 ```bash
 Get-Teamuser -GroupId 5e4aac3a-2547-4645-bb56-dafdb8733ccd -Role Member
 ```
```bash
 Get-Teamuser -GroupId 5e4aac3a-2547-4645-bb56-dafdb8733ccd -Role Owner 
 ```
# Output
 The details of each Team will stores in a .csv file with below details 
 
 |Team Name| Team id|Team Owner|Team member|

