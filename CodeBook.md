---
title: "Codebook for Coursera Course Project: Getting and Cleaning Data"
author: Jason Maughan
date: November 17, 2015
output:
  html_document:
    keep_md: yes
---

## Project Description
The R analysis script, `run_analysis.R`, reads in processed experiment data and outputs it into a summary form.  

###Guide to create the tidy data file
The original data is located [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ).  To reproduce analysis, perform these steps:

1. Download and extract the experiment data into an R Studio project working directory, in it's own directory under the data directory:  `<working directory>/data/UCI HAR Dataset`.

2. Verify these files are located in the .../UCI HAR Dataset/test directory:
        * `./data/UCI HAR Dataset/test/X_test.txt`      Test data set
        * `./data/UCI HAR Dataset/test/y_test.txt`      Test labels
        * `./data/UCI HAR Dataset/test/subject_test.txt`Identifier of the subject who performed the activities.
        
3. Verify these files are located in the .../UCI HAR Dataset/train directory:
        * `./data/UCI HAR Dataset/train/X_train.txt`    Train data set
        * `./data/UCI HAR Dataset/train/y_train.txt`    Train labels
        * `./data/UCI HAR Dataset/train/subject_.txt`   Identifier of the subject who performed the activies
        
4. Verify these files are located under the .../UCI HAR Dateset directory:
        * `./data/UCI HAR Dataset/features.txt`         List of phone features for which measurements were taken
        * `./data/UCI HAR Dataset/activity_labels.txt`  Index table for getting Activity Name give a class label (from y_train.txt or y_test.txt)
        
5.  Run the `run_analysis.R` script.

6. The tidy summarization file will be located in `./data/UCI HAR Dataset/` directory.  The name of the file is `tidy_data.txt`
        

###Cleaning of the data
The `run_analysis.R` script read in the processed experiment data and performs to get it into summary form. The script itself is heavily commented for clarity.

* The Test and Train data sets are read in and merged into a single data frame.
* The data columns are then given the names based on the `features.txt` file.
* The dataset is narrowed by keeping only columns/variables that hold standard deviation or or mean measurements.  Other columns are removed
* The activity identifiers (integers) are replaced with the human-readable activity labels found in the `activity_labels.txt` file.
* Because the column names had invalid characters, the column names were modified to remove invalid characters and shorten them to a single underscore "_" character.  In addition, a duplicate phrase `BodyBody` was changed replaced with `Body`.
* The data is then grouped by subject and activity. 
* The mean for each measurement variable is calculated
* Finally, the summary dataset is written to an output file described in step 6 above.

For more detail, see the [README.md](https://github.com/JDMaughan/GettingCleaningData/blob/master/README.md) file.

##Description of the summary data file

Characteristics of the output file `tidy_data.txt`:

* dim(run.data.summary)
[1] 180  68

* class(run.data.summary)
[1] "grouped_df" "tbl_df"     "tbl"        "data.frame"

* object.size(run.data.summary)
111336 bytes

###Summary File Variables
- subject_id - The ID of the experiment participant.  A value from 1:30

- activity_labels - The activity that the measurements (remaining variables) correspond to.  Possible values are
        - `WALKING`
        - `WALING_UPSTAIRS`
        - `WALKING_DOWNSTAIRS`
        - `SITTING`
        - `STANDING`
        - `LAYING`

The following variables represent the mean of recorded data points (which are either a mean or standard deviation) for the given `subject_id` and `activity_label`.  Detailed description of the different measurements types, as well as how names were derived,  can be found in the `features_info.txt` file included in the [original data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ).

- "tBodyAcc.mean_X"
- "tBodyAcc.mean_Y"
- "tBodyAcc.mean_Z"
- "tGravityAcc.mean_X"
- "tGravityAcc.mean_Y"
- "tGravityAcc.mean_Z"
- "tBodyAccJerk.mean_X"
- "tBodyAccJerk.mean_Y"    
- "tBodyAccJerk.mean_Z"
- "tBodyGyro.mean_X"
- "tBodyGyro.mean_Y"
- "tBodyGyro.mean_Z"
- "tBodyGyroJerk.mean_X"   
- "tBodyGyroJerk.mean_Y"
- "tBodyGyroJerk.mean_Z"
- "tBodyAccMag.mean.."
- "tGravityAccMag.mean.."
- "tBodyAccJerkMag.mean.."
- "tBodyGyroMag.mean.."
- "tBodyGyroJerkMag.mean.."
- "fBodyAcc.mean_X"
- "fBodyAcc.mean_Y"
- "fBodyAcc.mean_Z"        
- "fBodyAccJerk.mean_X"
- "fBodyAccJerk.mean_Y"
- "fBodyAccJerk.mean_Z"
- "fBodyGyro.mean_X"
- "fBodyGyro.mean_Y"
- "fBodyGyro.mean_Z"
- "fBodyAccMag.mean.."
- "fBodyAccJerkMag.mean.."
- "fBodyGyroMag.mean.."
- "fBodyGyroJerkMag.mean.."
- "tBodyAcc.std_X" 
- "tBodyAcc.std_Y"
- "tBodyAcc.std_Z"
- "tGravityAcc.std_X"
- "tGravityAcc.std_Y"
- "tGravityAcc.std_Z"
- "tBodyAccJerk.std_X"
- "tBodyAccJerk.std_Y"
- "tBodyAccJerk.std_Z"
- "tBodyGyro.std_X" 
- "tBodyGyro.std_Y"
- "tBodyGyro.std_Z"
- "tBodyGyroJerk.std_X"
- "tBodyGyroJerk.std_Y"
- "tBodyGyroJerk.std_Z"
- "tBodyAccMag.std.."
- "tGravityAccMag.std.."
- "tBodyAccJerkMag.std.."
- "tBodyGyroMag.std.."
- "tBodyGyroJerkMag.std.." 
- "fBodyAcc.std_X"
- "fBodyAcc.std_Y"
- "fBodyAcc.std_Z"
- "fBodyAccJerk.std_X"
- "fBodyAccJerk.std_Y"
- "fBodyAccJerk.std_Z"
- "fBodyGyro.std_X"
- "fBodyGyro.std_Y"
- "fBodyGyro.std_Z"
- "fBodyAccMag.std.."      
- "fBodyAccJerkMag.std.."
- "fBodyGyroMag.std.."
- "fBodyGyroJerkMag.std.." 
 
##Sources
Details on the collection of original data can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  It is recommended to review the README.md file found in this archive for complete study design details.

