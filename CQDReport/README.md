#### Description:

This script will provide CQD data output using given input parameters.

##### CQD_Input.csv:

Give the input file as shown below. Keep this file in current location(Input.csv). Script will collect the data from `input.csv` file and capture the data from call quality dashboard

 |Dimensions  |	Measures| OutPutFilePath |	StartDate| EndDate | OutPutType	| MediaType	| IsServerPair |
 |------------|---------|----------------|-----------|---------|------------|-----------|--------------|


 Each row data will be collected and executed through script accordingly.

 Ex:

 ![Example](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/CQD-Example.png)

 ##### CQDDimensions.txt

 Choose the dimensions from this document for your requirement

 ##### CQDMeasures.txt

 Choose the Measures from this document for your requirement

 ##### CQD.ps1

 This executable Script File

 Edit the CQD.ps1 file and keep the CQD_Input.csv file location then run the script.

 Output:

 ![Output](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/CQD-output.png)



#### Description:

This script will capture the total Stream count, Audio, Video, Video based screen share, AppSharing counts for given StartDate and EndDate.

##### Prerequisites:

Powershell should be more than 3.0 version

Run the script

Once you run the script it will prompt for \
Start Date – “Please Provide Start Date” \
End Date – “Please Provide End date” \
Press enter to continue \
Now script open popup to connect the CQDDATA 

![Signin](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/CQD-Signin.png)

Provide the Teams Admin credentials. Script will execute and creates `cqdoutput.csv` file

Sample Output:

![SampleOutput](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/CQD-SampleOutput.png)

