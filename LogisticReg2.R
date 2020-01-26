library(dplyr)
library(ggplot2)
library(Amelia)
library(caTools)

# Read data
df <- read.csv('data/adult_sal.csv')
df <- select(df, -X)
head(df)

# Clean
table(df$type_employer)
update.job <- function(job) {
  job <- as.character(job)
  if (job == "Never-worked" | job == "Without-pay") { return("Unemployed") }
  if (job == "Local-gov" | job == "State-gov") { return("SL-gov") }
  if (job == "Self-emp-inc" | job == "Self-emp-not-inc") { return("self-emp") }
  else return(job)
}
df$type_employer <- sapply(df$type_employer, update.job)
table(df$type_employer)

table(df$marital)
update.martial <- function(mar) {
  mar <- as.character(mar)
  if (mar == "Separated" | mar == "Divorced" | mar == "Widowed") { return ("Not-Married") }
  else if (mar == "Never-married") { return(mar) }
  else { return("Married") }
}
df$marital <- sapply(df$marital, update.martial)
table(df$marital)

table(df$country)
Asia <- c('China', 'Hong', 'India', 'Iran', 'Cambodia', 'Japan', 'Laos', 'Philippines', 'Vietnam', 'Taiwan', 'Thailand')
North.America <- c('Canada', 'United-States', 'Puerto-Rico')
Europe <- c('England', 'France', 'Germany', 'Greece', 'Holand-Netherlands', 'Hungary', 'Ireland', 'Italy', 'Poland', 'Portugal', 'Scotland', 'Yugoslavia')
Latin.and.South.America <- c('Columbia', 'Cuba', 'Dominican-Republic', 'Ecuador', 'El-Salvador', 'Guatemala', 'Haiti', 'Honduras', 'Mexico', 'Nicaragua', 'Outlying-US(Guam-USVI-etc)', 'Peru', 'Jamaica', 'Trinadad&Tobago')
Other <- c('South')
update.country <- function(country){
  if (country %in% Asia) { return('Asia') }
  else if (country %in% North.America){ return('North.America') }
  else if (country %in% Europe){ return('Europe') }
  else if (country %in% Latin.and.South.America) { return('Latin.and.South.America') }
  else{ return('Other') }
}
df$country <- sapply(df$country, update.country)
table(df$country)

# Missing data
str(df)
df[df == '?'] <- NA
df$type_employer <- factor(df$type_employer)
df$country <- factor(df$country)
df$marital <- factor(df$marital)

print(missmap(df))
df <- na.omit(df)
print(missmap(df))

# Analysis
age.pl <- ggplot(df, aes(age))
age.pl <- age.pl + geom_histogram(aes(fill = income), 
                                  color = 'black', binwidth = 1)
age.pl <- age.pl + theme_bw()
print(age.pl)

hours.pl <- ggplot(df, aes(hr_per_week))
hours.pl <- hours.pl + geom_histogram()
print(hours.pl)

names(df)[names(df)=="country"] <- "region"
reg.pl <- ggplot(df, aes(region))
reg.pl <- reg.pl + geom_bar(aes(fill = income, color = 'black'))
reg.pl <- reg.pl + theme_bw()
print(reg.pl)

# Model
set.seed(101)
sample <- sample.split(df$income, SplitRatio = 0.7)
train <- subset(df, sample == T)
test <- subset(df, sample == F)
model <- glm(income ~., family = binomial(logit), data = train)
summary(model)
new.step.model <- step(model)
summary(new.step.model)

# Test
test$predicted <- predict(model, newdata = test, type = "response")
table(test$income, test$predicted > 0.5)
acc <- (6372 + 1423) / (548 + 872 + 6372 + 1423)
