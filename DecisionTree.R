library(rpart)
library(rpart.plot)
library(randomForest)

df <- kyphosis
head(df)
str(df)

tree <- rpart(Kyphosis ~ ., method = 'class', data = df)
printcp(tree)
prp(tree)

rf.model <- randomForest(Kyphosis ~ ., data = df)
print(rf.model)
predicted <- data.frame(df, rf.model$predicted)
head(predicted)

rf.model$ntree
rf.model$confusion
