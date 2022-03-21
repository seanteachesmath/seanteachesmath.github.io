par(xaxs='i', yaxs='i')
h <- function(x)exp(x)-3*x^2 + x
plot(h, xlim=c(-1, 4), ylim=c(-8, 4), las=1, lwd=2)
abline(a=0, b=1)

abline(h=0, lty=3)
abline(v=0, lty=3)

f <- function(x)exp(x)-3*x^2
plot(f, xlim=c(-1, 4), ylim=c(-8, 4), las=1, add=T, lwd=2, col=2)
r1 <- uniroot(f, lower=-1, upper=0)$root
r2 <- uniroot(f, lower=0, upper=2)$root
r3 <- uniroot(f, lower=3, upper=4)$root
arrows(r1, h(r1), r1, 0, len=0.05)
arrows(r2, h(r2), r2, 0, len=0.05)
arrows(r3, h(r3), r3, 0, len=0.05)

abline(a=0, b=1)

abline(h=0, lty=3)
abline(v=0, lty=3)

legend("topleft", c("f", "h"), col=c(2, 1), lwd=2, bg="white")