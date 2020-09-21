# TeamsAppSetupPolicy


#### Description:

Creating a New Teams App Setup Policy and Assigning a Teams App Setup Policy to Users

##### Prerequisites:


Follow the below steps to create new Teams App Setup Policy:

[Login into the Teams Admin centre](https://admin.teams.microsoft.com)

Click on Teams apps **&rightarrow;** Setup policies

![SetupPolicy](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/TeamsAppSetupPolicy-setuppoliocy.png)

Click Add

![Add](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/TeamsAppSetupPolicy-Add.png)

Choose options for policy

![Chooseoption](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/TeamsAppSetupPolicy-choose%20option.png)

Choose Pinned apps by clicking Add apps

![ChoosePinnedApps](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/TeamsAppSetupPolicy-PinnedApps.png)

 Search apps 

 ![AddPinnedApps](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/TeamsAppSetupPolicy-AddPinnedApps.png)

 Click save.

Now we can apply Teams app setup policy using script
As an Administrator, type PowerShell in the start menu. 

Right-click Windows PowerShell, then select Run as Administrator. Click Yes at the UAC prompt.
1.	Type the following within PowerShell and then press Enter:

     `Install-Module MicrosoftTeams`
2.	Type Y at the prompt.Press Enter

3.	If you are prompted for an untrusted repository,then type A (Yes to All) and press Enter.The module will now install.

To run the script please provide the global administrator credentials or Teams admin credentials.\
                .......................

For single user use `TeamsAppsetuppolicy-SingleUser`
  Run the script, provide the parameters\
  PolicyName:\
  UserName:

# Example

![DetailsScreenshot](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/TeamsAppSetupPolicy-Deatilsscreenshot.png)

Supply credentials

![Credentials](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/TeamsAppSetupPolicy-Credentialspage.png)

It will assign the policy to user.\
                          ........................................
                          
For Bulk users use `TeamsAppsetuppolicy - Bulk users`
Provide the input in `Input.csv file`

      | User     | PolicyName    |
      |----------|------------   |
      | User1    | Policy1       |
      | User2    | Policy2       |


Run the `TeamsAppsetuppolicy - Bulk users` script

Provide the administrator credentials

![Credentials](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/TeamsAppSetupPolicy-Credentialspage.png)


Policy will assign to respective users.




