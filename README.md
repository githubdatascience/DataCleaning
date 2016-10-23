# DataCleaning
Getting and Cleaning Data Course Project

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. Average time and frequencies were further computed and captured on a tidy data set for each subject and each activiy.

For each record it is provided:
======================================

- An identifier of the subject who carried out the experiment.
- Its activity label.
- A 66-feature vector with mean time and mean frequency domain variables.


The dataset includes the following files:
=========================================

- 'README.md': this file.
- 'CodeBook.md': Shows information about the variables used on the feature vector.
- 'run_analysis.R': Code to get the tidy dataset from the original one (see Acknowledgments).
- 'tidy_dataset.txt': (not here)


Notes: 
======

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.


Acknowledgments:
================

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
