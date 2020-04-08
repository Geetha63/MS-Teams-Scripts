#Keep tenant id, client id, client secret in info.json file run the script 
#this script will take the input from current folder and create output in current folder  (keep the info.json file in same folder where you are running the script)

#creating token id
$input = get-content info.json | ConvertFrom-Json
$Client_Secret = $input.Client_Secret
$client_Id = $input.client_Id
$Tenantid = $input.Tenantid

#Grant Adminconsent 
$Grant= 'https://login.microsoftonline.com/common/adminconsent?client_id='
$admin = '&state=12345&redirect_uri=https://localhost:1234'
$Grantadmin = $Grant + $client_Id + $admin
Connect-MsolService

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
    $id = $value.id
    $UPN = $value.userPrincipalName

    #Check if user is assigned any license
        $licenseuri = "https://graph.microsoft.com/v1.0/users/" + "$id" + "/licenseDetails"
        $licenseresult = Invoke-RestMethod -Headers $Header -Uri $licenseuri  -Method Get
        $licensevalue = $licenseresult.value
        $skuids = $licensevalue.skuId
        $licenses = $licensevalue.skuPartNumber
        $serviceplan = $licensevalue.servicePlans
        $TeamslicenseStatus = $serviceplan | where {($_.servicePlanName -eq 'Teams1')}

        $provisioningStatus = $TeamslicenseStatus.provisioningStatus
        #$fulllicense = [string]::Join(", ",$license)
        
        $useruri = "https://graph.microsoft.com/v1.0/users/" + $id
        $userresult = Invoke-RestMethod -Headers $Header -Uri $useruri  -Method Get

        if((!$licensevalue) -or (!$TeamslicenseStatus)){
                            write-host "user dont have license" 
                            $file = New-Object psobject
                            $file | add-member -MemberType NoteProperty -Name userid $id
                            $file | add-member -MemberType NoteProperty -Name UserName $userresult.displayname
                            $file | add-member -MemberType NoteProperty -Name Status "No"
                            $file | export-csv Nolicense.csv -NoTypeInformation -Append

                              }

                elseif($provisioningStatus -eq 'Success')
                         { write-host "This user having valid Teams license-" $value.userPrincipalName
                                $MSlicense = "Enable"
                         }   
                          else{
                                
                                $a = Get-MsolUser -UserPrincipalName $UPN | select -ExpandProperty licenses
                                $b = $a.AccountSkuId


                                foreach($x in $b){
                                #$license_service_plans = New-MsolLicenseOptions -AccountSkuId "M365EDU032767:M365EDU_A5_FACULTY"
                                $license_service_plans = New-MsolLicenseOptions -AccountSkuId "$x"
                                Set-MsolUserLicense -UserPrincipalName "$UPN" -LicenseOptions $license_service_plans
                                write-host "MicrosoftTeams licence has been enabled for user" $UPN
                                }
                          
                         
                             
                              }
        
        }
 
if ($group.'@odata.nextLink' -eq $null ) 
        { 
        break 
        } 
        else 
        { 
        $group = Invoke-RestMethod -Headers $Header -Uri $group.'@odata.nextLink' -Method Get 
        } 
        }while($true); 
        }

 else 
{
    write-host "You need to login admin consent in order to continue... " 
}