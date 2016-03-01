# 1) Get Data Files and merged them into 1 data set

if (!getwd() == "D:/Data Science/getting&CleaningData/project")
{ dir.create("D:/Data Science/getting&CleaningData/project")
}
setwd("D:/Data Science/getting&CleaningData/project")

furl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(furl, destfile = "D:/Data Science/getting&CleaningData/project/FUCIDataset.zip")
list.files(".")  ## lists file in the current directory
destfile <-"D:/Data Science/getting&CleaningData/project/FUCIDataset.zip"

ytest <- read.table(unzip(destfile, "UCI HAR Dataset/test/y_test.txt"))
ytrain <- read.table(unzip(destfile, "UCI HAR Dataset/train/y_train.txt"))
ymerged  <- rbind(ytrain, ytest)

xtest <- read.table(unzip(destfile, "UCI HAR Dataset/test/X_test.txt"))
xtrain <- read.table(unzip(destfile, "UCI HAR Dataset/train/X_train.txt"))
xmerged  <- rbind(xtrain, xtest)

subjecttest <- read.table(unzip(destfile, "UCI HAR Dataset/test/subject_test.txt"))
subjecttrain <- read.table(unzip(destfile, "UCI HAR Dataset/train/subject_train.txt"))
subjectmerged <- rbind(subjecttrain, subjecttest)
names(subjectmerged) <- "subject"

features <- read.table(unzip(destfile, "UCI HAR Dataset/features.txt"),header=FALSE, col.names=c('id', 'name'))


# 2) Extracts measurements on mean and standard deviation for each measurement. 


    feature_selected_columns <- grep('mean\\(\\)|std\\(\\)', features$name)
    x_filtered_dataset <- xmerged[, feature_selected_columns]
    names(x_filtered_dataset) <- features[features$id %in% feature_selected_columns, 2]
    x_filtered_dataset

    

# 3) Uses descriptive activity names to name the activities in the data set


activity_labels <- read.table(unzip(destfile, "UCI HAR Dataset/activity_labels.txt"),header=FALSE, col.names=c('id', 'name'))


# 4) Appropriately labels the data set with descriptive activity names. 

ymerged[, 1] = activity_labels[ymerged[, 1], 2]

names(ymerged) <- "activity"


# 5.1) intermediate dataset with all required measurements.

whole_dataset <- cbind(subjectmerged, ymerged, x_filtered_dataset)
write.csv(whole_dataset, "while interm descriptive_activity_names.csv")


# 5.2) Creates the final, independent tidy data set with the average of each variable for each activity and each subject.

measurements <- whole_dataset[, 3:dim(whole_dataset)[2]]
tidy_dataset <- aggregate(measurements, list(whole_dataset$subject, whole_dataset$activity), mean)
names(tidy_dataset)[1:2] <- c('subject', 'activity')
write.csv(tidy_dataset, "final_tidy_dataset.csv")
write.table(tidy_dataset, "final_tidy_dataset.txt")