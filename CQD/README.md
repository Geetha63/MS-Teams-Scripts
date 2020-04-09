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



