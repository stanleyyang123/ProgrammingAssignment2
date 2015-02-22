## The function is to inverse a matrix, and store the solved matrix and return
## the matrix. If the matrix has already been solved, then the function just
## return the cached matrix. 

## makeCacheMatrix creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  solvematrix <- function(solve) m <<- solve #
  getmatrix <- function() m
  list(set = set, get = get,
       solvematrix = solvematrix,
       getmatrix = getmatrix)
}


## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$get()
  if(!is.null(m)) {
    message("getting cached matrix")
    return(m)
  }
  data <- x$get()
  m <- sovle(data, ...)
  x$solvematrix(m)
  m
}

