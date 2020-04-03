# This script copies user from the tenant and the applications installed for those users in Teams into csv file.
# Keep tenant id in info.json file


#creating token id
$input = get-content info.json | ConvertFrom-Json
$Client_Secret = $input.Client_Secret
$client_Id = $input.client_Id
$Tenantid = $input.Tenantid

#Grant Adminconsent 
$Grant= 'https://login.microsoftonline.com/common/adminconsent?client_id='
$admin = '&state=12345&redirect_uri=https://localhost:1234'
$Grantadmin = $Grant + $client_Id + $admin

start $Grantadmin
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

    #getting users
    write-host "Getting Tenant users"
    $getusers = "https://graph.microsoft.com/v1.0/users" 
    $users = Invoke-RestMethod -Headers $Header -Uri $getusers -Method get -ContentType 'application/json'
    $userdetails = $users.value
 
    $userdetails | Export-csv -path file.csv -Append -NoTypeInformation
    $userdisplayname = $userdetails.displayName
    $useruserPrincipalName = $userdetails.userPrincipalName
    $userid = $userdetails.id


    #getting installed apps
    write-host "installed apps for Tenant users"
    $results = foreach($id in $userid)
        {
            $userapps = "https://graph.microsoft.com/beta/users/"+ "$id" +"/teamwork/installedApps?expand=teamsAppDefinition"
            $usersap = Invoke-RestMethod -Headers $Header -Uri $userapps -Method get -ContentType 'application/json'

            $values = $usersap.value 
            $a = $values.teamsAppDefinition
            $Apps = $a | select displayName
            $InstalledApps = [string]::Join("; ",$Apps.displayName) 

            $id
            $InstalledApps

            $file = New-Object psobject
            $file | add-member -MemberType NoteProperty -Name id $id
            $file | add-member -MemberType NoteProperty -Name InstalledApps $InstalledApps
            $file | export-csv file1.csv -NoTypeInformation -Append
        }

     $userdata = Import-CSV -Path file.csv
     $Appdata = import-csv -path file1.csv
 
    $matchcounter = 0

        foreach ($order1 in $Appdata)
        {
            $matched = $false
            foreach ($order2 in $userdata)
            {
                 $obj = "" | select "ID","DisplayName","UserPrincipalName","InstalledApps"
                if($order1.'id' -eq $order2.'id' )
                {
                    $matchCounter++
                    $matched = $true
                    $obj.'ID' = $order1. 'id'
                    $obj.'DisplayName' = $order2.'displayName'
                    $obj.'UserPrincipalName' = $order2.'userPrincipalName'
                    $obj.'InstalledApps' = $order1.'InstalledApps'
            
                                   
                    Write-Host "Match Found Orders " "$matchCounter"
                    $obj | Export-Csv -Path Apps.csv -Append -NoTypeInformation
                }
            }
        }

}
else 
{
    write-host "You need to login admin consent in order to continue... " 
}