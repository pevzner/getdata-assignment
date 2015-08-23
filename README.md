# README file
This document describes the data processing code in run_analysis.R. Please refer to the Code Book for any further definitions.

## Script goal
The goal of the script is to process the raw data -- both the test set and the training set -- into a single processed dataset that provides the average values for all the mean and standard deviation measurements, grouped by activity and subject.

## Raw data
Several data files from the raw data were used:

- 'train/X_train.txt': Training dataset
- 'test/X_test.txt': Test dataset
- 'features.txt': List of all features. This corresponds to the variables measured in each column of both datasets.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each row in the training dataset. Its range is from 1 to 30. 
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each row in the test dataset. Its range is from 1 to 30. 
- 'test/y_test.txt': Activity numbers corresponding to each row of the test dataset
- 'train/y_train.txt': Activity numbers corresponding to each row of the training dataset
- 'activity_labels.txt': Links activity numbers to activity names

## Script function
The script accomplishes the goal by combining all the relevant data into a single R data frame, then using it to build a new data frame containing the desired information, and finally writing the resulting data frame out to a text file.

The script operates in the following steps:

1. Load the test and training data ('train/X_train.txt' and 'test/X_test.txt') into 2 separate data frames.
2. Load the feature names (features.txt), and extract the feature names and associated column numbers that we want to report on. These are all the feature variables for mean and std measurements.
3. Process the feature names into a form that's easier to work with, by removing dashes and parentheses.
4. Use the list of desired features from step 2 to extract those features from the test and training data frames. Name the columns appropriately.
5. Load the activity codes ('train/y_train.txt', 'test/y_test.txt') for both datasets, convert them to activity names using 'activity_labels.txt', and add a row with activity names to each data frame.
6. Load the subject numbers ('test/subject_test.txt', 'train/subject_train.txt') for both datasets, and add a row with subject names to each data frame.
7. Merge the test and training data frames into a single data frame.
8. Summarize the data by averaging the 66 variables across the 2 added columns -- subject and activity. The resulting data frame will have 68 rows and 180 columns
9. Write the data frame out to a text file.

