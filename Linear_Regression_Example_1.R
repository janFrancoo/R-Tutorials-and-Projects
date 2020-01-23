library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrgram)
library(corrplot)
library(caTools)

# Import data and check nulls
df <- read.csv('student-mat.csv', sep = ';')
head(df)
any(is.na(df))

# Correlation
num.cols <- sapply(df, is.numeric)
cor.data <- cor(df[, num.cols])
print(corrplot(cor.data, method = 'color'))
corrgram(df, order = T, lower.panel = panel.shade, 
         upper.panel = panel.pie, text.panel = panel.txt)
ggplot(df, aes(x = G3)) + geom_histogram(
  bins = 20, alpha = 0.5, fill = 'blue')

# Random split with seed 101
set.seed(101)
sample <- sample.split(df$G3, SplitRatio = 0.7)
train <- subset(df, sample == T)
test <- subset(df, sample == F)

# Building model
model <- lm(G3 ~ ., data = train)
print(summary(model))

# Residuals
res <- residuals(model)
res <- as.data.frame(res)
head(res)
ggplot(res, aes(res)) + geom_histogram(
  fill = 'blue', alpha = 0.5)

# Results
plot(model)
G3.predictions <- predict(model, test)
results <- cbind(G3.predictions, test$G3)
results <- as.data.frame(results)
colnames(results) <- c('predicted', 'actual')
head(results)

to_zero <- function(x) {
  if (x < 0)
    return(0)
  else
    return(x)
}

results$predicted <- sapply(results$predicted, to_zero)

mse <- mean((results$actual - results$predicted) ^ 2)
print(mse ^ 0.5)
