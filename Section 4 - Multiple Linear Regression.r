# Multiple Linear Regression

# Importing the dataset
setwd("C:/Users/rahul/Documents/UserData/Online Training/Machine Learning A-Z/Part 2 - Regression/Section 5 - Multiple Linear Regression/Multiple_Linear_Regression")
dataset = read.csv('50_Startups.csv')

#Encoding Categorical Variable
dataset$State <- factor(x = dataset$State,
                        levels = c('New York','California','Florida'),
                        labels = c(1,2,3)
                        )

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

 # Fitting multiple linear regression to the training set

