#### Description:

You can restrict Office 365 Group creation to the members of a particular security group.\

Office 365 Global admins can create Groups via any means, such as the Microsoft 365 admin center, Planner, Teams, Exchange, and SharePoint Online.

System should have the Azureadpreview module `Install-Module azureadpreview`

######Parameter
Groupname: The name of created O365security Group

AllowGroupCreation: You want to allow this group of users to create Teams True/False

##### Prerequisites:

As an Administrator, type PowerShell in the start menu. 

Right-click Windows PowerShell, then select Run as Administrator. Click Yes at the UAC prompt.
1.	Type the following within PowerShell and then press Enter:

     `Install-Module AzureAd`
2.	Type Y at the prompt.Press Enter

3.	If you are prompted for an untrusted repository,then type A (Yes to All) and press Enter.The module will now install.

To run the script please provide the global administrator credentials or AzureAD admin credentials 

Provide the parameters GroupName and AllowGroupCreation.

You want to allow this group of users to create Teams: True/False

Script will restrict or allow the group users based on AllowGroupCreation input.



