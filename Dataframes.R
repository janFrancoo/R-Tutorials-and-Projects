days <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')
temp <- c(22.2, 21, 23, 24.3, 25)
rain <- c(T, T, F, F, T)
df <- data.frame(days, temp, rain)
str(df)
summary(df)

df[1, ]
df[, 1]
df[1:5, 'days']
df[1:5, c('days', 'temp')]
df$rain

subset(df, subset = rain==TRUE)
subset(df, subset = temp > 23)

sorted.temp <- order(df['temp'])
df[sorted.temp, ]
desc.temp <- order(-df['temp'])
df[desc.temp, ]

c1 <- 1:10
c2 <- letters[1:10]
df <- data.frame(c1 = c1, c2 = c2)

write.csv(df, file = 'saved_df.csv')
df2 <- read.csv('saved_df.csv')

nrow(df)
ncol(df)
colnames(df)
rownames(df)

df[[5, 2]]
df[[2, 'c1']] <- 9999

df2 <- data.frame(c1 = 2000, c2 = 'new')
df.new <- rbind(df, df2)
df.new

df$new.col <- 2 * df$c1
colnames(df) <- c(1, 2, 3)
colnames(df)[2] <- 'ZZZZ'

mtcars[mtcars$mpg > 20, ]
any(is.na(df))
df[is.na(df)] <- 0
