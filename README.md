---
title: "README.md"
author: "Koveshini Pillay"
output: "github_document"
---

# Getting-Cleaning-Data-Week-4-Project

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Purpose of the Project

To demonstrate your ability to collect, work with and clean a data set. 

## Goal of Project

1. A tidy data set.
2. A link to a Github repository with your script for performing the analysis.
3. A code book called CodeBook.md that describes the variables, the data, and any transformations or work that you performed to clean up the data. 
4. A README.md in the repo with your scripts. this repo explains how all of the scripts work and how they are connected.  

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within the age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer.
- Triaxial angular velocity from the gyroscope.
- Its activity label.
- The subject who carried the out the experiment.

## The following files are available for the train and test data. Their descriptions are equivalent.

'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Created R script called run_analysis.R that meets the following requirements 

1. Merges the training and the test sets to create one data set.
Source code "run_analysis.R" loads both test and train data, processes them, and merges the results into one dataset.

2. Extracts only the measurements on the mean and standard deviation for each measurement.
Source code "run_analysis.R" extracts the mean and standard deviation data into one dataset with appropriate column names.

3. Uses descriptive activity names to name the activities in the data set.
Source code "run_analysis.R" loads the descriptive feature and activity labels.

4. Appropriately labels the data set with descriptive variable names
Source code "run_analysis.R" adds appropriately descriptive variable names to the large dataset columns (variables).

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
Source code "run_analysis.R" calculates the average for all measurement columns grouped by variables Activity and Subject and then writes the output to a local text file named "tidydata.txt"
