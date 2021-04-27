# Grant-CsTeamsAppPermissionPolicy

# Description
Grant-CsTeamsAppPermissionPolicy script assign custom policies to users based on the job title

Users whose job title contains Manager will be assigned with Level1Policy and others will be assigned with UsersPolicy 
# Prerequisite
(MicrosoftTeams module)![https://www.powershellgallery.com/packages/MicrosoftTeams/2.2.0-preview]
# Parameters
**`-Identity`**

Indicates the Identity of the user account the policy should be assigned to. User Identities can be specified using one of four formats: 1) the user's SIP address; 2) the user principal name (UPN); 3) the user's domain name and login name, in the form domain\logon (for example, litwareinc\kenmyer); and, 4) the user's Active Directory display name (for example, Ken Myer). User Identities can also be referenced by using the user's Active Directory distinguished name.

Type:	UserIdParameter
* * *
Position:	0
* * *
Default value:	None
* * *
Accept pipeline input:	False
* * *
Accept wildcard characters:	False

**`-PolicyName`**

The name of the custom policy that is being assigned to the user. To remove a specific assignment and fall back to the default tenant policy, you can assign it to $Null.

Type:	String
* * *
Position:	1
* * *
Default value:	None
* * *
Accept pipeline input:	False
* * *
Accept wildcard characters:	False

# Inputs
Skype for Business Online/Global Admin Credentials

# Sample Output

Level1Policy assigned to Users whose job title contains Manager

UserPolicy assigned to users whose job title not matches to Manager
 
A log file will be generated with exceptions, errors along with script execution time 
