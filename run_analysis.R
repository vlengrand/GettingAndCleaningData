# Install library

library(data.table)
library(dplyr)


# Step 0. Downloads, unzips and loads the files

  # 0.1 Download and unzip the files
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                destfile = 'dataset.zip')
  unzip('dataset.zip')

  # 0.2 Read Set files
    # Train Dataset (repository "UCI HAR Dataset/train")
    Xtrain <- fread("UCI HAR Dataset/train/X_train.txt") # Training set
    Ytrain <- read.table("UCI HAR Dataset/train/y_train.txt") # Training labels
    subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt") 
  
    # Test Dataset (repository "UCI HAR Dataset/test")
    Xtest <- fread("UCI HAR Dataset/test/X_test.txt") # Test set
    Ytest <- read.table("UCI HAR Dataset/test/y_test.txt") # Test labels
    subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

  # 0.3 Read others Set files (repository "UCI HAR Dataset")
    # Feature names
    featureNames <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = F)[,2]
    # make proper R names
    valid_featureNames <- make.names(names=featureNames, unique=TRUE, allow_ = TRUE)
    valid_featureNames
    # Activity names
    activityNames <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = F)
    activityNames
    
    
# Step 1. Merges the training and the test sets to create one data set.
  
  # 1.1 Create one data set
  dataset <- rbind(Xtrain, Xtest) # sets
  
  # 1.2 Rename columns of the dataset with features
  colnames(dataset) <- valid_featureNames
  head(dataset)
 

  
# Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  new_dataset <- select(dataset, matches("\\.(mean|std)\\.\\."))
      
      
      
# Step 3. Uses descriptive activity names to name the activities in the data set
  # 3.1 Work on activity names
  Ymerged <- rbind(Ytrain, Ytest) # merge training et test labels
  YmergedLabels2 <- merge(Ymerged,activityNames, by.x="V1", by.y="V1")
  YmergedLabels <- YmergedLabels2$V2

  # 3.2 Merge with the dataset
  new_dataset2 <- cbind(YmergedLabels, new_dataset) # merge activity names et dataset
  
  # 3.3 Rename YmergedLabels
  names(new_dataset2) <- c('activity', names(new_dataset))
           
      
# Step 4. Appropriately labels the data set with descriptive variable names.
  # Create new labels
  betterFeatureNames <- names(new_dataset2)
  betterFeatureNames <- gsub("^f", "Frequency", betterFeatureNames)
  betterFeatureNames <- gsub("^t", "Time", betterFeatureNames)
  betterFeatureNames <- gsub("\\.","", betterFeatureNames)
  betterFeatureNames <- tolower(betterFeatureNames)

  
  
# Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  # 5.1 Merge subject and dataset
  subjectmerged <- rbind(subject_train, subject_test) # merge training et test suject
  new_dataset3 <- cbind(subjectmerged, new_dataset2)
  
  # 5.2 Renames variables with descriptive variable names
  names(new_dataset3) <- c('subject', betterFeatureNames)

  # 5.3 Create final dataset
  result <- new_dataset3 %>% group_by(subject, activity) %>% summarise_all(mean)
  
  # 5.4 Create a file with final dataset
  write.table(result, "result.csv", sep =";")
  write.table(result, "result.txt", row.name=FALSE)
