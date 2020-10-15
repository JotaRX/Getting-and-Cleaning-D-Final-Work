# 1. Charge the files on root features and activity labels
# 2. Charge the files on Train
Features <- read.table(
  "./UCI HAR Dataset/features.txt"
  ,
  header = F,
  col.names = c("N", "signal")
)
ActivityLabels <- read.table(
  "./UCI HAR Dataset/activity_labels.txt"
  ,
  header = F,
  col.names = c("Activity", "Label")
)
SubjectTrain <-
  read.table(
    "./UCI HAR Dataset/train/subject_train.txt",
    header = F,
    col.names = "Subj"
  )
XTrain <-
  read.table("./UCI HAR Dataset/train/X_train.txt",
             header = F,
             col.names = Features[, 2])
YTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt",
                     header = F
                     ,
                     col.names = "Activity")
#combine 3 tabs in one
TrainTotal <- cbind(XTrain, YTrain, SubjectTrain)
# 3. Charge the files on Test
Features <- read.table(
  "./UCI HAR Dataset/features.txt"
  ,
  header = F,
  col.names = c("N", "signal")
)
ActivityLabels <- read.table(
  "./UCI HAR Dataset/activity_labels.txt"
  ,
  header = F,
  col.names = c("Activity", "Label")
)
SubjectTest <-
  read.table("./UCI HAR Dataset/Test/subject_Test.txt",
             header = F,
             col.names = "Subj")
XTest <- read.table("./UCI HAR Dataset/Test/X_Test.txt",
                    header = F,
                    col.names = Features[, 2])
YTest <- read.table("./UCI HAR Dataset/Test/Y_Test.txt",
                    header = F
                    ,
                    col.names = "Activity")
#combine 3 tabs in one
TestTotal <- cbind(XTest, YTest, SubjectTest)

#Combine TestTotal & TrainTotal
Total <- rbind(TestTotal, TrainTotal)

#Select only variables with mean and std
TotalMeanStd <-
  dplyr::select(
    Total,
    Subj,
    Activity,
    grep("[Mm]ean", names(Total), value = T),
    grep("std", names(Total), value = T),-grep("meanFreq", names(Total), value = T)
  )

#Use labels for Activity
ActivityF <- factor(TotalMeanStd$Activity)
levels(ActivityF) <- ActivityLabels$Label
TotalMeanStd$Activity <- ActivityF

#open reshape2 package for prepare the second Data Base
library("reshape2")

# Create a new DB with Means for each Subject and Activity
#First Create a large Base
InterDB <- melt(TotalMeanStd, id.vars = c("Subj", "Activity"))
#Now create de Mean Base
MeanDB <- dcast(InterDB, Subj + Activity ~ variable, mean)

#Export the two Data Bases in Csv format
write.csv(MeanDB, "./MeanDB.csv")
write.csv(TotalMeanStd, "./TotalMeanStd.csv")