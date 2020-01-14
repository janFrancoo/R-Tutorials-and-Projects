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
