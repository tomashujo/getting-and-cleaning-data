
# STEP 1
# Merges the training and the test sets to create one data set.

setwd("C:\\Users\\hujo\\Desktop\\R files\\Coursera\\getting and cleaning data\\project")
# reading datasets from train folder
train <- read.table("./dataset/train/X_train.txt")
trainActivity <- read.table("./dataset/train/y_train.txt")
trainPerson<-read.table("./dataset/train/subject_train.txt")
# reading datasets from test folder
test <- read.table("./dataset/test/X_test.txt")
testActivity<-read.table("./dataset/test/y_test.txt")
testPerson<-read.table("./dataset/test/subject_test.txt")

# union of datasets

Data<-rbind(train,test)
Activity<-rbind(trainActivity,testActivity)
Person<-rbind(trainPerson,testPerson)

# check on number of rows , should equal


ifelse( (nrow(Data)==nrow(Activity) && nrow(Data)==nrow(Person)),
    
    print("It's ok") ,
    print("you are screwed")
)

# step 2
# Extracts only the measurements on the mean and standard deviation for each measurement.
# file contains indices and column names 
Columns <- read.table("./dataset/features.txt")
head(Columns)
# load stringr package
install.packages("stringr")
library(stringr)
# getting indices for columns you need containg words mean or std
subcolumns<-which(str_detect(Columns$V2,pattern = "mean[^[:alnum:]]")|str_detect(Columns$V2,pattern = "std[^[:alnum:]]"))
subdata<-data[ ,subcolumns]

# step 3
# Uses descriptive activity names to name the activities in the data set

ActivityNames <- read.table("./dataset/activity_labels.txt")
# loading dplyr
install.packages("dplyr")
library(dplyr)
activity<-left_join(Activity,ActivityNames)%>%select(. ,2)

# Step 4
# Appropriately labels the data set with descriptive variable names.
names(Person)<-"Dude"
names(activity)<-"Activity"
FinalData<-cbind(Person,activity,subdata)

write.table(FinalData, "CleanData.txt")

# Steo 5
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
head(FinalData)
AggregatedData<-FinalData%>%group_by(Dude,Activity)%>%summarise_each(funs(mean))
dim(AggregatedData)
write.table(AggregatedData,"Averages.txt",row.names = FALSE)
