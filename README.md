---
title: "README.md"
author: "Matt Jensen"
date: "March 16, 2016"
output: html_document
---

# Getting and Cleaning Data - Course Project

## Overview

This project takes the UCI HAR dataset and transforms it.  I assume you have unzipped the file at "C:/Coursera/data". 
The zipped data is located at "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".

## Requirements
1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step d, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Script

The run_analysis.r script loads in and merges the training files, and the testing files, to create one data set. The labels of activity are used to put tidy descriptors in the final data set. The mean and standard deviation for each measurement are output to the local text file, final_tidy_data.txt (which has been uploaded to Coursera).

## Details

See the file Codebook.md for details about the variables and their transformations.


