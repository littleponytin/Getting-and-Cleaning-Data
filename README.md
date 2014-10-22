#Getting-and-Cleaning-Data Assignment Readme file

Source file name: run_analysis.R

Note: This script uses plyr and reshape library functions.

This R script does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, a second, independent tidy data set with the average of each variable for each activity and each subject is created in .txt format.

#Steps to execute the R script:

1. download the data from this URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. Store the data and R script in a folder that looks like this:

* `<test>`
* `<train>`
* activity_labels.txt
* features.txt
* features_info.txt
* README.txt
* run_analysis.R

3. Set working directory in R Studio to where you store the data and R script
 
setwd("~/xxxx/yyy")
 
4. execute the R script
 
source("run_analysis.R")
 
5. the output of the R script is in the same directory with the file name 'labelledActivityAverageData.txt'
