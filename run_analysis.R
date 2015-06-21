library(reshape2)

#reading all necessary data sets from files given
xtrain       <- read.table("UCI HAR Dataset/train/X_train.txt")
xtest        <- read.table("UCI HAR Dataset/test/X_test.txt")
ytrain       <- read.table("UCI HAR Dataset/train/y_train.txt")
ytest        <- read.table("UCI HAR Dataset/test/y_test.txt")
subtrain     <- read.table("UCI HAR Dataset/train/subject_train.txt")
subtest      <- read.table("UCI HAR Dataset/test/subject_test.txt")
features     <- read.table("UCI HAR Dataset/features.txt")[,2]
activities   <- read.table("UCI HAR Dataset/activity_labels.txt")

#merging x, y and subject data for train and test data
x       <- rbind(xtrain, xtest)
y       <- rbind(ytrain, ytest)
subject <- rbind(subtrain, subtest)

#set column names for x, y, subject and activities data frames
colnames(x)          <- features
colnames(y)          <- "activityid"
colnames(subject)    <- "subject"
colnames(activities) <- c("activityid", "activity")

#make vector of fatures for mean and standard deviation measures
what <- union(grep("-mean\\(\\)", features, value=TRUE),
              grep("-std\\(\\)", features, value=TRUE))


#select columns from x 
x <- x[,what]

#merge activity data set with labels
y <- merge(y, activities)

#merge measurements with activity labels
dataforsaving <- cbind(x, y["activity"])

#save first result data to csv
write.table(dataforsaving, "measurementsofmeanandstd.txt", row.names = FALSE)

#join first data set with subject ids
datamelt <- cbind(dataforsaving, subject)

#xum ov means for unique subject and activity
datamelt       <- melt(datamelt, id=c("subject", "activity"))
dataforsaving2 <- dcast(datamelt, activity + subject ~ variable, mean)

#write second data set to csv file
write.table(dataforsaving2, 'activitybysubjectmeans.txt', row.names = FALSE)


