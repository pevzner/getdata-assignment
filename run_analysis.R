library(dplyr)

# Unzip the archive, and read in the test data and training data
unzip("getdata-projectfiles-UCI HAR Dataset.zip")
testdata <- read.table("UCI HAR Dataset/test/X_test.txt")
traindata <- read.table("UCI HAR Dataset/train/X_train.txt")

# Read the features list, and build a list of desired variables, composed of
# just the means and stds of each measurement
features <- read.table("UCI HAR Dataset/features.txt")
names(features) <- c("colnumber","colname")
means <- grep("mean",features$colname)
stds <- grep("std",features$colname)
desired.vars <- features[c(means,stds),] # list of variables containing "mean" or "std"
meanfreqs <- grep("meanFreq", desired.vars$colname) 
desired.vars <- desired.vars[-meanfreqs,] # exclude "meanFreq"
desired.vars <- arrange(desired.vars,colnumber)

# Remove parentheses and replace dashes with dots, to make the names easier to work with
desired.vars$colname <- gsub("\\(\\)","",desired.vars$colname)
desired.vars$colname <- gsub("-",".",desired.vars$colname)

# Select just the desired variables, and name the columns accordingly, for both data frames.
testdata <- select(testdata,desired.vars$colnumber)
names(testdata) <- desired.vars$colname
traindata <- select(traindata,desired.vars$colnumber)
names(traindata) <- desired.vars$colname

# Add column for activity names to both data frames
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")

test.activities <- read.table("UCI HAR Dataset/test/y_test.txt")
test.activities <- mutate(test.activities, label=activity.labels$V2[test.activities$V1])
testdata <- cbind(test.activities$label, testdata)
names(testdata)[1] <- "activity"

train.activities <- read.table("UCI HAR Dataset/train/y_train.txt")
train.activities <- mutate(train.activities, label=activity.labels$V2[train.activities$V1])
traindata <- cbind(train.activities$label, traindata)
names(traindata)[1] <- "activity"

# Add column for subject numbers to both data frames
test.subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
testdata <- cbind(test.subjects, testdata)
names(testdata)[1] <- "subject"

train.subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
traindata <- cbind(train.subjects, traindata)
names(traindata)[1] <- "subject"

# Merge the two data frames into one
totaldata <- rbind(testdata, traindata)

# Build a new data frame that shows the average of each variable for each activity and each subject.
# Name the rows to reflect that they represent averages.
grouped.data <- group_by(totaldata, subject, activity)
tidy.data <- summarise_each(grouped.data, funs(mean))
names(tidy.data)[3:68] <- paste("Avg.", names(tidy.data)[3:68], sep="")

# Write out the new tidy data to "tidy.txt".
write.table(tidy.data, "tidy.txt", row.name=FALSE)
