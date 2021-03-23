$logfile = "C:\log_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"
$start = [system.datetime]::Now

     $Tenantid=read-host "Please provide tenant id"
     $client_Id=Read-host "Please provide client id"
     $Client_Secret=read-host "Please provide client secret"
     $TeamName=read-host "Please provide TeamName"
     $ChannelName=read-host "Please provide ChannelName"

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
    $Token = Invoke-RestMethod -Uri "$loginurl" -Method POST -Body $ReqTokenBody -ContentType "application/x-www-form-urlencoded"
    
    $Header = @{
        Authorization = "$($token.token_type) $($token.access_token)"
    }

$tabName = 'Employee Handbook'
$contentURL = 'https://www.microsoft.com/en-us/industry/retail/microsoft-cloud-for-retail'
$newTabConfig = [ordered]@{
    displayName   = $tabName
    "teamsApp@odata.bind" = "https://graph.microsoft.com/v1.0/appCatalogs/teamsApps/com.microsoft.teamspace.tab.web"
    configuration = @{
        contentUrl = $contentURL
        websiteUrl = $contentURL
        
    }
} | ConvertTo-Json

try{
$uri = ('https://graph.microsoft.com/v1.0/groups?$select=id,displayname,resourceProvisioningOptions')
#$ALLteams = (Invoke-RestMethod -Method Get -Uri $uri -Headers  $Header).Value | Where-Object {$_.resourceProvisioningOptions -contains 'Team'}

$teams = (Invoke-RestMethod -Method Get -Uri $uri -Headers  $Header).Value | Where-Object {$_.DisplayName -eq "$TeamName"}
}
Catch {
    $_.Exception | Out-File $logfile -Append
   }
# Loop through all teams
foreach ($team in $teams) {
    # Get the Channel properties
try{
    $channel = (Invoke-RestMethod -Method Get -Uri ("https://graph.microsoft.com/v1.0/teams/$($team.ID)/channels" + '?$filter=DisplayName eq ' + "'" + $ChannelName + "'") -Headers $Header).Value
        #$channel = (Invoke-RestMethod -Method Get -Uri ("https://graph.microsoft.com/v1.0/teams/$($team.ID)/channels") -Headers $Header).Value

    # Check if the tab with the same value as the $tabName aleady exists
    $tab = (Invoke-RestMethod -Method Get -Uri ("https://graph.microsoft.com/v1.0/teams/$($team.ID)/channels/$($channel.ID)/tabs" + '?$filter=DisplayName eq ' + "'" + $tabName + "'") -Headers $Header).value
}
Catch {
    $_.Exception | Out-File $logfile -Append
   }
    # Add the tab if the TAB does not exist in the channel
    if (!$tab) {
        Write-Output "ADD: '$tabName' in [$($team.displayName)\'$ChannelName']"
	try{
        Invoke-RestMethod -Method POST -Uri "https://graph.microsoft.com/v1.0/teams/$($team.ID)/channels/$($channel.ID)/tabs" -Headers $Header -Body $newTabConfig -ContentType application/json
	}
Catch {
    $_.Exception | Out-File $logfile -Append
   }
    }
    # Skip the tab if the TAB already exist in the channel to avoid duplication
    else {
        Write-Output "SKIP: '$tabName' in [$($team.displayName)\'$ChannelName']"
    }
}

    }
$end = [system.datetime]::Now
$resultTime = $end - $start
Write-Host "Execution took : $($resultTime.TotalSeconds) seconds." -ForegroundColor Cyan