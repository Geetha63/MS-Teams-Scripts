# CQDReport

# Description

Script will provide total stream count including Audio,video,Appsharing for provided start time and end time, CQD Report of Given time

Powershell should be more than 3.0 version

# Example

##### Example 1 for Total Steram count including Audio,video,Appsharing

![Example](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/CQD-Example.png)

##### Example 2 for CQD Report of Given time

Start Date: 1/10/2020

End Date : 1/11/2020

 # Parameters
 
 `-Date`
 
 Type : String 
 
 # Inputs
 
  Provide input 1 to get Total Steram count including Audio,video,Appsharing
  
   Start Date – “Please Provide Start Date
   
   End Date – “Please Provide End date
  
  Provide input 2 to get the CQD Report of Given time
  
  Give the input file as shown below. Keep this file in current location(Input.csv). Script will collect the data from `input.csv` file and capture the data from call quality     dashboard

 |Dimensions  |	Measures| OutPutFilePath |	StartDate| EndDate | OutPutType	| MediaType	| IsServerPair |
 |------------|---------|----------------|-----------|---------|------------|-----------|--------------|

 Each row data will be collected and executed through script accordingly
  
 To construct the input.csv file refer [dimensions-and-measures-available-in-call-quality-dashboard](https://docs.microsoft.com/en-us/microsoftteams/dimensions-and-measures-available-in-call-quality-dashboard)
 
 # Procedure
 
Powershell should be more than 3.0 version

Run the script

Once you run the script it will prompt for option 1 or 2\

If you have choosen the **option 1** please provide the parameters 

Start Date – “Please Provide Start Date” \
End Date – “Please Provide End date” \
Press enter to continue \

Or if you have choosen the **option 2** please provide the `Input.csv` file 

Now script open popup to connect the CQDDATA 

![Signin](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/CQD-Signin.png)

Provide the Teams Admin credentials

# Output

For option 1 

##### Example output

Script will execute and creates `cqdoutput.csv` file
![SampleOutput](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/CQD-SampleOutput.png)

For option 2

##### Example outpot

![Output](https://github.com/Geetha63/MS-Teams-Scripts/blob/master/Images/CQD-output.png)


