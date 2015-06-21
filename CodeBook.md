# Getting and cleaning data course project

### Description
Information about the variables, data and transformations used in course priject for Getting and Cleaning data course.

### Data Set information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Step 1.
Read into R data frames data contained in files:
+ features.txt
+ activity_labels.txt
+ subject_train.txt
+ x_train.txt
+ y_train.txt
+ subject_test.txt
+ x_test.txt
+ y_test.txt

### Step 2. 
Merge data xtrain and xtest, ytrain and ytest and subtrain and subtest

### Step 3.
Assign proper columnames for merged data frames and for activities

### Step 4.
Find only measures of standard deviation and mean using union and grep.
With this we have logical vector where columns with mean and std have TRUE values.

### Step 5.
From x select only measurements of mean and standard deviation and assign this value to x variable

### Step 6
Merge y with activity names and cbind this with x. Then write first data set into file

### Step 7
Use reshape2 functions to melt and dcast data for second data frame needed.
