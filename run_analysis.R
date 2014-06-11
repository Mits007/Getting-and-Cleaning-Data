run_analysis<-function(){
    
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                  "./data_file",method = "curl")
    unzip("./data_file")
    
    # read the features.txt file for names of means and std dev
    features = read.table("./UCI HAR DataSet/features.txt", sep = "\t", 
                          stringsAsFactors = FALSE)
    # Clean up the names -> remove the numbers and brackets
    features$V1 = gsub("^[0-9]*|\\(|\\)", "", features$V1)
    
    # read the activity_labels.txt file for names of all the activities
    activity_labels = read.table("./UCI HAR DataSet/activity_labels.txt", sep = "\t", 
                                 stringsAsFactors = FALSE)
    # split the activity levels and labels and convert it to a matrix
    labels.split = sapply(strsplit(activity_labels$V1, " "), unlist)
    
    ## TRAIN DATA
    Subject_train = read.table("./UCI HAR Dataset/train/subject_train.txt", 
                               sep = " ", header = FALSE, colClass = "integer")
    X_train = read.table("./UCI HAR Dataset/train/X_train.txt", 
                         sep = "\t", stringsAsFactors = FALSE)
    Y_train = read.table("./UCI HAR Dataset/train/y_train.txt", 
                         sep = " ", header = FALSE, colClass = "factor")
    
    # remove extra blank spaces from X_train data
    X_train$V1 = gsub("^ +", "", X_train$V1) #Remove 2 spaces at the beginning of line
    X_train$V1 = gsub(" +", " ", X_train$V1) #Remove 2 spaces in the middle of line
    # split the data into 561 characters
    train_data <- strsplit(X_train$V1, " ")
    # unlist the data, create a data frame with the mean and std dev values ( 1-6 columns)
    train_data_new = t(sapply(train_data, unlist))
    train.data.df = as.data.frame(train_data_new)
    # create a data frame with the subject number, activity name and mean 
    # and std dev data
    names(train.data.df) = make.names(features$V1)
    
    
    ## TEST DATA
    Subject_test = read.table("./UCI HAR Dataset/test/subject_test.txt", 
                              sep = " ", header = FALSE, colClass = "integer")
    X_test = read.table("./UCI HAR Dataset/test/X_test.txt", 
                        sep = "\t", stringsAsFactors = FALSE)
    Y_test = read.table("./UCI HAR Dataset/test/y_test.txt", 
                        sep = " ", header = FALSE, colClass = "factor")
    
    # remove extra blank spaces from X_train data
    X_test$V1 = gsub("^ +", "", X_test$V1) #Remove 2 spaces at the beginning of line
    X_test$V1 = gsub(" +", " ", X_test$V1) #Remove 2 spaces in the middle of line
    # split the data into 561 characters
    test_data <- strsplit(X_test$V1, " ")
    # unlist the data, create a data frame
    test_data_new = t(sapply(test_data, unlist))
    test.data.df = as.data.frame(test_data_new)
    
    # create a data frame with the subject number, activity name and mean 
    # and std dev data
    names(test.data.df) = make.names(features$V1)
    
    
    # Combine test and train data
    df = rbind(train.data.df, test.data.df)
    # Extract only the mean and std dev values
    df = df[, grepl("mean|std", names(df))]
    
    # Attach the subject # and activity name
    df_subject = rbind(Subject_train, Subject_test)
    df_activity = rbind(Y_train, Y_test)
    
    df = cbind(df_subject, df_activity, df)
    names(df)[1] = "Subject"
    names(df)[2] = "Activity"
    
    
    # Appropriately name the activites
    df$Activity = factor(df$Activity, levels = levels(df$Activity), 
                         labels = labels.split[2,], ordered = FALSE)
    
    # create indepent, tidy data set with the average of each variable for each 
    # activity and each subject
    
    df_new = aggregate(.~ Subject+Activity, data = df, mean)
    df_order = df_new[order(df_new$Subject),]
    write.table(df_order, "./tidy_dataset.csv", sep = ",", qmethod = "double", 
                row.names = FALSE)
}