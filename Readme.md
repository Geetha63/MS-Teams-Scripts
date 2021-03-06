# Microsoft Teams Powershell Scripts

This branch contains sample **Powershell** [scripts](https://github.com/Geetha63/MS-Teams-Scripts) 

## Getting the Scripts

Scripts are written in Powershell , To use the Scripts

```bash
    Copy and paste or download the script into Windows Powershell,run it accordingly
```

## Scripts list

No  | Script Name    | Description         | Script Link  |                     
|---|----------------|---------------------|------------------|
|  1|Add App to Teams and Tenant|Script is to Add TeamsApp to particular Team or all Teams in Tenant| [Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/Add%20App%20to%20Teams%20and%20Tenant)|
|2| Call Quality Dashboard Report|Script will provide total stream count including Audio,video,Appsharing for provided start time and end time, CQD Report of Given time|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/Call%20Quality%20Dashboard%20Report)
|3|Canvas|Downloading the data from the canvas|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/Canvas)
|4|Create New-CsTeamsMessagingPolicy|Enable administrators to control user messaging policy,determines whether a user is allowed to exchange the messages or not|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/Create%20New-CsTeamsMessagingPolicy)
|5|Create a Teams along with App|Script to Creating a team with group and then adding app to that Team.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/CreateTeamsalongwithAPPs)
|6|Delete Teams Where Team Members dont Have Given Job titles|Script to check the each Team members job title, if at least one job title does not match to given job titles,will delete those teams and sent an email to owners of the team.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/DeleteTeamsWhereTeamMembersdontHaveGivenJobtitles)
|7|Grant New-CsTeamsMessagingPolicy|Script to granting messaging policy to user|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/Grant-CsTeamsMessagingPolicy)
|8|Group or TeamsCreationRestrictionPolicy-Bulk|Script to restrict Office 365 group creation to the members of a particular security group.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/Group%20or%20TeamsCreationRestrictionPolicy-Bulk)
|9|Group or TeamsCreationRestrictionPolicy|Script to restrict Office 365 Group creation to the member of a particular security group.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/Group%20or%20TeamsCreationRestrictionPolicy)
|10|GuestRestrictionForGivenTeams|Script will restrict the adding guest users in Teams.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/GuestRestrictionForGivenTeams)
|11|Installed Apps|Script retrieves the list of apps installed for each user.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/InstalledAPPs)
|12|Membership Change from Teacher-Owner,Student-Member|Script will change the Teams membership role based on the user license. After the script execution Teacher license user will convert as Owner and student license users will converts as members.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/MembershipChangeTeacher-Owner%2CStudent-Member)
|13|Policy Package Assignment|Script will check the user license, After script execution Teacher license users will be assigned with “Education Teacher”,Student license users assigned with “Education_SecondaryStudent” policy packages.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/PolicyPackageAssignment)
|14|SharePoint storage limit|To modify the SharePoint storage limit|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/SharePoint%20storage%20limit)
|15|Team Owner Member and Channel details|Script returns owner,member of a team and channels of a team by providing the required input.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamOwnerMemberandChannel%20details)
|16|TeamsAppSetupPolicy|Creating a new Teams App Setup Policy and Assigning a Teams App Setup Policy to users.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamsAppSetupPolicy)
|17|Teams Creation Along with Channel and Role|Create Teams along with channel and role|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamsCreationAlongwithChannelandRole)
|18|Teams License Status For Each TenantUser|Script will check each Tenant user license. It will also check MicrosotTeams subscription. If it is in disabled mode script will enable. If user don’t have any of teams license it will print the user name in output file.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamsLicenseStatusForEachTenantUser)
|19|Teams Login Logs|Retrieve the MicrosoftTeams user log-ins for your tenant.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamsLoginLogs)
|20|Teams Owner, Member details|Retrieves the details of teams owner and member.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamsOwnerMembers%20details)
|21|Teams Signin Logs|Retrieve the MicrosoftTeams user sign-ins for your tenant|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamsSigninLogs)
|22|Teams User Activity|Use the Microsoft Teams activity reports to get insights into the Microsoft Teams user activity in your organization.Period specifies the length of time over which the report is aggregated|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamsUserActivity)
|23|User As Teams Owner|Script will retrieves the teams details where user is owner for the team.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/UserAsTeamsOwner)
|24|User Policy Assignment|Script will work for assigning custom user policies for N no.of users.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/UserPolicyAssignment)
|25|AddTeacherToDistribution list-Education domain|Script will serach and filter teachers in tenant using license parameter and adds to the All teachers distribution list|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/AddTeacherToDistribution%20list-Education%20domain)
|26|Address book policy-UpdateUserAttributes-EducationDomain|Script will check all groups of teachers,students and removes the part “students of” or “teachers of” and then it will update the user custom attribute with the school name,this way we can have both teachers,students of the same school can share the same attribute value|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/Address%20book%20policy-UpdateUserAttributes-EducationDomain)
|27|AssignPolicyToTeachers-EducationDomain|Script will search for All Teachers distribution list in tenant and assign policy types with policyName AllTeachers to All Teachers distribution list|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/AssignPolicyToTeachers-EducationDomain)
|28|CreateAndAssignAddressBookPolicy-EducationDomain|Script will create and assign the address lists,address book policies to users based on the attribute|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/CreateAndAssignAddressBookPolicy-EducationDomain)
|29|ResetPolicies-Education domain|Script is to create below custom policies to set all access to teachers and restrict to students in an orgnization|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/ResetPolicies-Education%20domain)
|30|TeachersGroupUpdate-Education domain|Script will update the All teachers distribution list members,it checks the users who has teacher license are added to the All teachers distribution list are not, if any users are not added, script will add that particular users to DL|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeachersGroupUpdate-Education%20domain)
|31|Send Notification to Selected Audience and Direct them to a Deep Link App|Script accepts both target audience, destination we need to point the users to (App / Deep Link to a specific entity) from the user, send a notification based on the user input|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/Send%20Notification%20to%20Selected%20Audience%20and%20Direct%20them%20to%20a%20Deep%20Link%20%20App)
|32|DomainValidation|Script does a DNS name query resolution for Lync discover records and validates if they are pointing to webdir.online.lync.com|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/DomainValidation)
