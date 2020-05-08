#### Description:
Assign policy script will work for assigning custom policies at per-user scope and bulk users.
Script has all the avaialble policies to user listed below, please provide the  requried input from 1 to 12 to apply the policy. 

                      1- TeamsAppSetupPolicy 
                      2- TeamsMeetingPolicy 
                      3- TeamsCallingPolicy
                      4- TeamsMessagingPolicy 
                      5- BroadcastMeetingPolicy
                      6- TeamsCallParkPolicy
                      7- CallerIdPolicy 
                      8- TeamsEmergencyCallingPolicy 
                      9- TeamsEmergencyCallRoutingPolicy
                      10-VoiceRoutingPolicy 
                      11-TeamsAppPermissionPolicy 
                      12-TeamsDailPlan


##### Prerequisites:
1. As an Administrator, type PowerShell in the start menu. Right-click Windows PowerShell, then select Run as Administrator.
Click Yes at the UAC prompt.

2. Type the following within PowerShell and then press Enter:\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**`Install-Module MicrosoftTeams`**
  
3. Type Y at the prompt.Press Enter.
 
4. If you are prompted for an untrusted repository,then type A (Yes to All) and press Enter.The module will now install. 

Please fallow the below steps to create _Messaging policy_ for restricting Private Chat
1)	Install [SFB online connector](https://www.microsoft.com/en-us/download/details.aspx?id=39366)
2)	Run the `**Createmessaingpolicy.ps1**`
3) Provide the parameters `policyname` and `username`






