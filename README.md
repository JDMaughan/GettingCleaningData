# *Getting and Cleaning Data* Course Project
This project contains an analysis of accelerometer and gyroscope data generated from an experiment with Samsun Galaxy S smartphones.  

Original data can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Details of the raw data, as unzipped from the file referenced above, can be found in README.txt file contained in the zip file.

-------------------------

## Project Contents
  - `README.md` -- This file.
  - `CodeBook.md` -- Decription of experiment data and steps taken to arrive at summarized, tidy data result file.
  - `run_analysis.R` -- R script to merge Test and Train datasets, apply Tidy Data principles, and summarize the data.
  - `tidy_data.txt` -- The output file from the run_analysis.R script.

-------------------------

## Getting Started
1. Study the [CodeBook](CodeBook.md) and the [run_analysis.R](run_analysis.R) script.  This will explain the input, output, and steps taken according to author's implemenation of project instructions.

2. Make sure the experiment data is downloaded and extracted to your project working directory in a folder "./data/UCI HAR Dataset".

3. Run the run_analysis.R script

