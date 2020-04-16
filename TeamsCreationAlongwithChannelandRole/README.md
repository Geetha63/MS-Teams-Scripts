#### Description:

Create Teams along with channel and role

Provide the input data `TeamName` `ChannelName` `Owner` `Member` and `Visibility` in .csv format and provide the path location in script.

Script will generate the `output.csv` file which holds the details of created TeamName,TeamOwner,Member,ChannelName,Channelid.


##### Prerequisites:
1. As an Administrator, type PowerShell in the start menu. Right-click Windows PowerShell, then select Run as Administrator.
Click Yes at the UAC prompt.

2. Type the following within PowerShell and then press Enter:\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**`Install-Module MicrosoftTeams`**
  
3. Type Y at the prompt.Click Enter.

4. If you are prompted for an untrusted repository,then type A (Yes to All) and press Enter.The module will now install. 

Run the script  \
Provide the global administrator credentials or Teams admin credentials.


Script will export the created Teams details of microsoft Teams in your tenant with following details to a `output.csv` file.\

| TeamName |TeamId | channelName |channelId |TeamOwner | Team Member |
|----------|-------|-------------|----------|----------|-------------|