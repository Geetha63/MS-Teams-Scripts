# AssignPolicyToTeachers-Education domain

# Description
Script will search for **All Teachers** distribution list in tenant and assign policy types TeamsChannelsPolicy,TeamsMeetingPolicy,TeamsMessagingPolicy with policyName AllTeachers to **All Teachers** distribution list

GroupPolicyAssignment is used to assign a policy to a security group or distribution list. The policy assignment will then be propagated to the members of the group (even if members are added to the group later) in accordance with the rules for group policy inheritance

System should have the Azureadpreview module [`Install-Module azureadpreview`](https://docs.microsoft.com/en-us/powershell/azure/active-directory/install-adv2?view=azureadps-2.0-preview#installing-the-azure-ad-module) and [`Install-Module MicrosoftTeams`](https://www.powershellgallery.com/packages/MicrosoftTeams/1.0.6)

# Inputs
Global admin or AzureAD and MicrosoftTeams admin credentails 

# Parameters

`-GroupId`

 The ID of a batch policy assignment operation
 - - -
 Type:	String
 - - -
 Position:	Named
 - - -
 Default value:	None
 - - -
 Accept pipeline input:	False
 - - -
 Accept wildcard characters:	False
 - - -

`-PolicyName`

The name of the policy to be assigned
- - -
Type:	String
 - - -
Position:	Named
- - -
Default value:	None
- - -
Accept pipeline input:	False
- - -
Accept wildcard characters:	False

`-PolicyType`

The type of the policy to be assigned
- - -
Type:	String
- - -
Position:	Named
- - -
Default value:	None
- - -
Accept pipeline input:	False
- - -
Accept wildcard characters:	False

`-Rank`

The rank of the policy assignment, relative to other group policy assignments for the same policy type.
- - -
Type:	String
- - -
Position:	Named
- - -
Default value:	None
- - -
Accept pipeline input:	False
- - -
Accept wildcard characters:	False

# Prerequisites
As an Administrator, type PowerShell in the start menu. 

Right-click Windows PowerShell, then select Run as Administrator. Click Yes at the UAC prompt.
1.	Type the following within PowerShell and then press Enter:

     `Install-Module AzureAd` 

2.	Type Y at the prompt.Press Enter

3.	If you are prompted for an untrusted repository,then type A (Yes to All) and press Enter.The module will now install

4. Repeat steps 1 to 3 to install MicrosoftTeams module, cmdlet `Install-Module MicrosoftTeams` 

# How to run the script
To run the script you will need to either download it or copy and paste the script into Powershell

Provide the global administrator credentials or credentials which has both AzureAD and MicrosoftTeams adim permissions to connect to AzureAD and microoftTeams

Hit enter to continue

# Expected Output
Policie types TeamsChannelsPolicy,TeamsMeetingPolicy,TeamsMessagingPolicy with policyName `All teachers` are assigned to **All Teachers** distribution list with rank 1
