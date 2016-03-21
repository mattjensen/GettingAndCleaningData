# Codebook for UCI HAR Dataset

## Original Data Files

The data files for this project are stored at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip .

The original data, and descriptions thereof, can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones .
The files of interest to us here are: 
* activity_labels.txt - The textual labels (e.g., "WALKING"), and the activityID they map to.
* features.txt - The labels for the 561 features describing particular physical properties measured by the smartphones.
* subject_train.txt - A list of subjectIDs used in training data
* x_train.txt - A first group of training data
* y_train.txt - A second group of training data
* subject_test.txt - A list of subjectIDs used in testing data
* x_test.txt - A first group of testing data
* y_test.txt - A second group of testing data

This includes ~64 MB of training data, and ~20MB of testing data. The point of this exercise is to summarize the data across activity type for each of the 30 subjects.


## Summary of Original Data

The study involed 30 volunteers, each within an age range of 19-48 years. A Samsung smartphone was worn while doing one of six activities:
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING. The smartphone recorded acclerometer and gyroscope data in three axes. There were a total of 561 features.

### Original Codebook Comments (from UCI.edu site)
***
<i>"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.</i> 

<i>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.</i>

<i>For each record in the dataset it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment."</i>
(End of original codebook comments)

***

## Assumptions

The code assumes you have unzipped the data files to "c:\\Coursera\\data\\UCI HAR Dataset".

## Transformations

* Merge the activity labels (e.g., "WALKING") in with the experimental data.
* Extract just the mean and standard deviation for each measurement.
* Clean and standardize the names of the measurements. My cleanings were, in alphabetical order:
 + acc -> Accel
 + body -> Body
 + f -> freq
 + gyro -> Gyro
 + gravity -> Gravity
 + mag -> Magnitude
 + mean -> Mean
 + std -> StdDev
 + t -> time
 In addition, I removed unneeded punctuation, such as "-" and "()".
* Combine the training data and testing data, based on subjectID.
* Summarize the data, aggregating by subjectID and activityID.

