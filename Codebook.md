# Codebook for tidy_data.txt

Author: Edwin Sillence

Filename: tidy_data.txt

File Location: https://github.com/EdwinSillence/GetNClean.git

Version: 1.0

Date: 27 December 2015

## Introduction

The following codebook describes a processed dataset - tidy_data.txt - derived from the 2012 "Human Activity Recognition Using Smartphones Data Set".

The original Human Activity dataset, including a description of the study, can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The tidy_data.txt file (the subject of this codebook) was produced by:

1. combining the original test and training data into one file.
2. taking a subset containing only activity, subject and a limited set of feature variables (the means and standard deviations).
3. Reshaping ("gathering") the data from wide format to narrow format, so that each observation (a single Measurement of a Feature during an Activity by a Subject) was on its own row.
4. Summarising the data down to a mean value for each Activity-Subject-Feature triplet.

## Dataset Description

The tidy_data dataset contains 11880 observations on 4 variables, in one 'single space' delimited file tidy_data.txt. Each observation is a single Measurement of a Feature during an Activity by a Subject.

## Variables

Variable Number  | Variable Name   | Description
-------------    | -------------   | -----------
1 | Activity  | A string from the list: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS. It indicates the activity the person was doing at the time the measurement was taken, verified by video. 
2 | Subject   | An integer between 1 to 30, indicating one of the thirty test subjects.
3 | Feature   | A string name representing a particular data feature captured by the Samsung S II's sensors.
4 | mean(Measurement)   | A numeric (positive or negative, to 15 decimal places), representing the mean value of that feature, for a given test subject doing a specific activity.

## Feature-Measurement Pairs Explained

For more on the meaning of included feature variables, see the below description (an edited version of the orginal data's Codebook):

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals (prefix 'time_domain') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (labels include body_acceleration gravity_accelaration) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (labels include jerk). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (labels include magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals (prefix frequency_domain). 

These signals were used to estimate variables of the feature vector for each pattern: the suffixes '-x, -y, -z' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation