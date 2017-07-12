# Linear Regression #

# Importing Libraries
require(tidyverse)
require(caTools)

# Importing the dataset
setwd("C:/Users/rahul/Documents/UserData/Online Training/Machine Learning A-Z/Manual/Part 2 - Regression/Section 6 - Polynomial Regression")
dataset <- read.csv('Position_Salaries.csv')
dataset <- dataset[,2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
# set.seed(123)
# split = sample.split(dataset$Profit, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting regression to the data
# Regression Model

# Predicting a new result using polynomial regression
y_pred <- predict(object = regressor, newdata = data.frame(Level = 6.5))

# Visualizing Regression Model with ggplot ( For Higer Ressolution and smoother curve)
x_grid <- seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() + 
  geom_point(data = dataset, mapping = aes(x = Level, y = Salary), colour = "#756bb1") +
  geom_smooth(data = dataset, mapping = aes(x = Level, y = predict(regressor, newdata = data.frame(Level = x_grid))), 
              colour = '#fc9272', se = FALSE) +
  ggtitle('Regression Model') +
  xlab('Levels') + 
  xlab('Salary')

