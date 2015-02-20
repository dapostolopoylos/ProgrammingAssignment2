## I tried to port the logic behind the Vector Mean example into the exercise tweeking the code in order to fit in the demand 
## of the caching an inversed matrix.

makeCacheMatrix <- function(x = matrix()) {
    m<-NULL
    set<-function(y){
        x<<-y
        m<<-NULL
    }
    get<-function() x
    setinverse<-function(solve) m <<- solve
    getinverse<-function() m
    list(set=set, get=get,
         setinverse=setinverse,
         getinverse=getinverse)
}

cacheSolve <- function(x, ...) {
    m<-x$getinverse()
    if(!is.null(m)){
        message("getting cached data")
        return(m)
    }
    matrix<-x$get()
    m<-solve(matrix)
    x$setinverse(m)
    m
}




