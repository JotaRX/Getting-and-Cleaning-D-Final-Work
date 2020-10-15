
Description of Scrip 'run_analysis.R'

# Main Variables

Activity: Correspond with the activity for the sample
Subj: Is the subject that take the experiment, there are 30 men

# Main Data Bases

Datas Train: It is of the subjects that make a trains

Datas Test: It is of the subjects that make a test

TotalMeanStd: Is the first data filtered by Means and standard desviation

MeanDB: This Data is the means by subject and activity

Total: is the big Data Base with all information with the 561 variables and all activities of subjects

MeanDB.txt - Is the same MeanDB.csv but in text format

# Process

the work was
Charge the files on root features and activity labels
Charge the files on Train
combine 3 tabs in one
Charge the files on Test
combine 3 tabs in one
Combine TestTotal & TrainTotal
Select only variables with mean and std
Use labels for Activity
open reshape2 package for prepare the second Data Base
Create a new DB with Means for each Subject and Activity
First Create a large Base
Now create de Mean Base

# All Variables

"ActivityLabels" "Features"       "InterDB"        "MeanDB"         "SubjectTest"    "SubjectTrain"  
 "TestTotal"      "Total"          "TotalMeanStd"   "TrainTotal"     "XTest"          "XTrain"         "YTest"         
 "YTrain"    

# Assignamented Process

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
