# getting-and-cleaning-data

download data from here https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Put it in your working directory and change the name of folder to dataset

open run_analyses.R 

start from row 7 in first step read all data into R and make union of train and test datasets.

step 2 is about subsetting dataset to columns you need ( measurements on the mean and standard deviation )

step 3 is about descriptive activity names to name the activities in the data set

step 4 and 5 produce final datasets.

After you run the script you will find in you working direcotry files CleanData.txt containg measurements  on the mean and standard deviation and Averages.txt with data set with the average of each variable for each activity and each subject.
