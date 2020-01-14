mat <- matrix(1:25, byrow = TRUE, nrow = 5)
mat + 2
mat * 3
mat %*% mat

mat > 15
mat[mat > 15]

mat <- matrix(1:100, nrow = 10, byrow = TRUE)
colSums(mat)
rowSums(mat)
rowMeans(mat)

mat <- rbind(mat, 101:110)
mat <- cbind(mat, c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1))

mat <- matrix(1:50, nrow = 10, byrow = TRUE)
mat[1,]
mat[,1]
mat[1:5, 1:3]

A <- c(1, 2, 3)
B <- c(4, 5, 6)
C <- rbind(A, B)

mat <- matrix(1:9, byrow = TRUE, nrow = 3)
is.matrix(mat)

mat <- matrix(1:25, byrow = TRUE, nrow = 5)
mat[2:3, 2:3]
mat[4:5, 4:5]
sum(mat)

mat <- matrix(runif(20, max = 100), nrow = 4)
