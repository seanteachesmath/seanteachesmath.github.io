f <- function(x) x^2

n <- 10000
xs <- runif(n, 0, 1)
ys <- runif(n, 0, 1)
plot(xs, ys, xlim=c(0, 1), ylim=c(0, 1), las=1, pch=19, cex=0.5)
plot(f, add=T, col=2, lwd=2, pch=19, cex=0.5)
mtext(bquote(est==.(sum(ys < f(xs))/n)), 3, at=0.5)


# # # # # # # # # # # #
# # # # # # # # # # # #

f <- function(x) exp(x)

n <- 1000
xs <- runif(n, 0, 1)
ys <- runif(n, 0, 1)*exp(1)
plot(xs, ys, xlim=c(0, 1), ylim=c(0, exp(1)), las=1, pch=19, cex=0.5)

plot(f, add=T, col=2, lwd=2, pch=19, cex=0.5)

mtext(bquote(est==.(exp(1)*sum(ys < f(xs))/n)), 3, at=0.5)
