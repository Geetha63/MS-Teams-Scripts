$logfile = "C:\DomainValidationlog_$(get-date -format `"yyyyMMdd_hhmmsstt`").txt"
$start = [system.datetime]::Now

 if(Get-Module -ListAvailable -Name SkypeOnlineConnector) 
 { 
 Write-Host "SkypeOnlineConnector Already Installed" 
 } 
 else { 
 try {
 Write-Host "Installing  SkypeOnlineConnector"
 Install-Module -Name SkypeOnlineConnector
 }
 catch{
        $_.Exception.Message | out-file -Filepath $logfile -append
 }
 }
Import-Module SkypeOnlineConnector
$sfbSession = New-CsOnlineSession 
Import-PSSession $sfbSession -AllowClobber

$Namelist=(Get-CsOnlineSipDomain -DomainStatus Enabled)
$FinalResult = @()
foreach ($Name in $NameList) 
{
if($Name.Name -match "onmicrosoft.com")
{
Write-Host "Skipping"$Name.Name"since domain contain .onmicrosoft.com" -ForegroundColor Cyan
}
else{
$RecordName="lyncdiscover."+$Name.Name 
$tempObj = "" | Select-Object Name,Status,ErrorMessage
try {        
if($dnsRecord = Resolve-DnsName $RecordName -ErrorAction Stop | Where-Object {$_.Type -eq 'A'}|Where-Object {$_.Name -eq 'webdir.online.lync.com'})
 {
$tempObj.Name = $Name.Name        
$tempObj.Status = 'OK'       
$tempObj.ErrorMessage = "Resolving to " + $dnsRecord.Name  
  }
  elseif($dnsRecord = Resolve-DnsName $RecordName -ErrorAction Stop | Where-Object {$_.Type -eq 'A'}|Where-Object {$_.Name -ne 'webdir.online.lync.com'}
)
{
  $tempObj.Name = $Name.Name        
  $tempObj.Status = 'NOT_OK'       
  $tempObj.ErrorMessage = "Resolving to " + $dnsRecord.IPAddress
}
else{
}
  }
catch {        
$tempObj.Name = $Name.Name       
$tempObj.Status = 'NOT_OK'        
$tempObj.ErrorMessage = $_.Exception.Message
  }
  $FinalResult += $tempObj
    }
    }
    if($FinalResult.status -ccontains 'NOT_OK')
    {
    Write-Host "Overall status not Ok" -BackgroundColor DarkRed
    }
     else{
     Write-Host "Overall status Ok" -BackgroundColor DarkGreen
     }
$end = [system.datetime]::Now
$resultTime = $end - $start
Write-Host "Execution took : $($resultTime.TotalSeconds) seconds." -ForegroundColor Cyan
return $FinalResult|ft
