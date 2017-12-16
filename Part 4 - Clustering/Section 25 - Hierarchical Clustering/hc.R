# Hierarchical Clustering

# Read dataset

setwd("C:/Users/rahul/Documents/UserData/Online Training/Machine-Learning-Udemy/Part 4 - Clustering/Section 25 - Hierarchical Clustering")

dataset = read.csv("Mall_Customers.csv")
X = dataset[4:5]

# Using dendogram method to find optimal number of clusters
dendogram = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
plot(dendogram,
     main = paste('dendogram'),
     xlab = 'Customers',
     ylab = 'Euclidean Distances'
)
# Fitting Hierarchical clustering to mall dataset
hc = hclust(dist(X, method = 'euclidean'), method = 'ward.D')
y_hc = cutree(hc,5)
y_hc

#Visualiing the cluster
library(cluster)
clusplot(X,
         y_hc,
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
