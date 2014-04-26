## You should create one R script called run_analysis.R that does the following. 
#     1. Merges the training and the test sets to create one data set.
#     2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#     3. Uses descriptive activity names to name the activities in the data set
#     4. Appropriately labels the data set with descriptive activity names. 
#     5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 



##    1. Merges the training and the test sets to create one data set.

# load all datasets
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", quote="\"")
sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", quote="\"")
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", quote="\"")
features <- read.table("UCI HAR Dataset/features.txt", quote="\"")

# add real column names to each dataset
colnames(X_test) <- features$V2
colnames(X_train) <- features$V2

# add the activity labels to each dataset
test <- cbind(y_test,X_test)
train <- cbind(y_train,X_train)

# rename the activity labels
names(test)[1] <- "ActivityLabel"
names(train)[1] <- "ActivityLabel"

# add test subject ids to test and train
test <- cbind(sub_test,test)
train <- cbind(sub_train,train)

# rename the activity labels
names(test)[1] <- "Subject"
names(train)[1] <- "Subject"

# final dateset join
dataset <- rbind(test,train)

##     2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# use regex to extract the col numbers of columns with only mean() and std()
index <- with(features, grepl("std()",V2))
index2 <- with(features, grepl("mean()",V2))

# join the column sets and add the subject and activity columns
cols <- features[index | index2, "V1"]
tmp <- cols + 2
tmp2 <- c(1,2,tmp)

# filter the dataset by the index to keep only the cols we want
dataset <- dataset[,tmp2]

# cleanup memory
rm(list=c("cols","index","index2","tmp","tmp2","test",
          "train","X_test","X_train","y_test","y_train",
          "sub_train","sub_test","features"))


##     3. Uses descriptive activity names to name the activities in the data set
##     4. Appropriately labels the data set with descriptive activity names.
#  Note: tasks 3 and 4 really seem to be the same task.

# for this we  need to decode the activity names using the activity_labels data.frame
names(activity_labels)[1] = "ActivityLabel"
names(activity_labels)[2] = "Activity"
tmp <- merge(x = dataset, y = activity_labels, by="ActivityLabel", all.x=TRUE )

colnm <- colnames(dataset)
colnm[2] <- "Activity"

dataset <- tmp[colnm]

dataset <- dataset[order(dataset[,"Subject"],dataset[,"Activity"]), ]

rownames(dataset) <- NULL

rm(list=c("tmp","colnm","activity_labels"))

# write final dataset to output file
#write.table(dataset, file="dataset.csv", col.names=T, row.names=F, sep=",")

##     5. Creates a second, independent tidy data set with the average of each 
##        variable for each activity and each subject. 
library(reshape2)

cols <- colnames(dataset)
ncols <- cols[-c(1:2)]
dataMelt <- melt(dataset,id=c("Subject","Activity"),measure.vars=ncols)

tidydata <- dcast(dataMelt, Subject + Activity ~ variable,mean)

write.table(tidydata, file="tidydata.csv", col.names=T, row.names=F, sep=",")

rm(list=c("dataMelt","cols","ncols"))
