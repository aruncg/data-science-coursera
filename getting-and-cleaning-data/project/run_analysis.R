# 0. Read in all the data first.
activities <- read.table("uci-har-dataset/activity_labels.txt", col.names = c("ActivityCode", "ActivityName"))
features <- read.table("uci-har-dataset/features.txt", col.names = c("FeatureCode", "FeatureName"))

x_train <- read.table("uci-har-dataset/train/X_train.txt", col.names = features$FeatureName)
y_train <- read.table("uci-har-dataset/train/y_train.txt", col.names = c("ActivityCode"))
subject_train <- read.table("uci-har-dataset/train/subject_train.txt", col.names = c("Subject"))

x_test <- read.table("uci-har-dataset/test/X_test.txt", col.names = features$FeatureName)
y_test <- read.table("uci-har-dataset/test/y_test.txt", col.names = c("ActivityCode"))
subject_test <- read.table("uci-har-dataset/test/subject_test.txt", col.names = c("Subject"))

# 1. Merge the training and the test sets to create one data set.
train <- cbind(x_train, y_train, subject_train)
test <- cbind(x_test, y_test, subject_test)
har_data <- rbind(train, test)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
mean_std_vars <- names(har_data)[grep("[Mm]ean|std|ActivityCode|Subject", names(har_data))]
mean_std_har_data <- select(har_data, mean_std_vars)

# 3. Use descriptive activity names to name the activities in the data set
descriptive_data <- merge(mean_std_har_data, activities)
descriptive_data <- select(descriptive_data, -ActivityCode)

# 4. Appropriately label the data set with descriptive variable names.
colnames(descriptive_data) <- gsub("(\\.)+", "\\.", names(descriptive_data))
colnames(descriptive_data) <- gsub("(\\.)$", "", names(descriptive_data))
colnames(descriptive_data) <- gsub("^(t|f)(Body|Gravity)(Acc|AccJerk|Gyro|GyroJerk|AccJerk)\\.(mean|std|meanFreq)\\.(X|Y|Z)", "\\4 of \\3 of \\2 in \\1 Domain in \\5 direction", names(descriptive_data))
colnames(descriptive_data) <- gsub("^angle\\.(X|Y|Z)\\.gravityMean", "Angle between gravityMean and \\1 direction", names(descriptive_data))
colnames(descriptive_data) <- gsub("^(t|f)(Body|Gravity)(Acc|AccJerk|Gyro|GyroJerk|BodyAccJerk|BodyGyro|BodyGyroJerk)Mag\\.(mean|std|meanFreq)", "\\4 of magnitude of \\3 of \\2 in \\1 domain", names(descriptive_data))
colnames(descriptive_data) <- gsub("angle\\.tBodyAccMean\\.gravity", "angle between gravity and AccMean of Body in t domain", names(descriptive_data))
colnames(descriptive_data) <- gsub("angle\\.tBody(AccJerk|GyroJerk|Gyro)Mean\\.gravityMean", "angle between gravityMean and \\1 of Body in t domain", names(descriptive_data))

# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
tidy_data <- descriptive_data %>% group_by(ActivityName, Subject) %>% summarise_all(mean)

# Write it to a file.
write.table(tidy_data, file = "tidy_data.txt", row.names=FALSE)