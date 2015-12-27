# Getting and Cleaning Data - Course Project

Author: Edwin Sillence

## Repo Contents

This repo contains:
* input data (activity_labels.txt, features.txt, subject_test.txt, subject_train.txt, X_test.txt, X_train.txt, y_test.txt, y_train.txt),
* an R script to analyse that data (run_analysis.R),
* an output file (tidy_data.txt), and
* a codebook (Codebook.md).

## How the run_analysis.R Script Works

The run_analysis.R script requires the input data to be in its working directory and does the following:

Merges subject_train.txt, y_train.txt and X_train.txt.

Merges subject_test.txt, y_test.txt and X_test.txt.

Appends the two datasets to form a new dataset.

Labels the variables from left to right as "Subject", "Activity" and the feature names from features.txt.

Creates a subset of data containing only the "Subject" and "Activity" variables, plus feature variables representing means ( -mean() ) and standard deviations ( -std() ).

Replaces the numeric Activity values with text equivalents drawn from activity_labels.txt. Moves the Activity column to the left.

Renames the feature variable's by expanding abbreviations to full words, separated by underscores.

Reshapes ("gathers") the data from wide format to long/narrow format, so that each observation (a single Measurement of a Feature during an Activity by a Subject) is on its own row.

Summarises the data down to a mean value for each Activity-Subject-Feature triplet.

Writes the resulting data set out to a 'space-delimited' text file called tidy_data.txt.

FINISH


