#Keep tenant id, client id, client secret in info.json file run the script 
#this script will take the input from current folder and create output in current folder  (keep the info.json file in same folder where you are running the script)
#this script will take the input as objectid

#creating token id
$input = get-content info.json | ConvertFrom-Json
$Client_Secret = $input.Client_Secret
$client_Id = $input.client_Id
$Tenantid = $input.Tenantid

#connect to teams
Connect-MicrosoftTeams

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

    $uri = "https://graph.microsoft.com/v1.0/users"
    $group = Invoke-RestMethod -Headers $Header -Uri $uri  -Method Get

    

    do
    { 
        foreach($value in $group.value)
       { 
       $Token1 = Invoke-RestMethod -Uri "$loginurl" -Method POST -Body $ReqTokenBody -ContentType "application/x-www-form-urlencoded"

    $Header1 = @{
        Authorization = "$($token1.token_type) $($token1.access_token)"
    }

    $id = $value.id
    $UPN = $value.userPrincipalName

    #Check if user is assigned any license
        $licenseuri = "https://graph.microsoft.com/v1.0/users/" + "$id" + "/licenseDetails"
        $licenseresult = Invoke-RestMethod -Headers $Header1 -Uri $licenseuri  -Method Get
        $licensevalue = $licenseresult.value
        $skuids = $licensevalue.skuId
        $licenses = $licensevalue.skuPartNumber
        $serviceplan = $licensevalue.servicePlans
        $TeamslicenseStatus = $serviceplan | where {($_.servicePlanName -eq 'Teams1')}

        $provisioningStatus = $TeamslicenseStatus.provisioningStatus
        #$fulllicense = [string]::Join(", ",$license)
        
        $useruri = "https://graph.microsoft.com/v1.0/users/" + $id
        $userresult = Invoke-RestMethod -Headers $Header1 -Uri $useruri  -Method Get
        #foreach($license in $licenses){

        
         if($licenses -contains "M365EDU_A5_FACULTY")
         {
         Grant-CsUserPolicyPackage -Identity $UPN -PackageName "Education_Teacher"
         write-host " Education_Teacher policy has been assigned to user" $UPN
         }
         elseif($licenses -contains "M365EDU_A5_STUDENT")
         {
         Grant-CsUserPolicyPackage -Identity $UPN -PackageName "Education_SecondaryStudent"
         write-host " Education_SecondaryStudent policy has been assigned to user" $UPN
         }

         else{

         Write-Host "User have the diffrent license" $UPN
            $file = New-Object psobject
            $file | add-member -MemberType NoteProperty -Name UserName $UPN
            $file | add-member -MemberType NoteProperty -Name Userid $id
            $file | export-csv license.csv -NoTypeInformation -Append


         }
                        
                              
        
        }
        #}
 
if ($group.'@odata.nextLink' -eq $null ) 
        { 
        break 
        } 
        else 
        {
        $Token2 = Invoke-RestMethod -Uri "$loginurl" -Method POST -Body $ReqTokenBody -ContentType "application/x-www-form-urlencoded"

    $Header2 = @{
        Authorization = "$($token2.token_type) $($token2.access_token)"
    }
     
        $group = Invoke-RestMethod -Headers $Header2 -Uri $group.'@odata.nextLink' -Method Get 
        } 
        }while($true); 
        }

 else 
{
    write-host "You need to login admin consent in order to continue... " 
}