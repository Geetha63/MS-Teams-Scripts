# Group or TeamsCreationRestrictionPolicy

# Description:

You can restrict Office 365 Group creation to the members of a particular security group.

Office 365 Global admins can create Groups via any means, such as the Microsoft 365 admin center, Planner, Teams, Exchange, and SharePoint Online.

System should have the Azureadpreview module [`Install-Module azureadpreview`](https://docs.microsoft.com/en-us/powershell/azure/active-directory/install-adv2?view=azureadps-2.0-preview#installing-the-azure-ad-module)

# Example

Restricting HR group members from creating Teams or Groups

# Input:

$Groupname Ex:HR

$AllowGroupCreation Ex:False

# Parameters:
Groupname: The name of created O365security Group

AllowGroupCreation: Do You want to allow this group to create Teams True/False

# Prerequisites:

As an Administrator, type PowerShell in the start menu. 

Right-click Windows PowerShell, then select Run as Administrator. Click Yes at the UAC prompt.
1.	Type the following within PowerShell and then press Enter:

     `Install-Module AzureAd`

2.	Type Y at the prompt.Press Enter

3.	If you are prompted for an untrusted repository,then type A (Yes to All) and press Enter.The module will now install

# How to run the script:
To run the script you will need to either download it or copy and paste the script into Powershell

Provide the global administrator credentials or AzureAD admin credentials when it prompts

Script will restrict or allow the group users based on AllowGroupCreation input

# Output:

The last line of the script will display the updated settings:
![output](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/Restricting%20group%20creation.png)
