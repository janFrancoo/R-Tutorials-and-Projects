library(ggplot2)

df <- read.csv('bikeshare.csv')
head(df)

temp.count <- ggplot(df, aes(x = temp, y = count))
temp.count <- temp.count + geom_point(alpha = 0.3, aes(color = temp))
print(temp.count)

dt <- as.POSIXct(df$datetime)
dt.count <- ggplot(df, aes(x = dt, y = count)) 
dt.count <- dt.count + geom_point(alpha = 0.3, aes(color = temp))
dt.count <- dt.count + scale_color_continuous(
                                  low = '#55D8CE', high = '#FF6E2E')
print(dt.count)

corr.data <- cor(df[, c('temp', 'count')])
corr.data

season.count <- ggplot(df, aes(factor(season), count))
season.count <- season.count + geom_boxplot(aes(color = factor(season)))
print(season.count)

df$datetime <- as.POSIXct(df$datetime)
df$hour <- sapply(df$datetime, function(x) {format(x, "%H")})
head(df)

hour.count.wd <- ggplot(df[df$workingday == 1, ], aes(hour, count))
hour.count.wd <- hour.count.wd + geom_point()
print(hour.count.wd)

hour.count.nwd <- ggplot(df[df$workingday == 0, ], aes(hour, count))
hour.count.nwd <- hour.count.nwd + geom_point()
print(hour.count.nwd)

temp.model <- lm(count ~ temp, data = df)
summary(temp.model)

count.at.t.equals.25 <- 6.0462 + 9.1705 * 25
temp.test <- data.frame(temp = c(25))
predict(temp.model, temp.test)

df$hour <- sapply(df$hour, as.numeric)

model <- lm(count ~ . -casual -registered -datetime -atemp, df)
summary(model)
