## The two following function blocks will enable the settup up of a memory
## cache to store and retrive a matrix and a fuction to calculate or retrive
## the inverse of a matrix

## List of functions that will create a cache for 
## a matrix to be stored into memory and retrived

makeCacheMatrix <- function(x = matrix()) {
	m<-NULL
	
	set<-function(y){

	x<<-y

	m<<-NULL
}
	get<-function() x

	setmatrix <- function(solve) m<<- solve

	getmatrix <- function() m

	list(set = set, get = get,
		setmatrix = setmatrix,
		getmatrix = getmatrix)
}


## Return a matrix that is the inverse of 'x'
## If the inverse is already in cache it will retrive it from cache

cacheSolve <- function(x, ...) {
	m <- x$getmatrix()
	if(!is.null(m)){
      	message("getting cached data")
      	return(m)
    	}

	data <- x$get()

	m<-solve(data, ...)

	x$setmatrix(m)

	m
}
