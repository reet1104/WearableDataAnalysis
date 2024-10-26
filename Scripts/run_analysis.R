# Step 1: Download and unzip data (placeholder code)
options(timeout = 120)  
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./Data/dataset.zip")
unzip("./data/dataset.zip", exdir = "./data")

# Step 2: Load datasets into R (placeholder code)
# Load feature and activity labels
features <- read.table("./data/UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Load training data
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Load test data
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names = "code")


# Step 3: Merge training and test datasets (placeholder code)
train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)
combined_data <- rbind(train, test)


# Step 4: Extract mean and standard deviation for each measurement (placeholder code)
mean_std_columns <- grep(".*mean.*|.*std.*", features$functions)
selected_columns <- c(1, 2, mean_std_columns + 2)  # Adding 2 to include `subject` and `activity`
extracted_data <- combined_data[, selected_columns]


# Step 5: Use descriptive activity names (placeholder code)
extracted_data$code <- activities[extracted_data$code, 2]
colnames(extracted_data)[2] <- "activity"


# Step 6: Appropriately label dataset with descriptive variable names (placeholder code)
names(extracted_data) <- gsub("^t", "Time", names(extracted_data))
names(extracted_data) <- gsub("^f", "Frequency", names(extracted_data))
names(extracted_data) <- gsub("Acc", "Accelerometer", names(extracted_data))
names(extracted_data) <- gsub("Gyro", "Gyroscope", names(extracted_data))
names(extracted_data) <- gsub("Mag", "Magnitude", names(extracted_data))
names(extracted_data) <- gsub("BodyBody", "Body", names(extracted_data))


# Step 7: Create a second independent tidy dataset with averages (placeholder code)
library(dplyr)
final_data <- extracted_data %>%
  group_by(subject, activity) %>%
  summarize_all(mean)

write.table(final_data, "./data/tidy_dataset.txt", row.name = FALSE)

