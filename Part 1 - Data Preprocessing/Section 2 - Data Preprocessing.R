# Importing Libraries
require(tidyverse)
require(caTools)

# Importing the dataset
setwd("C:/Users/rahul/Documents/UserData/Online Training/Machine Learning A-Z/Manual/Part 2 - Regression/Section 9 - Random Forest Regression")
dataset <- read.csv('Position_Salaries.csv')
# dataset <- dataset[,2:3]

#Splitting the dataset into training and test set
require(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)
