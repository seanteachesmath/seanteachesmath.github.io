sizeof <- 5

(A <- matrix(1:sizeof^2, nrow= sizeof, ncol= sizeof))
(B <- matrix(1:sizeof^2, nrow= sizeof, ncol= sizeof, byrow=T))


for(i in 2:(nrow(A)-1)){
	A[i, i-1] <- -1
	A[i, i] <- 2
	A[i, i+1] <- 1
}

A[1, 1] <- 0
A[nrow(A), nrow(A)] <- 0
A

(x <- solve(A, 1:sizeof))

A%*%x ## note %*% for matrix multiplication