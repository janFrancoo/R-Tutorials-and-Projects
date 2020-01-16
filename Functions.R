printHello <- function(name='JanFranco') {
  print(paste("Hello, ", name))
}

printHello()
printHello("JaneFrancoo")

add_num <- function(num1, num2) {
  return(num1 + num2)
}

result <- add_num(4, 5)
print(result)

isItInVec <- function(num, vec) {
  for(val in vec) {
    if(num == val) {
      return(TRUE)
    }
  }
  return(FALSE)
}

print(isItInVec(4, c(1, 4, 5)))

countInVec <- function(num, vec) {
  count <- 0
  for(val in vec) {
    if (num == val) {
      count <- count + 1
    }
  }
  return(count)
}

print(countInVec(3, c(3, 3, 4, 4, 5, 1, 2, 3)))
