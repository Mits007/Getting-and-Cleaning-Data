# Description of run_analysis script

Following are the steps followed in the run_analysis script to create a tidy 
data set

1. Download and unzip the data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

2. The features names are availabe in the file - 
    - UCI HAR Dataset/features.txt: This file is read with the read.table function. 
    - Once the feature names are read, the next step was the clean up the names. The names were in the following format : 1 tBodyAcc-mean()-X. In order to clean the names, I used the gsub function to remove the numbers and brackets in the names. There were 561 unique names in the features.txt file. 

3. All the activity names ( WALKING, WALKING_UPSTAIRS etc) were availabe in the file - 
    - UCI HAR Dataset/activity_labels.txt: This file was also read with the help of read.table function. 
    - The names were in the format - 1 WALKING, 2 WALKING_UPSTAIRS etc. where the numbers ( 1:6) corresponded to the activity number recorded for each subject. The data was split into numbers and the corresponding names using the strsplit function in order to get a list of number - activity name pair which will be used later to replace the numbers from the data
    
4. READING THE TRAIN DATA
    - The train data was available in the following three files :
    1. UCI HAR Dataset/train/Subject_train: This is a list of the subject numbers ( numbers from 1- 30). This file was simply read using the read.table function
    2. UCI HAR Dataset/train/y_train.txt: This file contained the activity number (1 to 6 corresponding to activitirs - WALKING, WALKING_UPSTAIRS etc). This file was also read using read.table file
    3. UCI HAR Dataset/train/X_train.txt: This file contained all the data for 561 features for all the subjects listed in Subject_train.txt file. This file was read using the read.table function but the output was a large list of 7352 lines. The lines had 561 characters but the data had to be separated in order to get the reading for each of the 561 features. 
    4. Cleaning and splitting the the X_train data
        Looking at the data, the 561 readings were either separated by double spaces or single spaces. Every line also had two spaces in the beginning. Splitting the line by single spaces resulted in a few readings that were just emplty spaces. So, it was important to have a string that had all the 561 data points separated by single spaces. I used the gsub function twice, once to remove the double spaces from the beginning of the line and then from anywhere in the line. 
        The second step was to split the string into 561 distinct values. The strsplit function was used for this purpose. The strsplit function produces a "list" which was unlist using unlist function. However, the unlist function produced a matrix with 561 rows and 7352 columns. So the next step was to transpose the matrix and convert it to a data frame using data.frame function. 
        The third step was to attach a name to all the 561 activities. The names were available in the features.txt file that we had read in step 2. make.names function was used to convert the names into syntactically valid names. 
        
5. READING THE TEST DATA 
    - The test data is available in UCI HAR Dataset/test folder. 
    - Use the exact same steps as used for train data to obtain the test data. 
    - The test data had 2947 observations
    
6. Once all the train and test data is read, use rbind function to combine the two datasets
7. We need only the measurements for mean and std dev for each feature. Hence, only the columns where the column names have "mean" or "std" were filtered using the grepl function. This resulted in 79 columns ( down from 561 initial columns)
8. The subject number for  train and test data was combined using the rbind function
9. Similarly the activity numbers were combined using the rbind function
10. Finally the Subject #, Activity # and the actual data for train and test was combined using the cbind function. The final dataset had 10299 observations and 81 variables ( 1 for Subject #, 1 for Activity # and 79 measurements for mean and std.). The data frame is named df
11. The activity numbers in the Activity column were replaced by their corresponding names extracted from activity_labels.txt file ( as described in Step 3)
12. A new data set is created from the data frame in step 12 with average for each of the 79 variable by the subject name and activity level using the "aggregate" function. This data frame is named df_new
13. The "df_new" data frame was sorted on the basis of the subject number to make it look more readable. The ordered data frame is called "df_order""
14. As the final step, the data frame df_order was written in a .csv file using the write.table function. 