#Data Codebook for Getting and Cleaning Data Assignment
This document describes the input and output data for run_analysis.R.

#Source Data

The input data is from "Human Activity Recognition Using Smartphones Data Set" which represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The data is available for download from the UCI Machine Learning Repository:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#Data Processing

1. The training data (subject_train.txt, X-train.txt and Y_train.txt) and test data (subject_test.txt, X-test.txt and Y_test.txt) are merged to a single data set.

2. The raw inertial signal data was not used (i.e. all data in ./data/test/Inertial Signals and ./data/train/Inertial Signals folders).

3. Meaningful activities names are merged to the data set instead of using activity ID.

4. Appropriate labels are given to the variable names.

#Output Data

1. Only mean and standard deviation columns are retained. The rest of the columns are discarded.

2. The average of each variable for each activity and each participant is computed.

3. The output data set is output in a text file. It contains one row for each unique combination of participant and activity.
