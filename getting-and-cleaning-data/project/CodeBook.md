---
editor_options: 
  markdown: 
    wrap: sentence
---

# Tidy HAR Data Codebook

This code book describes how the human activity recognition data was tidied up to produce `tidy_data.txt`.

1.  `run_analysis.R` reads all the data in first.
    In particular:

    (a) It reads in activity_labels.txt to map activity ids to their descriptive names.
    (b) It reads in features.txt to know the names of the 561 observations.
    (c) It reads in the x_train data giving names to the 561 columns using the feature names. It reads in the y_train data giving the name "ActivityCode" to the single column of data. It reads in the subject_train data giving the name "Subject" to the single column of data.
    (d) It does all steps in (c) for test data.

2.  It then merges the train and test data to create one data set har_data.
    It does so by first column binding (x_train, y_train, subject_train) to create train.
    Then it column binds (x_test, y_test, subject_test) to create test.
    Then it row binds (train, test) to create har_data.

3.  It then extracts only those features whose names have either Mean or mean or std substrings in them.

4.  It then replaces the ActivityCodes by their descriptive ActivityNames read from activity_labels.txt.

5.  It then performs a series of transformations to the make the feature names less cryptic.
    In particular:

    (a) It first replaces all .. and ... with .
    (b) It removes the final . from any feature name.
    (c) "tBodyAcc.mean.X" is replaced with "mean of Acc of Body in t Domain in X direction". Other feature names with the similar pattern are replaced accordingly.
    (d) "angle.X.gravityMean" is replaced with "Angle between gravityMean and X direction". Other feature names with the similar pattern are replaced accordingly.
    (e) "tBodyAccMag.mean" is replaced with "mean of magnitude of Acc of Body in t domain". Other feature names with the similar pattern are replaced accordingly.
    (f) "angle.tBodyAccMean.gravity" is replaced with "angle between gravity and AccMean of Body in t domain".
    (g) "angle.tBodyAccJerkMean.gravityMean" is replaced with "angle between gravityMean and AccJerk of Body in t domain". Other feature names with the similar pattern are replaced accordingly.

6.  We then group by activity names and subject, and summarize all other fields by the mean.
