# DomainValidationScript
# Description
Script automatically fetch the domains from Tenant,skips the DNS query for the domains conatin .onmicrosoft.com, for domains which do not contain .onmicrosoft.com do a DNS name query resolution for lyncdiscover records and validate if they are pointing to webdir.online.lync.com 

After DNS query If any of the the domain is not pointing to webdir.online.lync.com script displays the Overall status is not Ok messgae on cmd prompt 

#### Prerequisite
[SFB online connector](https://www.microsoft.com/en-us/download/details.aspx?id=39366)
- Import the Module into Windows PowerShell 
- Get the script from the `DomainValidationScript` file and paste it into Windows PowerShell, then run the script

# Example 1
If domain resloving to webdir.online.lync.com 
# Output
Name      Status  ErrorMessage 
xyz        OK     Resolving to webdir.online.lync.com 
# Example 2
If domain resloving to other than webdir.online.lync.com 
# Output
Name      Status  ErrorMessage 
xyz       NOT_OK  Resolving to 52.xxx.12.xx4(IP Address)
# Example 3
If domain is not resolving 
# Output
Name      Status  ErrorMessage 
dinair.msftonlinerepro.com   NOT_OK lyncdiscover.xyz.com : DNS name does not exist
#### Parameters

`-Type`
Specifies the DNS query type that is to be issued. By default the type is A_AAAA, the A and AAAA types will both be queried.

|Type:	|RecordType|
***
|Accepted values:|	UNKNOWN, A_AAAA, A, NS, MD, MF, CNAME, SOA, MB, MG, MR, NULL, WKS, PTR, HINFO, MINFO, MX, TXT, RP, AFSDB, X25, ISDN, RT, AAAA, SRV, DNAME, OPT, DS, RRSIG, NSEC, DNSKEY, DHCID, NSEC3, NSEC3PARAM, ANY, ALL, WINS|
***
|Position:	|1|
|---|---|
|Default value:	|None|
|---|---|
|Accept pipeline input:	|True|
|---|---|
|Accept wildcard characters:	|False|

# Output
Output conatins
skip domains list 
Overall Tenant status - Ok/Not Ok
|Domain Name |Status |ErrorMessage|

![Sample Output](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/DomsinValidation.PNG)
