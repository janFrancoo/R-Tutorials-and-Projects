seq(-2, 10, by = 2)
seq(-100, 100, by = 20)

v <- c(1, 4, 21, -2, 99, 1000, 0)
sort(v)
v <- sort(v, decreasing = TRUE)

s <- seq(5, 100, by = 3)
s <- rev(s)

v1 <- 1:10
v2 <- 35:40
v3 <- append(v1, v2)

m <- 1:100
m <- as.matrix(m)

print(sample(1:10, 2))

v <- 1:5
times2 <- function(num) {
  return(num * 2)
}

result <- sapply(v, times2)
print(result)

result <- sapply(v, function(num){num*2})
print(result)

add <- function(num1, num2) {
  return(num1 + num2)
}

result <- sapply(v, add, num2=5)
print(result)
