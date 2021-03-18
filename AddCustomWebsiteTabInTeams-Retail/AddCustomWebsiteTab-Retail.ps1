$Tenantid= '5a962d0c-c0c6-4304-b671-93bd57ea2711'
$client_Id = 'c7504706-787a-469f-a706-fbbebecb2ab0'
$Client_Secret = 'H-Pr5oR5VVEUe.-xxRc.snbd64xdh9_v_5'

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

$uri = ('https://graph.microsoft.com/v1.0/groups?$select=id,displayname,resourceProvisioningOptions')
$ALLteams = (Invoke-RestMethod -Method Get -Uri $uri -Headers  $Header).Value | Where-Object {$_.resourceProvisioningOptions -contains 'Team'}

$teams = (Invoke-RestMethod -Method Get -Uri $uri -Headers  $Header).Value | Where-Object {$_.DisplayName -match 'Test'}

# Loop through all teams
foreach ($team in $teams) {
    # Get the General Channel properties
    $channel = (Invoke-RestMethod -Method Get -Uri ("https://graph.microsoft.com/v1.0/teams/$($team.ID)/channels" + '?$filter=DisplayName eq ' + "'General'") -Headers $Header).Value

    # Check if the tab with the same value as the $tabName aleady exists
    $tab = (Invoke-RestMethod -Method Get -Uri ("https://graph.microsoft.com/v1.0/teams/$($team.ID)/channels/$($channel.ID)/tabs" + '?$filter=DisplayName eq ' + "'" + $tabName + "'") -Headers $Header).value

    # Add the tab if the TAB does not exist in the General channel
    if (!$tab) {
        Write-Output "ADD: '$tabName' in [$($team.displayName)\General]"
        Invoke-RestMethod -Method POST -Uri "https://graph.microsoft.com/v1.0/teams/$($team.ID)/channels/$($channel.ID)/tabs" -Headers $Header -Body $newTabConfig -ContentType application/json
    }
    # Skip the tab if the TAB already exist in the General channel to avoid duplication
    else {
        Write-Output "SKIP: '$tabName' in [$($team.displayName)\General]"
    }
}

    }