## generate data, you will typically be responsible for *entering* data: x <- c(1, 2, 3, ..., 10)
(x <- 1:10)
(y <- runif(1, 0, 1) + runif(1, 0, 1)*x + x^2 + runif(10, -3, 3))

## plot
plot(x, y)

## assume quadratic function, set up "design matrix"
(D <- cbind(1, x, x^2))
D
## form square system
(A <- t(D)%*%D)
(rhs <- t(D)%*%y)

## solve for unknown parameters
(as <- solve(A, rhs))

## graph
plot(function(x)as[1] + as[2]*x + as[3]*x^2, xlim=c(1, 11), add=T)


