## You should create one R script called run_analysis.R that does the following. 
#     1. Merges the training and the test sets to create one data set.
#     2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#     3. Uses descriptive activity names to name the activities in the data set
#     4. Appropriately labels the data set with descriptive activity names. 
#     5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 



#     1. Merges the training and the test sets to create one data set.
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", quote="\"")
sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"")

X_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", quote="\"")
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"")


features <- read.table("UCI HAR Dataset/features.txt", quote="\"")

colnames(X_test) <- features$V2
colnames(X_train) <- features$V2

dataset <- rbind(X_test,X_train)
labels <- rbind(y_test,y_train)
subjects <- rbind(sub_test,sub_train)

dataset$labels <- labels$V1




rm(X_test)
rm(X_train)
rm(y_test)
rm(y_train)

#     2. Extracts only the measurements on the mean and standard deviation for each measurement. 

index <- with(features, grepl("std()",V2))
index2 <- with(features, grepl("mean()",V2))
cols <- features[index | index2, "V1"]

dataset <- dataset[,cols]

#labels <- labels(,"V2")
dataset <- cbind(labels, dataset)
names(dataset)[1] <- "Activity"

dataset <- cbind(subjects, dataset)
names(dataset)[1] <- "Subjects"

rm(cols)
rm(index)
rm(index2)

#     5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 






