xs <- c(-1, 0, 1)
ys <- c(exp(xs[1]), exp(xs[2]), exp(xs[3]))

xs
ys

## indexing starts at 1

xs[2]
plot(xs, ys, las=1, xlim=c(-2, 2), ylim=c(0, 3), pch=19)

p0 <- function(x) ((x-xs[2])*(x-xs[3]))/((xs[1]-xs[2])*(xs[1]-xs[3]))
p1 <- function(x) ((x-xs[1])*(x-xs[3]))/((xs[2]-xs[1])*(xs[2]-xs[3]))
p2 <- function(x) ((x-xs[1])*(x-xs[2]))/((xs[3]-xs[1])*(xs[3]-xs[2]))

x2 <- seq(xs[1], xs[3], length=10)
ymin <- min(c(sapply(x2, p0), sapply(x2, p1), sapply(x2, p2)))
ymax <- max(c(sapply(x2, p0), sapply(x2, p1), sapply(x2, p2)))

ymag <- max(abs(c(ymin, ymax)))
par(mfrow = c(1, 2), mar=c(4.1, 4.1, 1.1, 1.1))
plot(p0, xlim=c(xs[1],xs[3]), ylim=c(-ymag, ymag), lwd=2, xlab="")
plot(p1, xlim=c(xs[1],xs[3]), col=2, lwd=2, add=T)
plot(p2, xlim=c(xs[1],xs[3]), col=4, lwd=2, add=T)


P <- function(x) ys[1]*p0(x) + ys[2]*p1(x) + ys[3]*p2(x)
plot(P, xlim=c(xs[1], xs[3]))
points(xs, ys, pch=19, col=c(1, 2, 4))
plot(function(x)exp(x), xlim=c(xs[1], xs[3]), add=T)

P(0)