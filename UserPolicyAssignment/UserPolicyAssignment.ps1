<#
Import-Module SkypeOnlineConnector
$userCredential = Get-Credential
$sfbSession = New-CsOnlineSession -Credential $userCredential
Import-PSSession $sfbSession
#>
$Input = import-csv "Input.csv"
$UserPricipleNames = $Input.UserPricipleName
$count = $Input.Count
write-host "Running the script for users:" $count

foreach($UserPricipleName in $UserPricipleNames)
{
 

Write-Host "To change the Applied Policy to user" $UserPricipleName


        function Get-Result() {
        write-host           "1- TeamsAppSetupPolicy 
                      2- TeamsMeetingPolicy 
                      3- TeamsCallingPolicy
                      4- TeamsMessagingPolicy 
                      5- BroadcastMeetingPolicy
                      6- TeamsCallParkPolicy
                      7- CallerIdPolicy 
                      8- TeamsEmergencyCallingPolicy 
                      9- TeamsEmergencyCallRoutingPolicy
                      10-VoiceRoutingPolicy 
                      11-TeamsAppPermissionPolicy 
                      12-TeamsDailPlan"
$proceed = Read-host "Please provide number which policy you want to proceed further" 


if ($proceed -eq '1')
{
    Get-CsOnlineUser -Identity "$UserPricipleName" | fl TeamsAppSetupPolicy 
    Get-CSTeamsAppsetuppolicy |fl Identity
    $PolicyName=Read-Host "Please provide the Policy Name"

    Grant-CsTeamsAppSetupPolicy -identity "$UserPricipleName" -PolicyName  "$PolicyName"


}


elseif ($proceed -eq '2')
{
    Get-CsOnlineUser -Identity "$UserPricipleName" | fl TeamsMeetingPolicy 
    Get-CsTeamsMeetingPolicy  |fl Identity  
    Grant-CsTeamsMeetingPolicy -identity "$UserPricipleName" -PolicyName "$PolicyName"
}

elseif ($proceed -eq '3')
{
    Get-CsOnlineUser -Identity "$UserPricipleName" | fl TeamsCallingPolicy
    Get-CsTeamsCallingPolicy  |fl Identity
    $PolicyName= Read-Host "Please provide the Policy Name"
    Grant-CsTeamsCallingPolicy  -identity "$UserPricipleName" -PolicyName  "$PolicyName"
}

elseif ($proceed -eq '4')
{
    Get-CsOnlineUser -Identity "$UserPricipleName" | fl TeamsMessagingPolicy 
    Get-CsTeamsMessagingPolicy |fl Identity
    $PolicyName = Read-Host "Please provide the Policy Name"

    Grant-CsTeamsMessagingPolicy -identity "$UserPricipleName" -PolicyName  "$PolicyName"
}


elseif ($proceed -eq '5')
{
    Get-CsOnlineUser -Identity "$UserPricipleName" | fl BroadcastMeetingPolicy  
    Get-CsBroadcastMeetingPolicy   |fl Identity
    $PolicyName=Read-Host "Please provide the Policy Name"

    Grant-CsBroadcastMeetingPolicy  -identity "$UserPricipleName" -PolicyName  "$PolicyName"
}

elseif ($proceed -eq '6')
{
    Get-CsOnlineUser -Identity "$UserPricipleName" | fl TeamsCallParkPolicy
 
    Get-CsTeamsCallParkPolicy|fl Identity
    $PolicyName=Read-Host "Please provide the Policy Name"

    Grant-CsTeamsCallParkPolicy   -identity "$UserPricipleName" -PolicyName  "$PolicyName"
}

elseif ($proceed -eq '7')
{
    Get-CsOnlineUser -Identity "$UserPricipleName" | fl CallerIdPolicy 
    Get-CsTeamsCallerIdPolicy|fl Identity
    $PolicyName=Read-Host "Please provide the Policy Name"

    Grant-CsTeamsCallerIdPolicy  -identity "$UserPricipleName" -PolicyName  "$PolicyName"
}
elseif ($proceed -eq '8')
{
    Get-CsOnlineUser -Identity "$UserPricipleName" | fl TeamsEmergencyCallingPolicy 
    Get-CsTeamsEmergencyCallingPolicy    |fl Identity
    $PolicyName=Read-Host "Please provide the Policy Name"

    Grant-CsTeamsEmergencyCallingPolicy   -identity "$UserPricipleName" -PolicyName  "$PolicyName"
}
elseif ($proceed -eq '9')
{
    Get-CsOnlineUser -Identity "$UserPricipleName" | fl TeamsEmergencyCallRoutingPolicy  
    Get-CsTeamsEmergencyCallRoutingPolicy    |fl Identity
    $PolicyName=Read-Host "Please provide the Policy Name"

    Grant-CsTeamsEmergencyCallRoutingPolicy -identity "$UserPricipleName" -PolicyName  "$PolicyName"
}
elseif ($proceed -eq '10')
{
    Get-CsOnlineUser -Identity "$UserPricipleName" | fl VoiceRoutingPolicy 
    Get-CsVoiceRoutingPolicy    | fl Identity
    $PolicyName=Read-Host "Please provide the Policy Name"

    Grant-CsVoiceRoutingPolicy -identity "$UserPricipleName" -PolicyName  "$PolicyName"
}
elseif ($proceed -eq '11')
{
    Get-CsOnlineUser -Identity "$UserPricipleName" | fl TeamsAppPermissionPolicy  
    Get-CsTeamsAppPermissionPolicy   |fl Identity
    $PolicyName=Read-Host "Please provide the Policy Name"

    Grant-CsTeamsAppPermissionPolicy   -identity "$UserPricipleName" -PolicyName  "$PolicyName"
}

elseif($proceed -eq '12')
{
    Get-CsOnlineUser -Identity "$UserPricipleName" | FL DialPlan  
    Get-CsDialPlan|fl Identity
    $PolicyName=Read-Host "Please provide the Policy Name"

    Grant-CsDialPlan -Identity "$UserPricipleName" -PolicyName  "$PolicyName"
}                   
          
}

do
{

$ProceedNext = Read-host "Do you want to apply any policy Y to continue"
if ($ProceedNext -eq "Y" ) 
        { 
        Get-Result 
        } 
        else 
        { 
        break 
        } 
    }
    while($true); 
    }
        