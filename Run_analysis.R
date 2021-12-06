#COURSE PROJECT

# importing libraries
library(readtext)
library(dplyr)
library(plyr)
library(stringr)

#importing data
subject_test <- read.table('C:/Users/Nidhi/Documents/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt')
features_test <- read.table('C:/Users/Nidhi/Documents/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt')
outcome_test<-read.table('C:/Users/Nidhi/Documents/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt')
subject_train <- read.table('C:/Users/Nidhi/Documents/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt')
features_train <- read.table('C:/Users/Nidhi/Documents/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt')
outcome_train<-read.table('C:/Users/Nidhi/Documents/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt')


#merging test data and train data

k1 <- merge(features_test,subject_test,by = 0)
test_data <- merge(k1,outcome_test,by = 0)
test_data$Row.names <- NULL
k2 <- merge(features_train,subject_train,by = 0)
train_data <- merge(k2,outcome_train,by = 0)
train_data$Row.names <- NULL


# renaming the names of the features

fea_names <- read.table('C:/Users/Nidhi/Documents/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt')
vect <- fea_names$V2
colnames(test_data) <- c(vect,'subject','outcome')
colnames(train_data) <- c(vect,'subject','outcome')

# combining test and train data into single dataset

compl_data <- rbind(train_data,test_data)

# selecting features having mean and std

bt<-colnames(compl_data)
#bt1<-data.frame(bt)
n3<-data.frame(str_extract(bt, regex('[Mm]ean')))
n11 <- bt[complete.cases(n3)]
stp1<-compl_data[n11]
n31<-data.frame(str_extract(bt, regex('[Ss]td')))
n12 <- bt[complete.cases(n31)]
stp2 <- compl_data[n12]

step2_data <- merge(stp1,stp2,by = 0)
step2_data$Row.names <- NULL


#activities are changed into descriptions

activities <- read.table('C:/Users/Nidhi/Documents/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt')
step2_data$activity <- activities[compl_data$outcome, 2]
step2_data$subject <- compl_data$subject

# renaming features with descriptions

names(step2_data) <- gsub(regex('^t'),'time',names(step2_data))
names(step2_data) <- gsub(regex('^f'),'frequency',names(step2_data))
names(step2_data) <- gsub('Acc','Acceleration',names(step2_data))
names(step2_data) <- gsub('std','standard_deviation',names(step2_data))
names(step2_data) <- gsub('Gyro','Gyroscope',names(step2_data))
names(step2_data) <- gsub('Mag','Magnitude',names(step2_data))
names(step2_data) <- gsub('Freq','Frequency',names(step2_data))
names(step2_data)

# final step
final_Data <- step2_data %>% group_by(subject,activity) %>% summarise_all(funs(mean))
final_Data

write.table(final_Data,'final_data.txt',row.names = FALSE)
