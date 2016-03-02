
This R script performs following steps, as per project assignment instructions
 - Merges the training and the test sets to create one data set.
 - Extracts only the measurements on the mean and standard deviation for each measurement.
 - Uses descriptive activity names to name the activities in the data set
 - Appropriately labels the data set with descriptive activity names.
 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
Script Execution
 -	The script checks for existence of the folder: D:/Data Science/getting&CleaningData/project.
 -	If it does not exists, then it creates the subdirectory: project under directory: D:/Data Science/getting&CleaningData.
 -	It then downloads and unzips all relevant datafiles
 -	In your R enviroment, set your working directory to be: setwd(“D:/Data Science/getting&CleaningData/project”)
 -	Load the script: source(‘run_analysis.R’)
 -	The end result will be a file called final_tidy_dataset.txt’ in the woirking directory.
 -	final_tidy_dataset.csv mirrors the .txt file in .csv format.
 -	whole_interm_descriptive_activity_names.csv is an intermediate file used during the analysis.
 -	final tidy dataset Each row in the final, clean dataset contains subject, activity, and measures for all required features (i.e., mean or standard deviation).
