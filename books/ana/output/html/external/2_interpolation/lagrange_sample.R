## the mix of symbolic and numeric data makes this surprisingly challenging to program

## define data, in this case a sequence of x and a function to be applied
xi <- 0:2
f <- function(x)exp(x)
y <- sapply(xi, f)

## plot to inspect
plot(f, las=1, xlim=c(0, 2), ylim=c(0, 8))
points(xi,y, pch=19, col=c(1, 2, 4))

## define coefficient polynomials, manually
l0 <- function(x) ((x-xi[2])*(x-xi[3]))/((xi[1]-xi[2])*(xi[1]-xi[3]))
l1 <- function(x) ((x-xi[1])*(x-xi[3]))/((xi[2]-xi[1])*(xi[2]-xi[3]))
l2 <- function(x) ((x-xi[2])*(x-xi[1]))/((xi[3]-xi[2])*(xi[3]-xi[1]))

## plot polynomials
plot(l0, xlim=c(0, 2))
plot(l1, xlim=c(0, 2), add=T, col=2)
plot(l2, xlim=c(0, 2), add=T, col=4)

points(xi, c(l0(xi[1]), l1(xi[2]), l2(xi[3])), col=c(1, 2, 4), pch=19)

## define interpolant
P <- function(x) f(xi[1])*l0(x) + f(xi[2])*l1(x) + f(xi[3])*l2(x)

## plot interpolant original, and 'data'
plot(xi, y, col=c(1, 2, 4), pch=19)
plot(f, xlim=c(0, 2), add=T)
plot(P, xlim=c(0, 2), add=T, col="gray")
