# DeleteTeamsWhereTeamMembersdontHaveGivenJobtitles

# Description

This script checks the each Team member job title, if at least one job title does not match to given job titles , Script will delete those teams and sent an email to owners of the team.To excute download/copy and paste the script into powersell,fallow the below procedure.

Script will auto create the Azure App and grant the permissions to perform the opertaions 

If user has build the App previously, script will skip the App creation 

# Inputs

   Username Ex: davidc@contoso.com
        
   Password 
        
   Jobtitle Ex: Manager
        
 # Procedure to run the script
 
   To excute `DeleteTeamsWhereTeamMembersdontHaveGivenJobtitles` download/copy and paste the script into powersell
        
   Provide the input parameters Username,password,Jobtitle and hit enter to proceed further on the script
        
   Now script will redirect to web page for login
        
   ![Signin](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/Siginin.png)
        
   Provide admin credentials i.e user ID and password 
        
   Press enter to continue
        
 # Output
 
 Will receive pop up information of deleted teams,also it will send an email behalf of mail sender
