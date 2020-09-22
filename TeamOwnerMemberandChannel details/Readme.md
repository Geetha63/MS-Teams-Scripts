# TeamOwnerMemberandChannel details

# Description:
Script returns owner,member of a team and channels of a team by providing the required input 1 or 2.

	1- To get the TeamsOwnerandMember details of a team in tenant
	2- To get the availale channels in each Team

# Prerequisites:

1. As an Administrator, type PowerShell in the start menu.Right-click Windows PowerShell,then select Run as Administrator.
Click Yes at the UAC prompt.

2. Type the following within PowerShell and then press Enter:\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;**`Install-Module MicrosoftTeams`**
    
3. Type Y at the prompt.Press Enter.

4. If you are prompted for an untrusted repository,then type A (Yes to All) and press Enter.The module will now install. 
5. Run the script,please provide the global administrator credentials or Teams admin credentials.

# If Input=1

First it will get the available Teams in the tenat\
For each Team it will fetch the Owner and members of the team

# Output

Script will export **Teamoutput.csv** in the current folder contains feilds

| _Team Name_ | _Team id_ | _Team Owner_ | _Team member_ |

# If input=2

First it will get the available Teams in the tenat\
For each Team it will fetch the Teamid,TeamDisplayname and ChannelName of the team

# Output

Script will export the **Channeloutput.csv** in the current folder

Output contain | _Teamid_ | _TeamDisplayname_ | _ChannelName_ |
