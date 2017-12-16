# K-means Clustering

# Read dataset

setwd("C:/Users/rahul/Documents/UserData/Online Training/Machine-Learning-Udemy/Part 4 - Clustering/Section 24 - K-Means Clustering")

dataset = read.csv("Mall_Customers.csv")
X = dataset[4:5]

# Using elbow method to find optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) {
  wcss[i] = sum(kmeans(X,i)$withinss)
}

plot(1:10, wcss, type = 'b')
# Optimal Number of cluster should be 5

# Applying K-means to Mall Dataset
set.seed(29)
kmeans = kmeans(X, 5, iter.max = 300, nstart = 10)

#Visualiing the cluster
library(cluster)
clusplot(X,
  kmeans$cluster,
  lines = 0,
  shade = TRUE,
  color = TRUE,
  labels = 2,
  plotchar = FALSE,
  span = TRUE,
  main = paste('Cluster of clients'),
  xlab = 'Annual Income',
  ylab = 'Spending Score'
)
