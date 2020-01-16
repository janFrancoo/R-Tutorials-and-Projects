df <- mtcars
df[(df$mpg>20) & (df$hp>100), ]
df[(df$mpg>20) | (df$hp>100), ]

x <- 3
if (x %% 2 == 1) {
  print("Odd")
} else {
  print("Even")
}

x <- matrix(1:9, nrow = 3)

if(is.matrix(x)){
  print("x is a matrix")
} else {
  print("x is not a matrix")
}

x <- c(20, 10, 1)
if(x[1] > x[2] & x[1] > x[3]) {
  print(x[1])
} else if(x[2] > x[1] & x[2] > x[3]) {
  print(x[2])
} else {
  print(x[3])
}

count <- 0
while(count < 10) {
  count <- count + 1
  if (count == 5) {
    break
  }
}

print(count)

mat <- matrix(1:25, nrow = 5, byrow = TRUE)

for(row in 1:nrow(mat)) {
  for(col in 1:ncol(mat)) {
    print(mat[row, col]) 
  }
}
