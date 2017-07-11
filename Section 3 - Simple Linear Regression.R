#Import Data
setwd("C:/Users/rahul/Documents/UserData/Online Training/Machine Learning A-Z/Part 2 - Regression/Section 4 - Simple Linear Regression")
dataset <- read.csv("Salary_Data.csv")

#Splitting the dataset into training and test set
require(caTools)

set.seed(123)
split <- sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

#Fitting the linear regression model
regressor <- lm(formula = Salary ~ YearsExperience, data = training_set)

#Predicting the test set result
y_pred <- predict(regressor, newdata = test_set)

#Visualizing the training set results
ggplot() +
  geom_point(data = training_set, mapping = aes(x=YearsExperience, y = Salary), colour = "Red") +
  geom_line(mapping = aes(x=training_set$YearsExperience, y = predict(regressor, newdata = training_set)), colour = "grey") +
  ggtitle("Salary vs Experience (Training Set)") +
  xlab('Years of Experience') +
  ylab('Salary')

#Visualizing the Test set results
ggplot() +
  geom_point(data = test_set, mapping = aes(x=YearsExperience, y = Salary), colour = "Red") +
  geom_line(mapping = aes(x=training_set$YearsExperience, y = predict(regressor, newdata = training_set)), colour = "grey") +
  ggtitle("Salary vs Experience (Test Set)") +
  xlab('Years of Experience') +
  ylab('Salary')
