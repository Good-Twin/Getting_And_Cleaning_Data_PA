#load librarys
library(dplyr)
library(data.table)

wd <- "C:\\Users\\Robert.Pollack\\Documents\\Weiterbildung\\Data Science Specialisation\\99_Workingdirectory"
setwd(wd)

#Manually created directory for saving the cleaned and summarized data
DataDir <- paste(wd,"\\data", sep="")

#Get variable Descriptions
features <- read.csv("UCI HAR Dataset/features.txt", sep=" ", header=FALSE)
names(features) <- c('id','name')

#Get Observations from Files
test          <- read.csv("UCI HAR Dataset/test/x_test.txt", sep="" , stringsAsFactors=FALSE, head = FALSE)
activity_test <- read.csv("UCI HAR Dataset/test/y_test.txt", sep="" , stringsAsFactors=FALSE, head = FALSE)
subject_test  <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="" , stringsAsFactors=FALSE, head = FALSE)
names(test)   <- features$name

train          <- read.csv("UCI HAR Dataset/train/x_train.txt", sep="" , stringsAsFactors=FALSE, head = FALSE)
activity_train <- read.csv("UCI HAR Dataset/train/y_train.txt", sep="" , stringsAsFactors=FALSE, head = FALSE)
subject_train  <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="" , stringsAsFactors=FALSE, head = FALSE)
names(train)   <- features$name

#Setting index columns and merging
test$ID <- c(1:nrow(test))
activity_test$ID <- c(1:nrow(activity_test))
subject_test$ID<-seq.int(nrow(subject_test))
names(activity_test) <- c("Activity ID", "ID")
names(subject_test) <- c("Subject ID", "ID")

train$ID <- c(1:nrow(train))
activity_train$ID <- c(1:nrow(activity_train))
subject_train$ID<-seq.int(nrow(subject_train))
names(activity_train) <- c("Activity ID", "ID")
names(subject_train) <- c("Subject ID", "ID")

subject_activity_test = merge(x=subject_test, y= activity_test, by.x="ID", by.y='ID')
subject_activity_train = merge(x=subject_train, y= activity_train, by.x="ID", by.y='ID')

#remove duplicate columns
test <-test[,!duplicated(colnames(test))]
test_tbl <- tbl_df(test)
meanStd_test <- select(test_tbl, matches("(mean|std)\\(.*\\)|(ID)"))

train <-train[,!duplicated(colnames(train))]
train_tbl <- tbl_df(train)
meanStd_train <- select(train_tbl, matches("(mean|std)\\(.*\\)|(ID)"))

#Union Test and Training data
meanStd_test = merge(x=meanStd_test, y=subject_activity_test, by.x="ID", by.y='ID')
meanStd_train = merge(x=meanStd_train, y=subject_activity_train, by.x="ID", by.y='ID')
meanStd <- rbind(meanStd_train, meanStd_test)

#match() for decoding the activities
activity_id <- c(1,2,3,4,5,6)
activity_label <- c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING')
activities <- data.frame("ID"=activity_id, "Activity_Lable" = activity_label)
meanStd$Activity = activities$Activity_Lable[match(meanStd$`Activity ID`, activities$ID)]


#formatting column names and remove unused columns
names(meanStd)<-gsub("tBody", "time_Body", names(meanStd))
names(meanStd)<-gsub("tGrav", "time_Grav", names(meanStd))
names(meanStd)<-gsub("fBody", "freq_Body", names(meanStd))
names(meanStd)<-gsub("-", "_", names(meanStd))
names(meanStd)<-gsub("\\(\\)", "", names(meanStd))

meanStd$ID <- NULL
meanStd$`Activity ID` <- NULL

#Create summarized by average data set
meanStd_DT <- data.table(meanStd)
summaryDT <- meanStd_DT [, lapply(.SD, mean), by=c("Activity", "Subject ID")]

#Export the datasets to csv file
PathCsv <- paste(DataDir,  'summary.csv', sep="/")
write.csv(summaryDT, PathCsv , row.names = FALSE)
