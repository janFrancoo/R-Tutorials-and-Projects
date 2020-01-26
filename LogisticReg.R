library(Amelia)
library(ggplot2)
library(dplyr)
library(caTools)

# Read data
df.train <- read.csv('titanic_train.csv')
head(df.train)

# Analaysis
# Missing map
missmap(df.train, main = 'Missing Map', col = c('yellow', 'black'), legend = F)

# Plots
survived.pl <- ggplot(df.train, aes(Survived)) + geom_bar()
print(survived.pl)

class.pl <- ggplot(df.train, aes(Pclass)) + geom_bar(aes(fill=factor(Pclass)))
print(class.pl)

sex.pl <- ggplot(df.train, aes(Sex)) + geom_bar(aes(fill=factor(Sex)))
print(sex.pl)

age.pl <- ggplot(df.train, aes(Age))
age.pl <- age.pl + geom_histogram(bins = 20, alpha = 0.5, fill = 'blue')
print(age.pl)

sib.pl <- ggplot(df.train, aes(SibSp)) + geom_bar()
print(sib.pl)

fare.pl <- ggplot(df.train, aes(Fare))
fare.pl <- fare.pl + geom_histogram(fill = 'green', color = 'black', alpha = 0.5)
print(fare.pl)

age.c.pl <- ggplot(df.train, aes(Pclass, Age))
age.c.pl <- age.c.pl + geom_boxplot(aes(group = Pclass, fill = factor(Pclass)), alpha = 0.5)
age.c.pl <- age.c.pl + scale_y_continuous(breaks = seq(min(0), max(80), by = 2))
print(age.c.pl)

# Fill age
impute.age <- function(age, class) {
  out <- age
  for(i in 1:length(age)) {
    if (is.na(age[i])) {
      if (class[i] == 1) { out[i] <- 37 }
      else if (class[i] == 2) { out[i] <- 29 }
      else { out[i] <- 24 }
    }
    else { out[i] <- age[i] }
  }
  return(out)
}

fixed.ages <- impute.age(df.train$Age, df.train$Pclass)
df.train$Age <- fixed.ages
missmap(df.train, main = 'Check', col = c('yellow', 'black'), legend = F)

# Cleaning
df.train <- select(df.train, -PassengerId, -Name, -Ticket, -Cabin)
head(df.train)

# Factor
str(df.train)
df.train$Survived <- factor(df.train$Survived)
df.train$Pclass <- factor(df.train$Pclass)
df.train$Parch <- factor(df.train$Parch)
df.train$SibSp <- factor(df.train$SibSp)
str(df.train)

# Split
set.seed(101)
split <- sample.split(df.train$Survived, SplitRatio = 0.7)
final.train <- subset(df.train, split == T)
final.test <- subset(df.train, split == F)

# Model
final.log.model <- glm(Survived ~., famil = binomial(link = 'logit'), data = final.train)

# Results
summary(final.log.model)
probs <- predict(final.log.model, final.test, type = 'response')
results <- ifelse(probs > 0.5, 1, 0)
mis.class.error <- mean(results != final.test$Survived)
print(1 - mis.class.error)

# Conf Matrix
table(final.test$Survived, probs > 0.5)
