power <- 2^5
# 32

stock.prices <- c(23, 27, 23, 21, 34)
# 23 27 23 21 34

names(stock.prices) <- c('Mon', 'Tues', 'Wed', 'Thu', 'Fri')
# Mon Tues  Wed  Thu  Fri 
#  23   27   23   21   34 

mean.of.stock.prices <- mean(stock.prices)
# 25.6

over.23 <- stock.prices > 23
# FALSE TRUE FALSE FALSE TRUE

stock.prices[over.23]
# Tues Fri
#   27  34

max(stock.prices)
# 34
