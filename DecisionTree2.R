library(ISLR)
library(rpart)
library(ggplot2)
library(caTools)
library(rpart.plot)
library(randomForest)

# Data
df <- College
head(df)

rate.board.pl <- ggplot(df, aes(Room.Board, Grad.Rate))
rate.board.pl <- rate.board.pl + geom_point(aes(color = Private))
print(rate.board.pl)

f.time.pl <- ggplot(df, aes(F.Undergrad))
f.time.pl <- f.time.pl + geom_histogram(aes(fill = Private), color = 'black')
print(f.time.pl)

grad.pl <- ggplot(df, aes(Grad.Rate))
grad.pl <- grad.pl + geom_histogram(aes(fill = Private), color = 'black')
print(grad.pl)

subset(df, Grad.Rate > 100)
df['Cazenovia College', 'Grad.Rate'] <- 100

# Split
set.seed(101)
sample <- sample.split(df$Private, SplitRatio = 0.7)
train.df <- subset(df, sample == T)
test.df <- subset(df, sample == F)

# Model
tree <- rpart(Private ~ ., train.df, method = 'class')
preds <- predict(tree, test.df)
head(preds)

preds <- as.data.frame(preds)
joiner <- function(x) {
  if (x >= 0.5) return('Y')
  else          return('N')
}
preds$Private <- sapply(preds$Yes, joiner)
head(preds)

table(preds$Private, test.df$Private)
prp(tree)

# Random forest
rf.model <- randomForest(Private ~ ., train.df, importance = T)
rf.model$confusion
rf.model$importance

preds <- predict(rf.model, test.df)
table(preds, test.df$Private)
