#this script will take the input from current folder and create output in current folder (Teamslist.csv should have Teamid, AllowToAddGuests) 
#this script will change the Given Teams groups AllowToAddGuests value to False

$logfile = "C:\log_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"
$start = [system.datetime]::Now

     $Tenantid=read-host "Please provide tenant id"
     $client_Id=Read-host "Please provide client id"
     $Client_Secret=read-host "Please provide client secret"

#Grant Adminconsent 
$Grant= 'https://login.microsoftonline.com/common/adminconsent?client_id='
$admin = '&state=12345&redirect_uri=https://localhost:1234'
$Grantadmin = $Grant + $client_Id + $admin

Start-Process $Grantadmin
write-host "login with your tenant login detials to proceed further"

$proceed = Read-host " Press Y to continue "
if ($proceed -eq 'Y')
{
    write-host "Creating Access_Token"          
              $ReqTokenBody = @{
         Grant_Type    =  "client_credentials"
        client_Id     = "$client_Id"
        Client_Secret = "$Client_Secret"
        Scope         = "https://graph.microsoft.com/.default"
    } 

    $loginurl = "https://login.microsoftonline.com/" + "$Tenantid" + "/oauth2/v2.0/token"
    try{
    $Token = Invoke-RestMethod -Uri "$loginurl" -Method POST -Body $ReqTokenBody -ContentType "application/x-www-form-urlencoded"
      }
      Catch {
    $_.Exception | Out-File $logfile -Append
   }
    $Header = @{
        Authorization = "$($token.token_type) $($token.access_token)"
    }

 #Getting Team details
    $TeamsList = Import-Csv "Teamslist.csv"
    foreach($Teams in $TeamsList){
  
                        $uri = "https://graph.microsoft.com/v1.0/groups/" + $Teams.Teamsid
                        $details = Invoke-RestMethod -Headers $Header -Uri $uri -Method Get -ContentType 'application/json'
                        
                        #Get group settings
                        $settingsuri = "https://graph.microsoft.com/v1.0/groups/" + $Teams.Teamsid + "/settings"
                        try{
                        $groupsettings = Invoke-RestMethod -Headers $Header -Uri $settingsuri -Method get -ContentType 'application/json'
                        } 
                        Catch {
                            $_.Exception | Out-File $logfile -Append
                           }
                        $Groupvalue = $groupsettings.value
        $body = '{
  "displayName": "Group.Unified.Guest",
  "templateId": "08d542b9-071f-4e16-94b0-74abb372e3d9",
  "values": [
    {
      "name": "CustomBlockedWordsList",
      "value": ""
    },
    {
      "name": "EnableMSStandardBlockedWords",
      "value": "False"
    },
    {
      "name": "ClassificationDescriptions",
      "value": ""
    },
    {
      "name": "DefaultClassification",
      "value": ""
    },
    {
      "name": "PrefixSuffixNamingRequirement",
      "value": ""
    },
    {
      "name": "AllowGuestsToBeGroupOwner",
      "value": "False"
    },
    {
      "name": "AllowGuestsToAccessGroups",
      "value": "False"
    },
    {
      "name": "GuestUsageGuidelinesUrl",
      "value": ""
    },
    {
      "name": "GroupCreationAllowedGroupId",
      "value": "62e90394-69f5-4237-9190-012177145e10"
    },
    {
      "name": "AllowToAddGuests",
      "value": "'+$Teams.AllowToAddGuests+'"
    },
    {
      "name": "UsageGuidelinesUrl",
      "value": ""
    },
    {
      "name": "ClassificationList",
      "value": ""
    },
    {
      "name": "EnableGroupCreation",
      "value": "True"
    }
  ]
}'
                        
                          if($Groupvalue.id){
                                               #if settings available update the settings
                                               $settingsid = $Groupvalue.id
                                               $patchuri = "https://graph.microsoft.com/v1.0/groups/" +$Teams.Teamsid+ "/settings/" + "$settingsid" 
                                               try{
                                               $updatesettings = Invoke-RestMethod -Headers $Header -Uri $patchuri -Method Patch -Body $body -ContentType 'application/json'
                                               }
                                               Catch {
                                                    $_.Exception | Out-File $logfile -Append
                                                   }
                                               write-host "settings has been updated for" $details.displayName
                                              }
                                        else{ 
                                              #create settings template and apply
                                              $createuri = "https://graph.microsoft.com/v1.0/groups/" +$Teams.Teamsid+ "/settings/"
                                              try{
                                              $newsettings = Invoke-RestMethod -Headers $Header -Uri $createuri -Method Post -Body $body -ContentType 'application/json'
                                              }
                                              Catch {
                                                    $_.Exception | Out-File $logfile -Append
                                                   }
                                              write-host "new settings has been created and applied to Team" $details.displayName
                                              }

                      $finaluri = "https://graph.microsoft.com/v1.0/groups/" +$Teams.Teamsid+ "/settings" 
                      try{
                      $final = Invoke-RestMethod -Headers $Header -Uri $finaluri -Method Get -ContentType 'application/json'
                      }
                      Catch {
                                  $_.Exception | Out-File $logfile -Append
                                 }
                      $status = $final.value.values.value
                      
                      $Teamuri = "https://graph.microsoft.com/v1.0/groups/" + $Teams.Teamsid
                      $Teamdetails = Invoke-RestMethod -Headers $Header -Uri $Teamuri -Method Get -ContentType 'application/json'
                      
                      write-host "exporting data for Team" $Teamdetails.displayName
                      $file = New-Object psobject
                      $file | add-member -MemberType NoteProperty -Name TeamsName $Teamdetails.displayName
                      $file | add-member -MemberType NoteProperty -Name Teamsid $Teams.Teamsid
                      $file | add-member -MemberType NoteProperty -Name AllowToAddGuests $status
                      $file | export-csv output.csv -NoTypeInformation -Append
                      } 
          }
 else 
{
    write-host "You need to login admin consent in order to continue... " 
}
$end = [system.datetime]::Now
$resultTime = $end - $start
Write-Host "Execution took : $($resultTime.TotalSeconds) seconds." -ForegroundColor Cyan    
