
$cqd_List = Import-Csv "D:\CQD\CQD_Input.csv"


Foreach ($cqd in $cqd_List)
{

Get-CQDData -Dimensions $cqd.Dimensions -Measures $cqd.Measures -OutPutFilePath $cqd.OutPutFilePath -StartDate $cqd.StartDate -EndDate $cqd.EndDate -OutPutType $cqd.OutPutType -MediaType $cqd.MediaType -IsServerPair $cqd.IsServerPair -OverWriteOutput
}