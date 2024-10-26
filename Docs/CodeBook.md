# CodeBook for Wearable Data Analysis Project

## 1. Overview
This codebook describes the dataset variables, data sources, and transformations applied to create the final tidy dataset used in the Wearable Data Analysis Project. The analysis was performed on the Human Activity Recognition Using Smartphones Dataset, which includes accelerometer and gyroscope data collected from a group of 30 participants performing various physical activities.

## 2. Original Dataset Information

- **Source**: [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
- **Original Study**: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, and Javier L. Crespo. "Human Activity Recognition Using Smartphones Data Set."
- **Device Used**: Samsung Galaxy S smartphone
- **Sensors**: Accelerometer and gyroscope, collecting data at 50 Hz
- **Participants**: 30
- **Activities**: 
  - Walking
  - Walking Upstairs
  - Walking Downstairs
  - Sitting
  - Standing
  - Laying
- **Variables**: The dataset includes 561 variables derived from accelerometer and gyroscope measurements in both time and frequency domains.

## 3. Data Processing Steps

The transformations applied to the dataset are documented below, corresponding to each step in `run_analysis.R`.

### Step 1: Merging the Training and Test Sets

The training and test sets were merged to create a single dataset:
- Files used:
  - **Training Set**: `train/X_train.txt`, `train/y_train.txt`, `train/subject_train.txt`
  - **Test Set**: `test/X_test.txt`, `test/y_test.txt`, `test/subject_test.txt`
- Columns for **subject** and **activity** were added to the main dataset from the `subject_train/test.txt` and `y_train/test.txt` files.
  
### Step 2: Extracting Measurements on Mean and Standard Deviation

Only measurements on the mean and standard deviation for each measurement were extracted, narrowing the dataset to include only the following:
- Columns containing `-mean()` or `-std()` in their names, as listed in `features.txt`.

### Step 3: Applying Descriptive Activity Names

The activity labels were replaced with descriptive names based on `activity_labels.txt`:
- Original values: 1, 2, 3, 4, 5, 6
- Descriptive activity names:
  - `1` = "WALKING"
  - `2` = "WALKING_UPSTAIRS"
  - `3` = "WALKING_DOWNSTAIRS"
  - `4` = "SITTING"
  - `5` = "STANDING"
  - `6` = "LAYING"

### Step 4: Labeling the Dataset with Descriptive Variable Names

The following changes were made to improve the readability of variable names:
- Prefixes:
  - `t` was changed to `Time` to denote time-domain signals.
  - `f` was changed to `Frequency` to denote frequency-domain signals.
- Abbreviations Expanded:
  - `Acc` to `Accelerometer`
  - `Gyro` to `Gyroscope`
  - `Mag` to `Magnitude`
  - `BodyBody` was corrected to `Body`
- Suffixes such as `-mean()` and `-std()` were changed to `Mean` and `STD`, respectively.

Example name transformations:
- Original: `tBodyAcc-mean()-X`
- New: `TimeBodyAccelerometerMeanX`

### Step 5: Creating a Tidy Dataset

The tidy dataset was created by calculating the average of each variable for each activity and each subject:
- The final dataset includes **180 rows** (30 subjects × 6 activities) and **68 columns** (mean values for each selected measurement).
- Saved as `tidy_dataset.txt`.

## 4. Final Tidy Dataset Structure

The final tidy dataset has the following structure:

### Columns
1. **subject**: ID of the subject performing the activity (ranges from 1 to 30).
2. **activity**: The activity label, with one of the following values:
   - "WALKING"
   - "WALKING_UPSTAIRS"
   - "WALKING_DOWNSTAIRS"
   - "SITTING"
   - "STANDING"
   - "LAYING"

3. **Measurement Variables**: The mean of each selected feature for each subject and activity combination.

Example of the variables included in the final tidy dataset:
- `TimeBodyAccelerometerMeanX`
- `TimeBodyAccelerometerMeanY`
- `TimeBodyAccelerometerMeanZ`
- `TimeBodyAccelerometerSTD...` (for standard deviations)
- `FrequencyBodyAccelerometerMean...` (for frequency-domain features)

### Summary of Variables
The following groups of features are included, each representing the mean of multiple measurements for the subject and activity:

- **TimeDomain Body Accelerometer**:
  - `TimeBodyAccelerometerMeanX`, `TimeBodyAccelerometerMeanY`, `TimeBodyAccelerometerMeanZ`
  - `TimeBodyAccelerometerSTDX`, `TimeBodyAccelerometerSTDY`, `TimeBodyAccelerometerSTDZ`

- **FrequencyDomain Body Accelerometer**:
  - `FrequencyBodyAccelerometerMeanX`, `FrequencyBodyAccelerometerMeanY`, `FrequencyBodyAccelerometerMeanZ`
  - `FrequencyBodyAccelerometerSTDX`, `FrequencyBodyAccelerometerSTDY`, `FrequencyBodyAccelerometerSTDZ`

- **TimeDomain Body Gyroscope**:
  - `TimeBodyGyroscopeMeanX`, `TimeBodyGyroscopeMeanY`, `TimeBodyGyroscopeMeanZ`
  - `TimeBodyGyroscopeSTDX`, `TimeBodyGyroscopeSTDY`, `TimeBodyGyroscopeSTDZ`

- **Magnitude Variables** (computed magnitudes of the three-dimensional signals):
  - `TimeBodyAccelerometerMagnitudeMean`, `TimeBodyAccelerometerMagnitudeSTD`
  - `FrequencyBodyAccelerometerMagnitudeMean`, `FrequencyBodyAccelerometerMagnitudeSTD`

- **Additional Variables**:
  - Similar time and frequency domain variables for `GravityAccelerometer`, `BodyAccelerometerJerk`, and `BodyGyroscopeJerk`.

## 5. Notes on Data Transformations
- The `mean` function was applied to aggregate each variable for each activity and subject combination.
- Non-numeric characters like parentheses and hyphens were removed or replaced to improve readability and compatibility with R syntax.

## 6. License and Citation
This project is licensed under the MIT License. You may use, modify, and distribute it under the terms of the license.

The original dataset authors:
**Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, and Javier L. Crespo. "Human Activity Recognition Using Smartphones Data Set." UCI Machine Learning Repository.**
