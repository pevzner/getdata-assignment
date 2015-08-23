# Code Book
This document describes where the data in the submitted dataset came from. 

The Study Design and Feature Selection sections are taken verbatim from the original data found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The Summary Choices and Code Book sections were added by me. These sections describe how the data was summarized and presented in the new tidy dataset.

## Study Design
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Feature Selection

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

## Summary Choices
First of all, note that the original data described in the Feature Selection section has a total of **33 measurements**. There are 9 Mag signals, and 8 XYZ signals. Each XYZ signal corresponds to 3 separate measurements (X, Y, and Z) for a total of 24. 24 + 9 = 33 measurements total. 17 different variables are then estimated based on these measurements.

For the summary dataset, we chose to use just 2 of the 17 variables types from the original dataset -- mean() and std(). Since these two variables are applied to each of the 33 measurements, that makes a total of **66 variables**.

Furthermore, for the summary dataset we took the average of each of these 66 variables,  grouped by subject (the ID of the volunteer who carried out the experiment) and activity. Since there are 30 subjects and 6 activities (see Study Design section) -- that makes a total of 30 x 6 = **180 rows** in the summary dataset.

## Code Book
This dataset contains 68 columns, as described below.

- **subject**: Identifier for the volunteer who carried out the experiment.
- **activity**: The type of activity that the subject was engaged in. As described in the Study Design section, 6 different activities were tracked: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.
- **Average measurements**: The remaining 66 columns correspond to the 66 variables described in the Summary Choices section above. The variable names are listed below. Each variable name starts with "Avg", indicating that these are averages. The rest of the name indicates which measurement it pertains to (e.g. tBodyAccMag), and whether it is mean or standard deviation (std).

"Avg.tBodyAcc.mean.X" "Avg.tBodyAcc.mean.Y" "Avg.tBodyAcc.mean.Z" "Avg.tBodyAcc.std.X" "Avg.tBodyAcc.std.Y" "Avg.tBodyAcc.std.Z" "Avg.tGravityAcc.mean.X" "Avg.tGravityAcc.mean.Y" "Avg.tGravityAcc.mean.Z" "Avg.tGravityAcc.std.X" "Avg.tGravityAcc.std.Y" "Avg.tGravityAcc.std.Z" "Avg.tBodyAccJerk.mean.X" "Avg.tBodyAccJerk.mean.Y" "Avg.tBodyAccJerk.mean.Z" "Avg.tBodyAccJerk.std.X" "Avg.tBodyAccJerk.std.Y" "Avg.tBodyAccJerk.std.Z" "Avg.tBodyGyro.mean.X" "Avg.tBodyGyro.mean.Y" "Avg.tBodyGyro.mean.Z" "Avg.tBodyGyro.std.X" "Avg.tBodyGyro.std.Y" "Avg.tBodyGyro.std.Z" "Avg.tBodyGyroJerk.mean.X" "Avg.tBodyGyroJerk.mean.Y" "Avg.tBodyGyroJerk.mean.Z" "Avg.tBodyGyroJerk.std.X" "Avg.tBodyGyroJerk.std.Y" "Avg.tBodyGyroJerk.std.Z" "Avg.tBodyAccMag.mean" "Avg.tBodyAccMag.std" "Avg.tGravityAccMag.mean" "Avg.tGravityAccMag.std" "Avg.tBodyAccJerkMag.mean" "Avg.tBodyAccJerkMag.std" "Avg.tBodyGyroMag.mean" "Avg.tBodyGyroMag.std" "Avg.tBodyGyroJerkMag.mean" "Avg.tBodyGyroJerkMag.std" "Avg.fBodyAcc.mean.X" "Avg.fBodyAcc.mean.Y" "Avg.fBodyAcc.mean.Z" "Avg.fBodyAcc.std.X" "Avg.fBodyAcc.std.Y" "Avg.fBodyAcc.std.Z" "Avg.fBodyAccJerk.mean.X" "Avg.fBodyAccJerk.mean.Y" "Avg.fBodyAccJerk.mean.Z" "Avg.fBodyAccJerk.std.X" "Avg.fBodyAccJerk.std.Y" "Avg.fBodyAccJerk.std.Z" "Avg.fBodyGyro.mean.X" "Avg.fBodyGyro.mean.Y" "Avg.fBodyGyro.mean.Z" "Avg.fBodyGyro.std.X" "Avg.fBodyGyro.std.Y" "Avg.fBodyGyro.std.Z" "Avg.fBodyAccMag.mean" "Avg.fBodyAccMag.std" "Avg.fBodyBodyAccJerkMag.mean" "Avg.fBodyBodyAccJerkMag.std" "Avg.fBodyBodyGyroMag.mean" "Avg.fBodyBodyGyroMag.std" "Avg.fBodyBodyGyroJerkMag.mean" "Avg.fBodyBodyGyroJerkMag.std"


