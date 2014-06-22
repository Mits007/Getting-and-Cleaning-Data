# CODEBOOK FOR TIDY DATA SET
================================

The data set is a set of 180 obervations of 81 variables. Each observation corresponds to the average value of mean and std values of various measurements noted from the wearable devices for a subject who carried out a certain activity ( Subject number 1-30, Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

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
meanFreq(): Weighted average of the frequency components to obtain a mean frequency

The dataset contains the average value for the mean, std dev and meanFreq for all
the feature vectors. There are 79 such values

- *Variable Name/Format*: Subject     

*Variable Description*: Identifier of the subject who carried out the activity            

*Values*: 1 to 30         

*Position*: 1

- *Variable Name/Format*: Activity  

*Variable Description*: Activity caried out by the subject wearing the smartphone  

*Values*:
WALKING:1
WALKING_UPSTAIRS:2
WALKING_DOWNSTAIRS:3
SITTING:4
STANDING:5
LAYING:6  

*Position*: 2  

- *Variable Name/Format*: X.tBodyAcc.mean.X  

*Variable Description*: Average value of mean and std dev for various features  

*Values*: between -1 and 1  

*Position*: 3- 79  
                            
                            