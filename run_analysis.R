## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Download the data
zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Datset.zip"

if(!file.exists(zipFile)) {
  download.file(zipURL, zipFile, mode = "wb")
}

path <- "UCI HAR Dataset"
unzip(zipFile)

# Read activity files
testActivities <- fread(file.path(path, "test", "Y_test.txt"), header = FALSE)
trainActivities <- fread(file.path(path, "train", "Y_train.txt"), header = FALSE)

# Read subject files
testSubjects <- fread(file.path(path, "test", "subject_test.txt"), header = FALSE)
trainSubjects <- fread(file.path(path, "train", "subject_train.txt"), header = FALSE)

# Read features files
testFeatures <- fread(file.path(path, "test", "X_test.txt"), header = FALSE)
trainFeatures <- fread(file.path(path, "train", "X_train.txt"), header = FALSE)

# Look at the properties of the variables
str(testActivities)
str(trainActivities)
str(testSubjects)
str(trainSubjects)
str(testFeatures)
str(trainFeatures)

## Merge the training and the test data sets to create one date set
# Concatenate data tables by rows
subjects <- rbind(trainSubjects, testSubjects)
activities <- rbind(trainActivities, testActivities)
features <- rbind(trainFeatures, testFeatures)

# Set names
names(subjects) <- c("Subject")
names(activities) <- c("Activity")
featuresNames <- fread(file.path(path, "features.txt"), head = FALSE)
names(features) <- featuresNames$V2

# Merge data
mergeData <- cbind(subjects, activities)
Data <- cbind(features, mergeData)

## Extract only the measurements on the mean and standard deviation for each measurement
subfeaturesNames <- featuresNames$V2[grep("mean\\(\\)|std\\(\\)", featuresNames$V2)]

names <- c(as.character(subfeaturesNames), "Subject", "Activity")
Data <- subset(Data, select = names)

str(Data)

##Use descriptive activity names to name the activities in the dataset
activityLabels <- fread(file.path(path, "activity_labels.txt"), header = FALSE)

# Check
head(Data$Activity, 30)

## Appropraitely labels the data set with descriptive variable names
names(Data) <- gsub("^t", "time", names(Data))
names(Data) <- gsub("^f", "frequency", names(Data))
names(Data) <- gsub("Acc", "Accelerometer", names(Data))
names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
names(Data) <- gsub("Mag", "Magnitude", names(Data))
names(Data) <- gsub("BodyBody", "Body", names(Data))

# Check
names(Data)

## Creates a second, independent tidy data set with the average of each variable for each activity and each subject
library(plyr)
DataMean <- aggregate(. ~Subject + Activity, Data, mean)
DataMean <- DataMean[order(DataMean$Subject, DataMean$Activity),]
write.table(DataMean, file = "tidydata.txt", row.name = FALSE)
