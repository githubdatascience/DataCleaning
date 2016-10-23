## 0. Setting the working directory and downloading datasets
if(!file.exists("dataset.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                method="curl", destfile="dataset.zip")
}
unzip("dataset.zip")
setwd("UCI HAR Dataset")

## 1. Merging test and train datasets
testData <- read.table("test/X_test.txt")
trainData <- read.table("train/X_train.txt")
data <- rbind(testData, trainData)

## 2. Selecting measurements on the mean() and std()
features <- read.table("features.txt", stringsAsFactors = FALSE)
relevantFeatures <- grep("std\\(\\)|mean\\(\\)", features[,2])

## 3. Naming activities with descriptive names
actLabels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
activities <- rbind(read.table("test/y_test.txt"),
                    read.table("train/y_train.txt"))
activities[,1] <- factor(as.character(activities[,1]),
                         levels = as.character(actLabels[,1]),
                         labels = actLabels[,2])

## 4. Renaming variables with descriptive labels
relevantFeaturesLab <- sub("-std\\(\\)-?", "Sd", features[relevantFeatures, 2])
relevantFeaturesLab <- sub("-mean\\(\\)-?", "Mean", relevantFeaturesLab)
relevantFeaturesLab <- sub("^t", "time", relevantFeaturesLab)
relevantFeaturesLab <- sub("^f", "freq", relevantFeaturesLab)
data <- data[, relevantFeatures]
subjects <- rbind(read.table("test/subject_test.txt"),
                  read.table("train/subject_train.txt"))
data <- cbind(subjects, activities, data)
colnames(data) <- c("subject", "activity", relevantFeaturesLab)

## 5. Variable averages for each activity and each subject
data2 <- sapply(data[3:ncol(data)], function(x) {
              tapply(x, paste(as.character(data$activity), data$subject), mean)
            })
data2 <- cbind(unique(data[order(paste(as.character(data$activity),
                                       data$subject)),1:2]), data2)

## 6. Writing output tidy data set
write.table(data2, file = "tidy_dataset.txt", row.name = FALSE)
