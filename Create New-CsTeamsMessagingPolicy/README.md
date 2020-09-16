# Create New-CsTeamsMessagingPolicy

### Description
The New-CsTeamsMessagingPolicy script enable administrators to control user TeamsMessagingPolicy,determines whether a user is allowed to chat. Set this to TRUE to allow a user to chat across private chat.Set this to FALSE to prohibit private chat. 

### Example
    New-CsTeamsMessagingPolicy -Identity "StudentMessagingPolicy" -AllowUserChat $false

### Parameter
`-AllowUserChat`

Determines whether a user is allowed to chat. Set this to TRUE to allow a user to chat across private chat. Set this to FALSE to prohibit private chat

Type:	                               Boolean 
 * * *
Position:	                           Named
- - -
Default value:                         None
- - -
Accept pipeline input:	               False
* * *
Accept wildcard characters:	           False
* * *

### Prerequisite
1)	Install [SFB online connector](https://www.microsoft.com/en-us/download/details.aspx?id=39366)

### Inputs
Provide the parameter
`policyname` Ex:StudentMessagingPolicy

#### How to run the script

1. As an Administrator, type PowerShell in the start menu. Right-click on Windows PowerShell, then select Run as Administrator.
Click Yes at the UAC prompt

2)	Run the **`Create New-CsTeamsMessagingPolicy.ps1`**
