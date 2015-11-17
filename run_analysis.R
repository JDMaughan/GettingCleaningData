## Use dplyr Library
library(dplyr)
library(data.table) ## To use setnames to rename variables to meaningful names

##
## "Test" data
## 

## Read in X Test Dataset
x.test <- read.csv("./data/UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)

## Read in Test Labels
y.test <- read.csv("./data/UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)

## Read in the Test Subjects
subject.test <- read.csv("./data/UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)

## Merge the Test datasets into a TEST data frame
df.test <- data.frame(subject.test, y.test, x.test)

##
## "Train" data
## 

## Read in X Train Dataset
x.train <- read.csv("./data/UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)

## Read in Train Labels
y.train <- read.csv("./data/UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)

## Read in Train Subjects
subject.train <- read.csv("./data/UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)

## Merge Train data into a single TRAIN data frame
df.train <- data.frame(subject.train, y.train, x.train)

## Combine TEST and TRAIN data frames into one
run.data <- rbind(df.train, df.test)

# # Remove the files we don't need anymore from
# # the environment.
# remove(subject.test, x.test, y.test, subject.train,
#        x.train, y.train, df.test, df.train)


## Get Measurement Labels
features <- read.csv("./data/UCI HAR Dataset/features.txt", sep = "", header = FALSE)

## Convert features into a vector, then use that to give column names to combined data set
features.vector <- as.vector(features[,2])

colnames(run.data) <- c("subject_id", "activity_labels", features.vector)

## Make sure column names are unique
valid_col_names <- make.names(names=names(run.data), unique=TRUE, allow_=TRUE)
names(run.data) <- valid_col_names

## Narrow combined dataset down to needed columns -- those that contain mean or std.
run.data <- select(run.data, contains("subject"), contains("label"), contains("mean"), 
                   contains("std"), -contains("freq"), -contains("angle"))

## Read in the Activity Labels
activity.labels <- read.csv("./data/UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)

# Replace the activity codes in the trimmed down running
# dataset with the labels from the activity labels dataset.
run.data$activity_labels <- as.character(activity.labels[match(run.data$activity_labels, activity.labels$V1), 'V2'])

## Clean up Variable (column) names so they make sense
## Change "BodyBody" to "Body
## replace "..." with underscore "_"
setnames(run.data, colnames(run.data), gsub("BodyBody", "Body", colnames(run.data)))
setnames(run.data, colnames(run.data), gsub("...", "_", colnames(run.data), fixed = TRUE))

## Group the run data by subject_id and activity
## Calculate the mean of all measurements
run.data.summary <- run.data %>%
        group_by(subject_id, activity_labels) %>%
        summarize_each(funs(mean))

## write summary data to a file
write.table(run.data.summary, file="./data/UCI HAR Dataset/tidy_data.txt", row.name = FALSE)





