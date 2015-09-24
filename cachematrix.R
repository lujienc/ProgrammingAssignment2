## A pair of fucntions that catche the inverse of a matrix
## The first function creates a specital matrix object
## The second function calculates the inverse of the matrix

## This fucntion creates a special matrix object that
## can cache its inverse
## This function returns a list

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinver <- function(solve) i <<- solve
        getinver <- function() i
        list(set = set, get = get, 
             setinver = setinver,
             getinver = getinver)
}


## This fucntion computes the inverse of the special matrix returned
## by the previous makeCacheMatrix function
## This function returns a matrix
## This fucntion also flags the speical matrix with cached data

cacheSolve <- function(x, ...) {
        i <- x$getinver()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinver(i)
        i
}
