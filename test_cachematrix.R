## test script from Bryan
## https://class.coursera.org/rprog-010/forum/thread?thread_id=288

## first script: test cacheSolve repeatedly
x <- matrix(rnorm(160000),400,400)
x_ <- makeCacheMatrix(x)
for (i in 1:1000) {
  x__ <- cacheSolve(x_)
}

## second script: test solve repeatedly
x <- matrix(rnorm(160000),400,400)
for (i in 1:1000) {
  x_ <- solve(x)
}

## third script: verify equality
x <- matrix(rnorm(160000),400,400)
x_ <- makeCacheMatrix(x)
cacheSolve(x_)
print(identical(x_$getSolvedMatrix(),solve(x)))