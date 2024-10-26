# Wearable Data Analysis Project

## Project Overview
This project demonstrates skills in data cleaning and analysis using a dataset from accelerometer measurements of the Samsung Galaxy S smartphone. The dataset was collected as part of a study on human activity recognition, capturing various physical activities (like walking and sitting) performed by participants wearing the smartphone on their waist. The goal is to prepare a tidy dataset that can be used for further analysis, focusing on extracting meaningful insights from the accelerometer data.

## Objectives
The `run_analysis.R` script performs several tasks to process and clean the data:
1. Merges the training and test datasets to form a single data set.
2. Extracts measurements for mean and standard deviation of each measurement.
3. Replaces activity codes with descriptive activity names.
4. Labels dataset variables with descriptive names.
5. Creates a second, independent tidy dataset with the average of each variable for each activity and subject.

## Data Source
The dataset used in this project comes from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

### Citation for the Data
**Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, and Javier L. Crespo. "Human Activity Recognition Using Smartphones Data Set." UCI Machine Learning Repository.**

### Dataset Description
The dataset contains recordings of 30 study participants performing six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying). The smartphone’s accelerometer and gyroscope sensors captured various metrics related to each activity, producing a large dataset with multiple features.

- **Subjects**: 30
- **Activities**: 6 (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying)
- **Variables**: 561 features generated from sensor signals, including time and frequency domain variables.

## Repository Structure
WearableDataAnalysis/ ├── data/ # Folder for raw and processed data ├── docs/ │ ├── README.md # Overview of the project and instructions │ └── CodeBook.md # Detailed information on variables and transformations ├── scripts/ │ └── run_analysis.R # R script for data cleaning and transformation └── output/ └── tidy_dataset.txt # Final cleaned and tidy dataset


## Files Description
- **`README.md`**: This file, providing an overview of the project and usage instructions.
- **`CodeBook.md`**: Describes the dataset variables, their meanings, and the transformations applied to create the tidy dataset.
- **`run_analysis.R`**: Main R script for cleaning and processing the data, following the analysis steps.
- **`tidy_dataset.txt`**: The final output file, containing the tidy dataset created by averaging each variable for each activity and each subject.

## Prerequisites
The project requires the following R packages:
- **`dplyr`**: A data manipulation package for filtering and summarizing data.
- **`data.table`**: A package useful for efficient handling of large datasets.
  
Install the required packages by running:
```R
install.packages("dplyr")
install.packages("data.table")
Instructions for Running the Analysis
To reproduce the analysis and create the tidy dataset, follow these steps:

Clone the Repository:

Clone this repository to your local machine:
bash
Copy code
git clone https://github.com/your-username/WearableDataAnalysis.git
cd WearableDataAnalysis
Download and Extract the Data:

Download the dataset from this link.
Unzip the data, and place the folder named UCI HAR Dataset into the data/ folder in your project directory.
Run the Analysis Script:

Open run_analysis.R in RStudio.
Run the script, which will:
Load the raw data from the data/UCI HAR Dataset directory.
Merge training and test data into a single dataset.
Filter for mean and standard deviation measurements.
Replace activity codes with descriptive names.
Appropriately label the dataset variables.
Create a second tidy dataset that contains the average of each measurement for each activity and each subject.
The final tidy dataset will be saved as tidy_dataset.txt in the output/ folder.
Check the Output:

Once the script completes, you can load the tidy dataset in R to view the results:
tidy_data <- read.table("output/tidy_dataset.txt", header = TRUE)
head(tidy_data)
Analysis Steps in run_analysis.R
The run_analysis.R script follows these main steps:

Load Datasets: Load the test and training datasets, including subject and activity data.
Merge Datasets: Combine test and training sets into one comprehensive dataset.
Extract Mean and Standard Deviation: Filter to keep only the columns representing the mean and standard deviation for each measurement.
Apply Descriptive Activity Names: Replace activity codes with descriptive names like "WALKING" and "LAYING".
Label Dataset with Descriptive Variable Names: Clean up column names to make them descriptive (e.g., changing "tBodyAcc-mean()-X" to "TimeBodyAccelerometerMeanX").
Create Tidy Dataset: Aggregate the data by calculating the mean for each variable grouped by subject and activity, producing the final tidy dataset.
Example Code Snippets
Here are some examples of what the code does:

Merging Data:

# Load and merge training and test sets
merged_data <- rbind(train_data, test_data)
Filtering Mean and Standard Deviation Measurements:

# Select columns with mean and standard deviation
mean_std_data <- merged_data %>% select(contains("mean"), contains("std"))
License
This project is released under the MIT License. You may use, distribute, and modify it under the terms of the license.

Contact
For any questions, please contact:

Your Name: cheemaanureet2811@gmail.com
GitHub: reet1104