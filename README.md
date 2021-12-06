# Getting-and-cleaning-data
This repository is a coursework project on getting and cleaning data
The raw data is obtained from UCI library and the dataset is 'Human activity recognition using smart phone dataset'.
The raw data is obtained and modified into a tidy dataset

This repository has three files:
Run_analysis.R : 
 This file has the code of how the data is modified to get a tidy dataset. Operations performed on the dataset are
 1. merging train and test dataset
 2. extracting variables containing only mean and std
 3. descriptive activities names to name the activity 
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4,independent tidy data set is created with the average of each variable for each activity and each subject.
Final_data.txt :
 It is the final dataset obtained after performing all the changes
Code_Book.md :
  This file explains the variables and operations performed on the dataset
