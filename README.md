GettingAndCleaningDataProject
=============================

This is the repository for Course Project for Getting and Cleaning Data on Coursera. There are two important files in this repo:
* run_analysis.R: the R script file containing functions that produce the required tidy data file
* CodeBook.md: the code book describing the variables in the tidy dataset

##Functions in run_anlysis.R

The run_anlysis.R file contains 5 functions: readInActivityLabels, readInFeatureNames, readInData, extractData and analysis.

analysis() is the main entrance for this project. 

It takes the Samsung data directory path and tidy dataset output file path as input, calls readInActivityLabels, readInFeatureNames and readInData to read in data, merge train and test data together, calls extractData to extract mean and std columns from the original data, and computes the average of each variable for each activity and each subject using ddply, save the tidy dataset as disk file and returns it as function result.

### readInActivityLabels()
This function reads in activity labels stored in activity_labels.txt file

input:
dirPath: Samsung data directory path, default as "UCI HAR Dataset"

output:
activityLabels: a one-column table containing the activity labels in activity_labels.txt

steps：
<ol>
<li>create the file path of activity_labels.txt</li>
<li>read in activity labels using read.table and store them in a table named activityLabels</li>
<li>return activityLabels</li>
</ol>
### readInFeatureNames()
This function reads in feature names in features.txt file

input:
dirPath: Samsung data directory path, default as "UCI HAR Dataset"

output:
featureNames: a one-column table containing the feature names in features.txt

steps：
<ol>
<li>create the file path of features.txt</li>
<li>read in feature names using read.table and store them in a table named featureNames</li>
<li>return featureNames</li>
</ol>
### readInData()
This function reads in data in test or train directory

input:
dirPath: Samsung data directory path, default as "UCI HAR Dataset"
setType: train or test directory path
featureNames: feature name table returned by readInFeatureNames()
activityLabels: activity label table returned by readInActivityLabels()

output:
data: a table containing data from test or train directory, with required column names and activity labels.

steps：
<ol>
<li>create the file path of subject file, read in subject data with read.table, and store the data as subject</li>
<li>add column name "Subject" to subject</li>
<li>create the file path of Y file, read in activity data with read.table, and store activity data as y</li>
<li>use join function and activityLabels to replace activity values in y with activity labels</li>
<li>add column name "Activity" to y</li>
<li>create the file path of X file, read in measurements with read.table, and store measurements as x</li>
<li>add column names to x using featureNames</li>
<li>merge subject, y and x into a table called data using cbind</li>
<li>return data</li>
</ol>
### extractData()
This function extracts "Subject", "Activity" and every mean and std column from data table created by readInData()

input:
data: data table created as result of readInData()
patt: regex pattern string used to extract columns whose column names fit the regex pattern, default set to "mean\\(\\)|std\\(\\)|Activity|Subject"

output:
newData: a data table only contains required columns 

steps:
<ol>
<li>use names() to get column name vector columnNames</li>
<li>create a logical vector named selected using sapply and grepl, where every element in the vector reprents if the corresponding column name fits the regex</li>
<li>extract the required columns from data using subsetting and selected, and store the result into a new table named newData</li>
<li>return newData as result</li>
</ol>
### analysis()
This function is the main entrance for the processing steps. It controls the whole process according to the project requirements

input:
dirPath: Samsung data directory path, default as "UCI HAR Dataset"
outputFilePath: destination path for the tidy dataset, default as "course_project_modified_uci_har_dataset.txt"

output:
res: a table meets the requirements of the course project

steps:
<ol>
<li>call readInFeatureNames() with dirPath and save result as featureNames</li>
<li>call readInActivityLabels() with dirPath and save result as activityLabels</li>
<li>call readInData with setType set as "test" to read in test data and save result as testData</li>
<li>call readInData with setType set as "train" to read in train data and save result as trainData</li>
<li>merge testData and trainData using rbind and save result as rawData</li>
<li>call extractData with extractData to extract required columns and save result as extractData</li>
<li>call ddply with extractData to compute the average of each variable for each activity and each subject, and save result as res</li>
<li>call write.table with outputFilePath and res to save result table on disk</li>
<li>return res as function result</li>
</ol>
