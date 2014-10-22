#Getting-and-Cleaning-Data Assignment Readme file

Source file name: run_analysis.R

This R script does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The data and R script should be stored in a directory that looks like this:
* `<test>`
* `<train>`
* activity_labels.txt
* features.txt
* features_info.txt
* README.txt
* run_analysis.R

Steps to execute the R script:

1. Set working directory to where you store the data and R script
 setwd("~/xxxx/yyy")

2. execute the R script
 source("run_analysis.R")
