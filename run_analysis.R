library(sqldf)
features = read.table("features.txt")
features = read.table("features.txt")
x_train = read.table("train/X_train.txt", col.names=features$V2)
train = x_train[c(1:6)]
y_train = read.table("train/y_train.txt")
x_test = read.table("test/X_test.txt", col.names=features$V2)
test = x_test[c(1:6)]
y_test = read.table("test/y_test.txt")
subject_test = read.table("test/subject_test.txt")
subject_train = read.table("train/subject_train.txt")
train_labels = sqldf("select * from y_train join activity_labels on y_train.V1=activity_labels.V1")
test_labels = sqldf("select * from y_test join activity_labels on y_test.V1=activity_labels.V1")
train$activity = train_labels$V2
test$activity = test_labels$V2
train$subject = subject_train$V1
test$subject = subject_test$V1
data = rbind(test,train)
cols = names(data)[-(7:8)]
tidy = aggregate(data[cols],list(data$subject, data$activity), mean)
colnames(tidy) = c("Subject","Activity","Avg_mean_X","Avg_mean_Y","Avg_mean_Z","Avg_std_X","Avg_std_Y","Avg_std_Z")
write.table(tidy,file="tidy.txt", row.names=FALSE)
