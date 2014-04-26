Tidy dataset creation script
============================

###Instructions:
1. Download the Samsung data set from [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Create a working directory and setwd() to it.
3. Copy the run_analysis.R and the UCI HAR zip file to this directory.
4. Unzip the data zipfile to create a subdirectory. The subdirectory names as UCI HAR Dataset.
5. Run the run_analysis.R file to create output.


###Explanation of the run_analysis.R
The run_analsysis.R script will do the following steps and create an output called tidydata.txt.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##Explanation of tidydata.txt
The data are a collect of accelerometer readings from 30 test subjects. Each test subject performed 6 different activities and the accelerometer readings along the X, Y and Z axis were taken.  Various readings were taken multiple times. 

The dataset is broken into 81 columns. 
* Column 1 is the subject token.
* Column 2 is the activity monitored.
* Columns 3 to 81 are the means of the different measurements. 

How to read a measurement column heading.
* The first part up to the hyphen is the reading being taken.
* The second part after the hyphen is either mean() or std() for mean reading and standard deviation respectively.
* The last part after the second hyphen is either an X,Y, or Z to identify the axis of the reading.



