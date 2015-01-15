## cachematrix.R implements a CacheMatrix object which "decorates" a matrix with the ability to cache the result of matrix operations.
## One such operation is the inverse matrix calculation implemented in the cacheSolve function

## "Factory" function to create CacheMatrix decorator object
makeCacheMatrix <- function(x = matrix()) {
    solvedMatrix <- NULL
    set <- function( y ) {
        x <<- y
        solvedMatrix <<- NULL ## new matrix - reset cached.
    } 
    get <- function() {
        x
    }
    setSolvedMatrix <- function(smatrix) {
        solvedMatrix <<- smatrix
    }
    getSolvedMatrix <- function() {
        solvedMatrix
    }
    ## return list representing the CacheMatrix object
    list(set=set, get=get, setSolvedMatrix=setSolvedMatrix,getSolvedMatrix=getSolvedMatrix)
}


## calculate the inverse of the CacheMatrix object. 
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  solvedMatrix <- x$getSolvedMatrix()
  if(!is.null(solvedMatrix)) {
    message("getting cached solved matrix")
    return(solvedMatrix)
  }
  data <- x$get()
  solvedMatrix <- solve(data, ...)
  x$setSolvedMatrix(solvedMatrix)
  solvedMatrix
}

