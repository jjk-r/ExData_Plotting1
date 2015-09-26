# The script uses read.table() function to load data in files into respective data structures.
# Only columns 1 through 6 (pertaining to the mean and standard deviation for each measurement)
# are retained from the main data sets (X_train and X_test).
# The sqldf package is employed to fetch subjects and activity labels from the respective files.
# New columns are created for subject and activity in both train and test data frames.
# These data frames are merged with rbind().
# An independent tidy data set with the average of each variable for each activity and each
# subject is created using aggregate() function. The columns are given descriptive names.
# The data set is written into a text file.

# Code Book:
# Subject - The subject who performed the activity as identified by a number in the range 1:30
# Activity - The name of the activity performed
# Avg_mean_X - Per subject and activity, the average of mean values of X signals
# Avg_mean_Y - Per subject and activity, the average of mean values of Y signals
# Avg_mean_Z - Per subject and activity, the average of mean values of Z signals
# Avg_std_X - Per subject and activity, the average of standard deviation in X signals
# Avg_std_Y - Per subject and activity, the average of standard deviation in Y signals
# Avg_std_Z - Per subject and activity, the average of standard deviation in Z signals
