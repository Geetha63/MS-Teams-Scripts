# Microsoft Teams Powershell Scripts

This branch contains sample **Powershell** [scripts](https://github.com/Geetha63/MS-Teams-Scripts) 

## Getting the Scripts

Scripts are written in Powershell , To use the Scripts

```bash
    Copy and paste or download the script into Windows Powershell,run it accordingly
```

## Scripts list

No  | Script Name    | Description         | Link to script   |                     
|---|----------------|---------------------|------------------|
|  1|APP Installation|Script is to Adding TeamsApp to Teams or to the perticular user.| [Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/App%20Installation) |
|2| Call Quality Dashboard|Script will provide CQD data output using given input parameters.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/CQD)
|3|CQD All Streams Count|Script will capture the total Stream count, Audio, Video, Video based screen share, AppSharing counts by given StartDate and EndDate.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/CQDAllStreamsCount)
|4|Canvas|Downloading the data from the canvas|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/Canvas)
|5|CreateMessaging Policy|Enable administrators to control user messaging policy,determines whether a user is allowed to exchange the messages or not.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/CreateMessaging%20Policy)
|6|Create a Teams along with App|Script to Creating a team with group and then adding app to that Team.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/CreateTeamsalongwithAPPs)
|7|Delete Teams Where Team Members dont Have Given Job titles|Script to check the each Team members job title, if at least one job title does not match to given job titles,will delete those teams and sent an email to owners of the team.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/DeleteTeamsWhereTeamMembersdontHaveGivenJobtitles)
|8|Grant Messaging Policy|Script to granting messaging policy to user|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/Grant%20Messaging%20Policy)
|9|Group or TeamsCreationRestrictionPolicy-Bulk|Script to restrict Office 365 group creation to the members of a particular security group.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/Group%20or%20TeamsCreationRestrictionPolicy-Bulk)
|10|Group or TeamsCreationRestrictionPolicy|Script to restrict Office 365 Group creation to the member of a particular security group.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/Group%20or%20TeamsCreationRestrictionPolicy)
|11|GuestRestrictionForGivenTeams|Script will restrict the adding guest users in Teams.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/GuestRestrictionForGivenTeams)
|12|Installed Apps|Script retrieves the list of apps installed for each user.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/InstalledAPPs)
|13|Membership Change from Teacher-Owner,Student-Member|Script will change the Teams membership role based on the user license. After the script execution Teacher license user will convert as Owner and student license users will converts as members.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/MembershipChangeTeacher-Owner%2CStudent-Member)
|14|Policy Package Assignment|Script will check the user license, After script execution Teacher license users will be assigned with “Education Teacher”,Student license users assigned with “Education_SecondaryStudent” policy packages.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/PolicyPackageAssignment)
|15|SharePoint storage limit|To modify the SharePoint storage limit|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/SharePoint%20storage%20limit)
|16|Team Owner Member and Channel details|Script returns owner,member of a team and channels of a team by providing the required input.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamOwnerMemberandChannel%20details)
|17|TeamsAppSetupPolicy|Creating a new Teams App Setup Policy and Assigning a Teams App Setup Policy to users.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamsAppSetupPolicy)
|18|Teams Creation Along with Channel and Role|Create Teams along with channel and role|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamsCreationAlongwithChannelandRole)
|19|Teams License Status For Each TenantUser|Script will check each Tenant user license. It will also check MicrosotTeams subscription. If it is in disabled mode script will enable. If user don’t have any of teams license it will print the user name in output file.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamsLicenseStatusForEachTenantUser)
|20|Teams Login Logs|Retrieve the MicrosoftTeams user log-ins for your tenant.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamsLoginLogs)
|21|Teams Owner, Member details|Retrieves the details of teams owner and member.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamsOwnerMembers%20details)
|22|Teams Signin Logs|Retrieve the MicrosoftTeams user sign-ins for your tenant|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamsSigninLogs)
|23|Teams User Activity|Use the Microsoft Teams activity reports to get insights into the Microsoft Teams user activity in your organization.Period specifies the length of time over which the report is aggregated|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeamsUserActivity)
|24|User As Teams Owner|Script will retrieves the teams details where user is owner for the team.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/UserAsTeamsOwner)
|25|User Policy Assignment|Script will work for assigning custom user policies for N no.of users.|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/UserPolicyAssignment)
|26|AddTeacherToDistribution list-Education domain|Script will serach and filter teachers in tenant using license parameter and adds to the All teachers distribution list|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/AddTeacherToDistribution%20list-Education%20domain)
|27|Address book policy-UpdateUserAttributes-EducationDomain|Script will check all groups of teachers,students and removes the part “students of” or “teachers of” and then it will update the user custom attribute with the school name,this way we can have both teachers,students of the same school can share the same attribute value|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/Address%20book%20policy-UpdateUserAttributes-EducationDomain)
|28|AssignPolicyToTeachers-EducationDomain|Script will search for All Teachers distribution list in tenant and assign policy types with policyName AllTeachers to All Teachers distribution lis[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/AssignPolicyToTeachers-EducationDomain)
|29|CreateAndAssignAddressBookPolicy-EducationDomain|Script will create and assign the address lists,address book policies to users based on the attribute|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/CreateAndAssignAddressBookPolicy-EducationDomain)
|30|ResetPolicies-Education domain|Script is to create below custom policies to set all access to teachers and restrict to students in an orgnization|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/ResetPolicies-Education%20domain)
|31|TeachersGroupUpdate-Education domain|Script will update the All teachers distribution list members,it checks the users who has teacher license are added to the All teachers distribution list are not, if any users are not added, script will add that particular users to DL|[Link](https://github.com/Geetha63/MS-Teams-Scripts/tree/master/TeachersGroupUpdate-Education%20domain)
