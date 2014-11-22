# This file contains 5 functions:
# readInActivityLabels, readInFeatureNames, readInData, extractData and analysis.
#
# analysis() is the main entrance for this project.
#
# It takes the Samsung data directory path and tidy dataset output file path as input, 
# calls readInActivityLabels, readInFeatureNames and readInData to read in data, 
# merge train and test data together,
# calls extractData to extract mean and std columns from the original data,
# and computes the average of each variable for each activity and each subject using ddply,
# save the tidy dataset as disk file and returns it as function result.


# analysis function is the main entrance for the processing steps.
# It controls the whole process according to the project requirements
analysis <- function(dirPath = "UCI HAR Dataset", outputFilePath = "course_project_modified_uci_har_dataset.txt") {
    library(plyr)
    
    # read in feature names
    featureNames = readInFeatureNames(dirPath)
    
    # read in activity labels
    activityLabels = readInActivityLabels(dirPath)
    
    # read in both test and train dataset
    testData = readInData(dirPath, "test", featureNames, activityLabels)
    trainData = readInData(dirPath, "train", featureNames, activityLabels)
    
    # merge test and train dataset together
    rawData = rbind(testData, trainData)
    
    # extract required columns from the merged dataset
    extractData = extractData(rawData)
    
    # compute the average of every measurement for every subject and every activity
    res = ddply(extractData, .(Subject, Activity), numcolwise(mean))
    
    # save result on disk and return it
    write.table(res, file = outputFilePath, row.names = FALSE)
    res
}

# This function reads in activity labels stored in activity_labels.txt file
readInActivityLabels <- function(dirPath = "UCI HAR Dataset") {
    # create the file path of activity_labels.txt
    labelFilePath = paste(dirPath, "/activity_labels.txt", sep = "")
    
    # read in data using read.table
    activityLabels = read.table(labelFilePath, col.names = c("id", "Activity"))
    
    # return result
    activityLabels
}

# This function reads in feature names in features.txt file
readInFeatureNames <- function(dirPath = "UCI HAR Dataset") {
    # create the file path of features.txt
    featureFilePath = paste(dirPath, "/features.txt", sep = "")
    
    # read in data using read.table
    featureNames = readLines(featureFilePath)
    
    # return result
    featureNames
}

# This function reads in data in test or train directory
# namely the subject, X and Y files
readInData <- function(dirPath, setType, featureNames, activityLabels) {
    ## reading subject_test.txt file
    subjectFilePath = paste(dirPath,"/", setType, "/subject_", setType, ".txt", sep = "")
    subject = read.table(file = subjectFilePath, col.names = c("Subject"))
    
    ## reading Y_test.txt
    yFilePath = paste(dirPath,"/", setType, "/y_", setType, ".txt", sep = "")
    y = read.table(file = yFilePath, col.names = c("id"))
    y = join(y, activityLabels, by = "id")
    
    ## reading X_test.txt
    xFilePath = paste(dirPath,"/", setType, "/X_", setType, ".txt", sep = "")
    x = read.table(file = xFilePath, col.names = featureNames)
    
    ## combine the three parts of data together
    data = cbind(subject, y$Activity, x)
    names(data)[2] = "Activity"
    
    ## return the result
    return(data)
}

# This function extracts "Subject", "Activity" and every mean and std column
# from data table created by readInData()
# using regex technique
extractData <- function(rawData, patt = "mean|std|Activity|Subject") {
    # get column names
    columnNames = names(rawData)
    
    # decide which column is needed with regex
    selected = sapply(columnNames, grepl, pattern = patt)
    
    # extract the needed columns and return the result
    newData = rawData[, columnNames[selected]]
    newData
}