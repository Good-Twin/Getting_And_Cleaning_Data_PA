# Code book
For data description see the original data:

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws

## Variables
- Subject ID
- Activity

## Data
- time_BodyAcc_mean_X
- time_BodyAcc_mean_Y
- time_BodyAcc_mean_Z
- time_BodyAcc_std_X
- time_BodyAcc_std_Y
- time_BodyAcc_std_Z
- time_GravityAcc_mean_X
- time_GravityAcc_mean_Y
- time_GravityAcc_mean_Z
- time_GravityAcc_std_X
- time_GravityAcc_std_Y
- time_GravityAcc_std_Z
- time_BodyAccJerk_mean_X
- time_BodyAccJerk_mean_Y
- time_BodyAccJerk_mean_Z
- time_BodyAccJerk_std_X
- time_BodyAccJerk_std_Y
- time_BodyAccJerk_std_Z
- time_BodyGyro_mean_X
- time_BodyGyro_mean_Y
- time_BodyGyro_mean_Z
- time_BodyGyro_std_X
- time_BodyGyro_std_Y
- time_BodyGyro_std_Z
- time_BodyGyroJerk_mean_X
- time_BodyGyroJerk_mean_Y
- time_BodyGyroJerk_mean_Z
- time_BodyGyroJerk_std_X
- time_BodyGyroJerk_std_Y
- time_BodyGyroJerk_std_Z
- time_BodyAccMag_mean
- time_BodyAccMag_std
- time_GravityAccMag_mean
- time_GravityAccMag_std
- time_BodyAccJerkMag_mean
- time_BodyAccJerkMag_std
- time_BodyGyroMag_mean
- time_BodyGyroMag_std
- time_BodyGyroJerkMag_mean
- time_BodyGyroJerkMag_std
- freq_BodyAcc_mean_X
- freq_BodyAcc_mean_Y
- freq_BodyAcc_mean_Z
- freq_BodyAcc_std_X
- freq_BodyAcc_std_Y
- freq_BodyAcc_std_Z
- freq_BodyAccJerk_mean_X
- freq_BodyAccJerk_mean_Y
- freq_BodyAccJerk_mean_Z
- freq_BodyAccJerk_std_X
- freq_BodyAccJerk_std_Y
- freq_BodyAccJerk_std_Z
- freq_BodyGyro_mean_X
- freq_BodyGyro_mean_Y
- freq_BodyGyro_mean_Z
- freq_BodyGyro_std_X
- freq_BodyGyro_std_Y
- freq_BodyGyro_std_Z
- freq_BodyAccMag_mean
- freq_BodyAccMag_std
- freq_BodyBodyAccJerkMag_mean
- freq_BodyBodyAccJerkMag_std
- freq_BodyBodyGyroMag_mean
- freq_BodyBodyGyroMag_std
- freq_BodyBodyGyroJerkMag_mean
- freq_BodyBodyGyroJerkMag_std


## Transformations
All data are extracted from the original data set. The train and test have been merged. Only those columns representing mean and standard deviation have been exctracted.
Activity and Subject are read from their respective file and merged with the other data.
Activities where encoded in the following way:


- 1 --> WALKING
- 2 --> WALKING_UPSTAIRS
- 3 --> WALKING_DOWNSTAIRS
- 4 --> WALKING_SITTING
- 5 --> WALKING_STANDING
- 6 --> WALKING_LAYING

The data are summarized by Mean over Activity and Subject_ID.
