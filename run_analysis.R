####################################################################################
#Getting and Cleaning Data Assignment
#
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
####################################################################################

#1. Merges the training and the test sets to create one data set.
#set training data working directory first (assume data is in same directory)

#read in TRAINING source text data
features = read.table('./features.txt',header=FALSE);
activityLabel = read.table('./activity_labels.txt',header=FALSE); 
subjectTrain = read.table('./train/subject_train.txt',header=FALSE); 
xTrain = read.table('./train/x_train.txt',header=FALSE); 
yTrain = read.table('./train/y_train.txt',header=FALSE); 

# Give column names to the train data
colnames(activityLabel)  = c('activityID','activityName');
colnames(subjectTrain)  = "subjectID";
colnames(xTrain)        = features[,2]; 
colnames(yTrain)        = "activityID";

# Create the training data set first
trainData = cbind(yTrain,subjectTrain,xTrain);

#read in TESTING source text data

#set test data working directory first

subjectTest = read.table('./test/subject_test.txt',header=FALSE); 
xTest = read.table('./test/x_test.txt',header=FALSE); 
yTest= read.table('./test/y_test.txt',header=FALSE); 

# Give column names to the test data
colnames(subjectTest)  = "subjectID";
colnames(xTest)        = features[,2]; 
colnames(yTest)        = "activityID";

# Create the training data set first
testData = cbind(yTest,subjectTest,xTest);

#create merged set from training and testing data
mergedData = rbind(trainData,testData);

#####################################################################
#2. Extracts only the measurements on the mean and standard deviation for each measurement.

colNames = colnames(mergedData);

#get meansurements columns for mean and std Dev columns
meanStdCol <- grepl("mean|std|subjectID|activityID", colNames)

#get mean and std deviation measurements
meanStdData <- mergedData[,meanStdCol]

#####################################################################
#3. Uses descriptive activity names to name the activities in the data set
library(plyr)
labelledActivityData <- join(meanStdData, activityLabel, by="activityID")

#####################################################################
#4. Appropriately labels the data set with descriptive variable names.

# Remove parentheses
names(labelledActivityData) <- gsub("\\()","",names(labelledActivityData))

# Rename the abbreviation
names(labelledActivityData) <- gsub('Freq\\.',"Frequency.",names(labelledActivityData))
names(labelledActivityData) <- gsub('Freq$',"Frequency",names(labelledActivityData))
names(labelledActivityData) <- gsub('Acc',"Acceleration",names(labelledActivityData))
names(labelledActivityData) <- gsub('GyroJerk',"LinearAcceleration",names(labelledActivityData))
names(labelledActivityData) <- gsub('Gyro',"AngularVelocity",names(labelledActivityData))
names(labelledActivityData) <- gsub('Mag',"Magnitude",names(labelledActivityData))
names(labelledActivityData) <- gsub('^t',"TimeDomainSig.",names(labelledActivityData))
names(labelledActivityData) <- gsub('^f',"FrequencyDomainSig.",names(labelledActivityData))
names(labelledActivityData) <- gsub('\\.mean',".Mean",names(labelledActivityData))
names(labelledActivityData) <- gsub('\\.std',".StandardDeviation",names(labelledActivityData))

#drop activityID column
labelledActivityData$activityID <- NULL

#####################################################################
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#compute average by activity and subject
library(reshape)
mlabelledActivityData <- melt(labelledActivityData, id=c("subjectID","activityName"))

labelledActivityAverageData <- cast(mlabelledActivityData, subjectID + activityName~variable, mean)


#create the results in text file
write.table(labelledActivityAverageData, './labelledActivityAverageData2.txt',row.names=FALSE);
#write.tablefile="labelledActivityAverageData.csv", x=labelledActivityAverageData)