#### Description:

You can restrict Office 365 Group creation to the members of a particular security group.\

Office 365 Global admins can create Groups via any means, such as the Microsoft 365 admin center, Planner, Teams, Exchange, and SharePoint Online.

System should have the Azureadpreview module `Install-Module azureadpreview`

##### Input:
In Input file:
Save file in .xlsx formate

 | Groupname    | AllowGroupCreation    |
 |--------------|--------------------   |
 | Group1       | True                  |
 | Group2       | False                 |


Groupname(The name of created O365security Group)

AllowGroupCreation: Do You want to allow this group to create Teams True/False



##### Prerequisites:

As an Administrator, type PowerShell in the start menu. 

Right-click Windows PowerShell, then select Run as Administrator. Click Yes at the UAC prompt.
1.	Type the following within PowerShell and then press Enter:

     `Install-Module AzureAd`

2.	Type Y at the prompt.Press Enter

3.	If you are prompted for an untrusted repository,then type A (Yes to All) and press Enter.The module will now install.

To run the script please provide the global administrator credentials or AzureAD admin credentials 

Script will restrict or allow the group users based on AllowGroupCreation input.
