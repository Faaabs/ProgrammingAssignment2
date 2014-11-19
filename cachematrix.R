## The following two functions enable the inverse of a matrix to be
## cached inside one function, and to be retrieved inside the other
## function to save time.

## The first function creates a list of 4 functions. 1. a function
## to set up the matrix. 2. a function to get this matrix. 3. a
## function to set the inverse of that matrix, and 4. a function
## to get the inverse of that matrix.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## The second function creates the inverse of an invertible matrix.
## It first checks whether the inverse has already been created. If
## so, it gets the inverse from the cache and it skips the
## computation. Otherwise, it creates the inverse of the matrix and
## sets the inverse of the matrix via the setinverse function.

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}
