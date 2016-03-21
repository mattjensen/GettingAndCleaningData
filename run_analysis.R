# Step 1. "Merges the training and the test sets to create one data set."

# NOTE: Change this to directory where HAR data has been unzipped.
setwd("c:\\Coursera\\data\\UCI HAR Dataset")

# Read tables of data
activity_label = read.table('./activity_labels.txt', header=FALSE);
features = read.table('./features.txt', header=FALSE);
subject_train = read.table('./train/subject_train.txt', header=FALSE);
x_train = read.table('./train/x_train.txt', header=FALSE);
y_train = read.table('./train/y_train.txt', header=FALSE);

colnames(activity_label) = c('activityId', 'activity_label');
colnames(subject_train) = "subjectId";
colnames(x_train) = features[,2]; 
colnames(y_train) = "activityId";

# Combine all training data
all_training_data = cbind(y_train, subject_train, x_train);

# Load testing data
subject_test = read.table('./test/subject_test.txt', header=FALSE); 
x_test = read.table('./test/x_test.txt', header=FALSE); 
y_test = read.table('./test/y_test.txt', header=FALSE); 

colnames(subject_test) = "subjectId";
colnames(x_test) = features[, 2]; # Get the description column
colnames(y_test) = "activityId";

# Combine all testing data
all_testing_data = cbind(y_test, subject_test, x_test);

# Combine testing and training data
final_testing_and_training_data = rbind(all_training_data, all_testing_data);
final_column_names  = colnames(final_testing_and_training_data); 

# Step 2. "Extracts only the measurements on the mean and standard deviation for each measurement."

# Look for std, or mean, or the IDs
logicalVector = (grepl("mean\\(\\)|std\\(\\)|subject..|activity..",final_column_names));
final_testing_and_training_data = final_testing_and_training_data[logicalVector==TRUE];

# Step 3. "Use descriptive activity names to name the activities in the data set."

final_testing_and_training_data = merge(final_testing_and_training_data, activity_label, by="activityId", all.x=TRUE);
final_column_names  = colnames(final_testing_and_training_data); 

# Step 4. "Appropriately labels the data set with descriptive variable names." 

final_column_names <- gsub("[Aa]cc","Accel",final_column_names)
final_column_names <- gsub("[Bb]ody","Body",final_column_names)
final_column_names <- gsub("BodyBody","Body",final_column_names)
final_column_names <- gsub("BodyBody","Body",final_column_names) # This removes stray cases. Should replace with a smarter regex.
final_column_names <- gsub("^(f)","freq",final_column_names)
final_column_names <- gsub("[Gg]yro","Gyro",final_column_names)
final_column_names <- gsub("([Gg]ravity)","Gravity",final_column_names)
final_column_names <- gsub("[Mm]ag","Magnitude",final_column_names);
final_column_names <- gsub("-mean","Mean",final_column_names)
final_column_names <- gsub("-std","StdDev",final_column_names)
final_column_names <- gsub("^(t)","time",final_column_names)
# Remove parens at end of names
final_column_names <- gsub("\\()","",final_column_names)

colnames(final_testing_and_training_data) = final_column_names;

# Step 5. "From the data set in step 4, creates a second, independent tidy data set 
#          with the average of each variable for each activity and each subject."

final_testing_and_training_dataNoactivity_label  = final_testing_and_training_data[,names(final_testing_and_training_data) != 'activity_label'];
match_activity_and_subject = list(activityId=final_testing_and_training_dataNoactivity_label$activityId,subjectId = final_testing_and_training_dataNoactivity_label$subjectId);
tidy_output_data = aggregate(final_testing_and_training_dataNoactivity_label[,names(final_testing_and_training_dataNoactivity_label) != c('activityId','subjectId')],by=match_activity_and_subject,mean);
tidy_output_data = merge(tidy_output_data, activity_label, by='activityId', all.x=TRUE);   # merge in our activity names

# Move activity label up to the front of the columns
col_idx <- grep("activity_label", names(tidy_output_data))
tidy_output_data <- tidy_output_data[, c(col_idx, (1:ncol(tidy_output_data))[-col_idx])]

# Export the tidyData set 
write.table(tidy_output_data, './tidy_output_data.txt', row.names=TRUE,sep='\t')
