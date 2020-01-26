library(ISLR)
library(class)
library(ggplot2)

# Read data
df <- Caravan
head(df)
str(df)
summary(df$Purchase)

# Clean and transform
any(is.na(Caravan))
var(df[, 1])
var(df[, 2])
purchase <- df[, 86]
standardized.df <- scale(df[, -86])
print(var(standardized.df[, 1]))
print(var(standardized.df[, 2]))

# Split
test.index <- 1:1000
test.data <- standardized.df[test.index, ]
test.purchase <- purchase[test.index]
train.data <- standardized.df[-test.index, ]
train.purchase <- purchase[-test.index]

# Model
set.seed(101)
predicted <- knn(train.data, test.data, train.purchase, k = 3)
error <- mean(test.purchase != predicted)
error

# Choosing K
predicted <- NULL
error <- NULL
for (i in 1:20) {
  set.seed(101)
  predicted <- knn(train.data, test.data, train.purchase, k = i)
  error[i] <- mean(test.purchase != predicted)
}

k.values <- 1:20
error.df <- data.frame(error, k.values)
pl <- ggplot(error.df, aes(k.values, error))
pl <- pl + geom_point() + geom_line(lty = 'dotted', color = 'red')
print(pl)
