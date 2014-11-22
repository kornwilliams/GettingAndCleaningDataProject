analysis <- function(dirPath = "UCI HAR Dataset", outputFilePath = "course_project_modified_uci_har_dataset.txt") {
    library(plyr)
    
    featureNames = readInFeatureNames(dirPath)
    
    activityLabels = readInActivityLabels(dirPath)
    
    testData = readInData(dirPath, "test", featureNames, activityLabels)
    trainData = readInData(dirPath, "train", featureNames, activityLabels)
    
    rawData = rbind(testData, trainData)
    
    extractData = extractData(rawData)
    extractData
    
    res = ddply(extractData, .(Subject, Activity), numcolwise(mean))
    write.table(res, file = outputFilePath, row.names = FALSE)
    res
}

readInActivityLabels <- function(dirPath = "UCI HAR Dataset") {
    labelFilePath = paste(dirPath, "/activity_labels.txt", sep = "")
    activityLabels = read.table(labelFilePath, col.names = c("id", "Activity"))
    activityLabels
}

readInFeatureNames <- function(dirPath = "UCI HAR Dataset") {
    featureFilePath = paste(dirPath, "/features.txt", sep = "")
    featureNames = readLines(featureFilePath)
    featureNames
}

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
    
    data = cbind(subject, y$Activity, x)
    names(data)[2] = "Activity"
    
    return(data)
}

extractData <- function(rawData, patt = "mean|std|Activity|Subject") {
    columnNames = names(rawData)
    selected = sapply(columnNames, grepl, pattern = patt)
    newData = rawData[, columnNames[selected]]
    newData
}