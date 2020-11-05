# DeleteTeamsWhereTeamMembersdontHaveGivenJobtitles

# Description

This script checks the each Team member job title, if at least one job title does not match to given job titles , Script will delete those teams and sent an email to owners of the team.To excute download/copy and paste the script into powersell,fallow the procedure

# Inputs

   $mailsender
   
   $client_Id
   
   $Client_Secret
   
   $Tenantid
   
   $KeepJobtitles

   Username Ex: davidc@contoso.com
        
   Password
        
 # Procedure to run the script
 
   To excute `DeleteTeamsWhereTeamMembersdontHaveGivenJobtitles` download/copy and paste the script into powersell
        
   Provide the input parameters $mailsender,$client_Id,Client_Secret,$Tenantid,$KeepJobtitles and hit enter to proceed further on the script
        
   Now script will redirect to web page for login
        
   ![Signin](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/Siginin.png)
        
   Provide admin credentials i.e user ID and password 
        
   Press enter to continue
        
 # Output
 
 Will receive pop up information of deleted teams,also it will send an email behalf of mail sender
