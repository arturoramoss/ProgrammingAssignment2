
## This function recive a matrix and return a list of functions to manage the matrix and another variable

makeCacheMatrix <- function(x = matrix()) {
      b <- NULL
      set <- function(y) {
        x <<- y
        b <<- NULL
      }
      get <- function() x
      setSolve <- function(mean) b <<- mean
      getSolve <- function() b
      list(set = set, get = get,
           setSolve = setSolve,
           getSolve = getSolve)
}


## This function takes de list of the previous function and assign the inverse matrix to the other variable if is null
## in other case, print the result that is already load.

cacheSolve <- function(x, ...) {
      m <- x$getSolve()
      if(!is.null(m)) {
        message("getting cached data")
        return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setSolve(m)
      m
}
