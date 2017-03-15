# Input Data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# List of transformation
The script "run_analysis.R" : 
* Downloads, unzips and loads the files
* Merges test and train files into a single data table
* Creates a second dataset, with only mean and std variables
* Computes the means of this dataset, group by subject/activity.
* Writes the result to result.csv

The script uses the data.table and dplyr packages.

# Variables 
The variables where choosen as they included either mean or std in their original names. 
Each variable of the data set is mean grouped by activity / subject.

The resulting dataset contains the following variables
* subject	
* activity	
* timebodyaccmeanx	
* timebodyaccmeany	
* timebodyaccmeanz	
* timebodyaccstdx	
* timebodyaccstdy	
* timebodyaccstdz	
* timegravityaccmeanx	
* timegravityaccmeany	
* timegravityaccmeanz	
* timegravityaccstdx	
* timegravityaccstdy	
* timegravityaccstdz	
* timebodyaccjerkmeanx	
* timebodyaccjerkmeany	
* timebodyaccjerkmeanz	
* timebodyaccjerkstdx	
* timebodyaccjerkstdy	
* timebodyaccjerkstdz	
* timebodygyromeanx	
* timebodygyromeany	
* timebodygyromeanz	
* timebodygyrostdx	
* timebodygyrostdy	
* timebodygyrostdz	
* timebodygyrojerkmeanx	
* timebodygyrojerkmeany	
* timebodygyrojerkmeanz	
* timebodygyrojerkstdx	
* timebodygyrojerkstdy	
* timebodygyrojerkstdz	
* timebodyaccmagmean	
* timebodyaccmagstd	
* timegravityaccmagmean	
* timegravityaccmagstd	
* timebodyaccjerkmagmean	
* timebodyaccjerkmagstd	
* timebodygyromagmean	
* timebodygyromagstd	
* timebodygyrojerkmagmean	
* timebodygyrojerkmagstd	
* frequencybodyaccmeanx	
* frequencybodyaccmeany	
* frequencybodyaccmeanz	
* frequencybodyaccstdx	
* frequencybodyaccstdy	
* frequencybodyaccstdz	
* frequencybodyaccjerkmeanx	
* frequencybodyaccjerkmeany	
* frequencybodyaccjerkmeanz	
* frequencybodyaccjerkstdx	
* frequencybodyaccjerkstdy	
* frequencybodyaccjerkstdz	
* frequencybodygyromeanx	
* frequencybodygyromeany	
* frequencybodygyromeanz	
* frequencybodygyrostdx	
* frequencybodygyrostdy	
* frequencybodygyrostdz	
* frequencybodyaccmagmean	
* frequencybodyaccmagstd	
* frequencybodybodyaccjerkmagmean	
* frequencybodybodyaccjerkmagstd	
* frequencybodybodygyromagmean	
* frequencybodybodygyromagstd	
* frequencybodybodygyrojerkmagmean	
* frequencybodybodygyrojerkmagstd

