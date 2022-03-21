f <- function(x) 3 + 4*x

df <- function(n) (f(2 + 10^(-n)) - f(2))/10^(-n)

(x <- seq(0, 20, by=0.25))
par(mar=c(4.1, 5.1, 1.1, 1.1))
plot(10^(-x), sapply(x, df), ylim=c(0, 6), log='x', pch=19, axes=F, xlab="", ylab="")
mtext(expression(log[10](Delta*x)), 1, line=3, cex=1.25)
mtext(expression(frac(f(2+Delta*x) - f(2), Delta*x)), 2, line=2, cex=1.25)
axis(1, 10^(-(0:20)), -(0:20))
axis(2, 0:6, las=1)
box()

#dat <- cbind(x, 10^(-x), sapply(x, df))
