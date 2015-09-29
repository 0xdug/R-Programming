## The following pair of functions caches and computes the 
## inverse of a matrix.

## This function creates a special "matrix" object
## that can cache its inverse.

makeCacheMatrix <- function(m = matrix()) {
        inv <- NULL
        ## set the value of the matrix
        set <- function(x) {
                m <<- x
                inv <<- NULL
        }
        ## get the value of the matrix
        get <- function() m
        ## set the value of the inverse
        setInverse <- function(inverse) inv <<- inverse
        ## get the value of the inverse
        getInverse <- function() inv
        ## return the list containing all the above defined functions
        list(set = set, get = get, setInverse = setInverse, 
                    getInverse = getInverse)
}

## This function computes the inverse of the special
## "matrix" returned by the `makeCacheMatrix` function. Checks if the
## inverse has already been computed for the matrix, if so then
## `cacheSolve` will retrieve the inverse from the cache. Else,
## calculates the inverse. 

cacheSolve <- function(m, ...) {
        ## get inverse
        inv <- m$getInverse()
        ## if inverse is already computed, then return inverse from 
        ## the cache
        if(!is.null(inv)) {
                message("Getting cached data...")
                return(inv)
        }
        ## else, get matrix
        data <- m$get()
        ## compute the inverse of matrix
        inv <- solve(data, ...)
        ## cache the inverse
        m$setInverse(inv)
        ## return inverse
        inv
}
