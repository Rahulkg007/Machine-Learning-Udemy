# Polynomial Linear Regression #

# Importing Libraries
require(tidyverse)

# Importing the dataset
setwd("C:/Users/rahul/Documents/UserData/Online Training/Machine Learning A-Z/Manual/Part 2 - Regression/Section 6 - Polynomial Regression")
dataset <- read.csv('Position_Salaries.csv')
dataset <- dataset[,2:3]

# Fitting linear regression to the data
lin_reg <- lm(formula = Salary ~ ., data = dataset)
summary(lin_reg)

# Fitting polynomial regression to the data
dataset <- mutate(.data = dataset, Level2 = Level ^ 2, Level3 = Level ^ 3, Level4 = Level ^ 4)
poly_reg <- lm(formula = Salary ~ ., data = dataset )
summary(poly_reg)

# Visualizing linear Model with ggplot
ggplot() + 
  geom_point(data = dataset, mapping = aes(x = Level, y = Salary), colour = "#756bb1") +
  geom_line(data = dataset, mapping = aes(x = Level, y = predict(lin_reg, newdata = dataset)), colour = '#fc9272') +
  ggtitle('Predicting Salary by Level (Linear Model)') +
  xlab('Levels') + 
  xlab('Salary')

# Visualizing Polynomial Model with ggplot
ggplot() + 
  geom_point(data = dataset, mapping = aes(x = Level, y = Salary), colour = "#756bb1") +
  geom_smooth(data = dataset, mapping = aes(x = Level, y = predict(poly_reg, newdata = dataset)), 
              colour = '#fc9272', se = FALSE) +
  ggtitle('Predicting Salary by Level (Linear Model)') +
  xlab('Levels') + 
  xlab('Salary')

# Predicting a new result using linear regression
y_pred <- predict(object = lin_reg, newdata = data.frame(Level = 6.5))

# Predicting a new result using polynomial regression
y_pred <- predict(object = poly_reg, newdata = data.frame(Level = 6.5, 
                                                          Level2 = 6.5 ^ 2, 
                                                          Level3 = 6.5 ^ 3, 
                                                          Level4 = 6.5 ^ 4))
