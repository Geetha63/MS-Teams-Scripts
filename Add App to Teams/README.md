# Add App to Teams or Tenant

# Description

  Script is to add TeamsApp to Teams by providing the parameters TeamId and AppName 
  
# Prerequisites

Microsoft Teams PowerShell public preview
  
# Parameters
 
`-TeamId`

Team identifier in Microsoft Teams

Type:	String
***
Aliases:	GroupId
***
Position:	Named
***
Default value:	None
***
Accept pipeline input:	True
***
Accept wildcard characters:	False

`-AppId`

Teams App identifier in Microsoft Teams

Type:	String
***
Position:	Named
***
Default value:	None
***
Accept pipeline input:	True
***
Accept wildcard characters:	False
  
# Inputs
 
  AppName
  
  TeamName
    
# Procedure to run the script
 
   To excute `Add App to Teams` download/copy and paste the script into powershell
        
   Provide the input parameters AppName,TeamId and hit enter to proceed further on the script
   
   Please provide the global administrator credentials or Teams administrator credentials to `Connect-microsoftteams`
        
 ### Example 
 
    To install OneNote app, please provide app displayname: OneNote for parameter $AppName, OneNote will be installed after successful running of the script 
    
#### Expected Output
OneNote has been installed  

