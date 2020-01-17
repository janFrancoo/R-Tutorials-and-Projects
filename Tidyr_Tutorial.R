install.packages('tidyr')
install.packages('data.table')

library('tidyr')
library('data.table')

comp <- c(1, 1, 1, 2, 2, 2, 3, 3, 3)
yr <- c(1998, 1999, 2000, 1998, 1999, 2000, 1998, 1999, 2000)
q1 <- runif(9, min = 0, max = 100)
q2 <- runif(9, min = 0, max = 100)
q3 <- runif(9, min = 0, max = 100)
q4 <- runif(9, min = 0, max = 100)
df <- data.frame(comp = comp, year = yr, Qtr1 = q1, Qtr2 = q2, Qtr3 = q3, Qtr4 = q4)

head(gather(df, Quarter, Revenue, Qtr1:Qtr4))

stocks <- data.frame(time = as.Date('2009-01-01') + 0:9, X = rnorm(10, 0, 1), Y = rnorm(10, 0, 2), Z = rnorm(10, 0, 4))
stocks.gathered <- stocks %>% gather(stock, price, X, Y, Z)
head(stocks)
head(stocks.gathered)
head(spread(stocks.gathered, stock, price))

df <- data.frame(new.col = c(NA, "a-x", "b-y", "c-z"))
df <-separate(df, col = new.col, into = c("AC", "XZ"), sep = "-")
df
unite(df, new.joined.col, AC, XZ)
