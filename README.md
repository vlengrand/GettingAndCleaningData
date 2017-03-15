# GettingAndCleaningData
This is my submission for Coursera Getting and Cleaning Data

# Files
  * CodeBook.md : codebook listing all transformations and output variables
  * result.csv and result.txt : tidy dataset containing means of measures by subject / activity
  * run_analysis.R : R script that does the job

# Description of the script "run_analysis.R"
  * Downloads, unzips and loads the files
  * Merges the training and the test sets to create one data set.
  * Extracts only the measurements on the mean and standard deviation for each measurement.
  * Uses descriptive activity names to name the activities in the data set
  * Appropriately labels the data set with descriptive variable names.
  * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
