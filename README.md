#Peer Assessment Getting and Cleaning Data Course

## Introduction

This Readme describes the project that has been developed with regard to the Peer Assessment of the Coursera - Getting and Cleaning Data.

The project instruction follows:

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive activity names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 



## How to run the script

- Clone the project
- in the script "run_analysis.R" set your R working directory in the base directory of the project
- Make sure that the data are placed in your working directory. Therefore unzip the data from the cousera course page. The folder "UCI HAR Dataset" that containing the data must be located in your working directory.
- run the script
- the script generates the cleaned data set in the folder "data"

## Implementation


### Descriptive column

New and clean columnnames are provided by the folloeing rules:
- rename variables starting with "t" to "time"
- rename variables starting with "f" to "freq"
- replacing "-" by "_"
- deleting "(" and ")"

### Read data

Data are read in test and train data set. The corrseponding files for activities and subjects are also read.

### Merge test and training. Add descriptive activity names and subjects.

Test and training data are merged as prescribed. Activities and Subjects are added.

### Choosing the column with mean and standard dev

Extracts only the measurements on the mean and standard deviation for each measurement.
Having already descriptively named the columns it is possible to extract the column with a couple of simple grep()

### Creating tidy data set

A simple group by activity, subject is done using the package *data.table*


### Result data set

The resulting dataset is written in the *data* subdirectory in csv format The name of the file is "summary.csv"

