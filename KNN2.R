library(ISLR)
library(caTools)
library(class)
library(ggplot2)

# Read data
df <- iris
head(df)
str(df)

# Scale
scaled.features <- scale(df[1:4]) 
var(scaled.features[, 1])
df <- cbind(scaled.features, df[5])
head(df)

# Split
set.seed(101)
sample <- sample.split(df$Species, SplitRatio = 0.7)
train.df <- subset(df, sample == T)
test.df <- subset(df, sample == F)

# Model
predicted <- knn(train.df[1:4], test.df[1:4], train.df$Species, k = 3)
mean(test.df$Species != predicted)

# Optimum K
predicted <- NULL
error <- NULL

for(i in 1:10) {
  set.seed(101)
  predicted <- knn(train.df[1:4], test.df[1:4], train.df$Species, k = i)
  error[i] <- mean(test.df$Species != predicted)
}

k.vals <- 1:10
error.df <- data.frame(error, k.vals)
pl<- ggplot(error.df, aes(k.vals, error)) + geom_point() + geom_line(lty = 'dotted', color = 'red')
print(pl)
