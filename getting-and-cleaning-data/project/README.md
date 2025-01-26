# Tidy Data of Human Activity Recognition Using Smartphones Dataset

Version 1.0

Arun Chandrashekharapuram\
Course Project Getting and Cleaning Data Course\
Coursera Data Science Specialization\
\
This data has been obtained by tidying up the human activity recognition data.

# HUMAN ACTIVITY RECOGNITION DATA

uci-har-dataset contains the original data produced by an experiment carried out with a group of 30 volunteers (the subjects, numbered from 1 to 30). \
Each person performed six activities: \
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. \
The list of these activities is provided in `activity_labels.txt`.

The original dataset has been randomly partitioned into two sets - the train and the test. \
The train has 21 volunteers (70%) chosen randomly from the 30 volunteers. \
The file `uci-har-dataset/train/subject_train.txt` has the list of these train subject ids. \
The test has the remaining 9 volunteers (30%). \
The file `uci-har-dataset/test/subject_test.txt` has the list of these test subject ids.

The file `uci-har-dataset/features.txt` has a list of 561 features / variables. \
Each observation in the train or test data is a record with 561 features.

`uci-har-dataset/train/X_train.txt` has 7352 observations. \
`uci-har-dataset/train/y_train.txt` has 7352 activity ids, one each for every observation in `X_train.txt`. \
`uci-har-dataset/train/subject_train.txt` has 7352 subject ids, one each for every observation in `X_train.txt`. \
\
`uci-har-dataset/test/X_test.txt` has 2947 observations. \
`uci-har-dataset/test/y_test.txt` has 2947 activity ids, one each for every observation in `X_test.txt`.\
`uci-har-dataset/test/subject_test.txt` has 2947 subject ids, one each for every observation in `X_test.txt`.

# PROCESSING

`run_analysis.R` reads the above data, processes and tidies them up (as discussed in `CodeBook.md`), and outputs the tidy data in `tidy_data.txt`. The script must be run in the same directory in which `uci-har-dataset` is present.

# FILES IN THE PROJECT

The following files have been created in this project:

-   '*README.md*': read this first.

-   '*CodeBook.md*': a description of the data including variables and how the human recognition data was cleaned to arrive at the tidy data.

-   '*tidy_data.txt*': the tidied data produced according to the codebook.

-   '*run_analysis.R*': the R script that tidies the human activity recognition data.

# Notes

-   The original data is in the directory `uci-har-dataset`.
-   The script `run_analysis.R` must be run in the same directory as that of `uci-har-dataset`.

# License

Please refer to the original license of the human activity recognition data in the uci-har-dataset directory. `run_analysis.R` cannot be used without permission from the creator and Coursera.

Arun Chandrashekharapuram, Student, Coursera.
