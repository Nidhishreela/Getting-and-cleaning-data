To Tranform the raw data into tidy data 5 operations were performed on the raw data, the code for the same is given in Run_analysis.R

1. MERGING TRAIN AND TEST DATA:

         The raw data is obtained from accelerometer and gyroscopes embedded in smartphones during 6 different activities. the various activities performed is described in the file
activities 
         A total of 30 persons were used for collecting data and they were divided into testing and training groups. testing data included 9 persons and 21 persons were used for 
collecting training data
         fea_name <- it shows the features that are used in the dataset
         features_train <- it contains the values of various features obtained from training persons
         outcome_train <- it shows the activity performed by the training person for each row of features value
         subject_train <- it show the id of training person for each row of features value
         features_test <- it contains the values of various features obtained from testing persons
         outcome_test <- it shows the activity performed by the testing person for each row of features value
         subject_test <- it show the id of testing person for each row of features value
The tables belonging to train are merged together by merge command. same follows for test data
the train and test data are then joined using rbind

2. SELECTING FEATURES CONTAINING MEAN AND STD:

       The names of features in the dataset containing mean and std are extracted using str_extract and regexp and then passed to the compl_data giving only the features
containing those names.

3. USING DESCRIPTIVE ACTIVITY NAMES IN DATASET:
        
        The activities in the dataset is given as numbers which is changed to its decriptive names by passing the numbered activity to the activity table containing description
 
 4. DESCRIPTIVE VARIABLE NAMES:
        
        The variable name in the dataset are descriptively labelled in this step
        't' in the column names is renamed to 'time'
        'f' in the column names is renamed to 'frequency'
        'acc' in the column names is renamed to 'acceleration'
        'gyro' in the column names is renamed to 'gyroscope'
        'std' in the column names is renamed to 'standard_deviation'
        'freq' in the column names is renamed to 'frequency'
        'mag' in the column names is renamed to 'magnitude'
         
5. NEW DATASET CREATED WITH AVERAGE OF EACH VARIBLE FOR EACH ACTIVITY AND SUBJECT:

       The dataset are grouped into subject and activity using group_by and the data is summarised by taking mean of all the varibales of that group.
       The dataset after performing the operations are ecported as 'final_data.txt
