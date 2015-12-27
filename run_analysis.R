# ****************************************
# Coursera - Getting and Cleaning Data - Course Project
# Student Name: Edwin Sillence
# ****************************************

# Step 1. Merge the training and test data sets

library(data.table)

train_all <- cbind(fread("subject_train.txt"),
                   fread("y_train.txt"),
                   fread("X_train.txt"))

test_all <- cbind(fread("subject_test.txt"),
                   fread("y_test.txt"),
                   fread("X_test.txt"))

data <- rbind(train_all,test_all)

featurelables <- as.data.frame(fread("features.txt"))[,2]
names(data) <- c("Subject", "Activity", featurelables)

# Step 2. Extract the mean and standard deviation for each measurement

library(dplyr)

data_subset <- select(data, c(1,
                               2,
                               contains("-mean()", ignore.case = TRUE),
                               contains("-std()", ignore.case = TRUE)))

# Step 3. Apply descriptive activity names (to rows)
# NB: During a refactor, this step could be redone using chaining

activitylables <- fread("activity_labels.txt", col.names = c("Activity","Activity_Name"))

data_subset <- select(left_join(data_subset, activitylables, by = "Activity"),-Activity)
data_subset <- cbind(select(data_subset,Activity_Name), select(data_subset,-Activity_Name))
data_subset <- rename(data_subset, Activity = Activity_Name)
data_subset <- arrange(data_subset, Activity, Subject)

# Step 4. Label the data set with descriptive variable names

# NOTES ON NAMING

# There are three steps to renaming: applying an applicable R-standard,
# applying Tidy Data naming standards, and making the names more
# readable for non-experts. See the following for more detail.

# R Standards: I have used underscore separation, as per
# http://www.r-bloggers.com/consistent-naming-conventions-in-r/

# Tidy Data Standards: I will not apply these till Step 5 below,
# where I make the data 'narrow' (such that the feature column names
# become data values).

# Make names understandable to non-domain expert by expanding abbreviations:

names(data_subset) <- gsub("^t", "time_domain_", names(data_subset))
names(data_subset) <- gsub("^f", "frequency_domain_", names(data_subset))

names(data_subset) <- gsub("Body", "body_", names(data_subset))
names(data_subset) <- gsub("Gravity", "gravity_", names(data_subset))

names(data_subset) <- gsub("Acc", "acceleration_", names(data_subset))
names(data_subset) <- gsub("Gyro", "gyroscope_", names(data_subset))

names(data_subset) <- gsub("Jerk", "jerk_", names(data_subset))
names(data_subset) <- gsub("Mag", "magnitude_", names(data_subset))

names(data_subset) <- gsub("-mean\\(\\)", "mean", names(data_subset))
names(data_subset) <- gsub("-std\\(\\)", "standard_deviation", names(data_subset))

names(data_subset) <- gsub("-X$", "_x", names(data_subset))
names(data_subset) <- gsub("-Y$", "_y", names(data_subset))
names(data_subset) <- gsub("-Z$", "_z", names(data_subset))

# Step 5. Using the data from step 4 (data_subset), create a second,
#       independent tidy data set (in long/narrow form) with the average
#       of each variable for each activity and each subject.

library(tidyr)

data_subset_narrow <- gather(data_subset, Feature, Measurement, 3:68) 

grouped <- group_by(data_subset_narrow, Activity, Subject, Feature)

summarised <- summarise(grouped, mean(Measurement))

# Step 6. Export using write.table(), with row.name=FALSE 

write.table(summarised, file = "tidy_data.txt", row.name=FALSE)