## Contains two main functions which 
## help in setting and getting inverse 
## of a matrix by caching it. 

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  # inverse of matrix
    inverse <- NULL 
    # use this function to set the matrix
    set <- function(y) {
        x <<- y        
        # reset the inverse if using set explicitly
        inverse <<- NULL
    }
    # returns the matrix
    get <- function(){
          x
    }
    
    setinverse <- function(inverseOfMatrix) {
          inverse <<- inverseOfMatrix
    }
    getinverse <- function (){
          inverse
    }
    list(set = set, get = get,
         setinverse = setinverse, 
         getinverse = getinverse)

}


## This function takes the special matrix from 
## above and returns its inverse. 
## checks in cache first and if not present 
## calculated the inverse, caches it and then returns it. 


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      inverse <- x$getinverse()
      if(!is.null(inverse)){
            message("Getting inverse of matrix from Cache!")
            return(inverse)
      }
      # if not found in cache above calculate inverse. 
      thematrix <- x$get()
      inverse <- solve(thematrix)
      
      ## call setinverse to cache. 
      x$setinverse(inverse)
      
      ## return inverse 
      inverse
}
