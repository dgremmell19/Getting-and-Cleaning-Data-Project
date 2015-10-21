#If necessary, set your working directory where you want the files saved, unzipped
#and written to. 
#Download data from source. 
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","files.zip")
#Unzip data into current working directory.
data <- unzip("files.zip")
#Create Vectors Related to Necessary Files
activitylabels <- read.table(data[1])
features <- read.table(data[2])
#Create vectors containing all file names related to train or test.
train <- data[grep("../train/..",data)]
test <- data[grep("../test/..",data)]
#Read in all "train" data sets. 
train_subject_test <- read.table(train[10])
train_x_test <- read.table(train[11])
train_y_test <- read.table(train[12])
#Name the X_test train columns
colnames(train_x_test) <- features$V2
#Read in all "test" data sets. 
test_subject_test <- read.table(test[10])
test_x_test <- read.table(test[11])
test_y_test <- read.table(test[12])
#Name the X_test test columns
colnames(test_x_test) <- features$V2
#Name the Y Test Columns and Activity Labels
colnames(activitylabels) <- c("ActivityID","ActivityType")
colnames(test_y_test) <- "ActivityID"
colnames(train_y_test) <- "ActivityID"
colnames(train_subject_test) <- "TestSubject"
colnames(test_subject_test) <- "TestSubject"
#Merge the Activity Labels and Y Test Data Sets
test_y_test_labeled <- merge(test_y_test,activitylabels,by="ActivityID",all.x = TRUE, sort = FALSE)
train_y_test_labeled <- merge(train_y_test,activitylabels,by="ActivityID",all.x = TRUE, sort = FALSE)
#Extract the Mean and STD Columns
mean <- grep("-mean()|-std()",features$V2)
features2 <- features[mean,]
train_x_test_subset <- train_x_test[,mean]
test_x_test_subset <- test_x_test[,mean]
mean2 <- grep("meanFreq",features2$V2,invert = TRUE)
train_x_test_subset2 <- train_x_test_subset[,mean2]
test_x_test_subset2 <- test_x_test_subset[,mean2]
#Finalize Train and Test Data Sets
traindata <- cbind(train_subject_test,train_y_test_labeled["ActivityType"],train_x_test_subset2)
testdata <- cbind(test_subject_test,test_y_test_labeled["ActivityType"],test_x_test_subset2)
#Merge Train and Test Data
alldata <- rbind(traindata,testdata)
#Subset Mean for Each Column and Subject and Activity Combination
tidydataset <- aggregate(alldata[,3:68],by = list(TestSubject = alldata$TestSubject,ActivityType = alldata$ActivityType), FUN = "mean")
#Write Tidy Data Set to Text File in current working directory. 
write.table(tidydataset,'./tidydata.txt',row.names = FALSE,quote = FALSE)
unlink(data)