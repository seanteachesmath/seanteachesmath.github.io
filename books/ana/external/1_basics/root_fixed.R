f <- function(x)exp(x) - 3*x^2

r1 <- uniroot(f, lower=-2, upper=0)$root
r2 <- uniroot(f, lower=0, upper=2)$root
r3 <- uniroot(f, lower=2, upper=4)$root

files <- F
if(files)pdf("root_fixed.pdf", height=10, width=5)
par(mfrow=c(2, 1), mar=c(4.1, 4.1, 1.1, 1.1), xaxs='i', yaxs='i')

plot(f, xlim=c(-2, 6), ylim=c(-2, 6),xlab="", ylab="", las=1)
mtext(expression(x), 1, line=2.5, cex=1.5)
mtext(expression(f(x) == 0), 2, line=2, cex=1.5)

arrows(r1, -2, r1, 0, col=2, length=0.1, code=1)
arrows(r2, -2, r2, 0, col=2, length=0.1, code=1)
arrows(r3, -2, r3, 0, col=2, length=0.1, code=1)

abline(h=0, lty=3, col="gray")
abline(v=0, lty=3, col="gray")
legend("topleft", c(expression(f(x) == e^x - 3*x^2), expression(g(x) == f(x) + x)), bg="white")

plot(function(x)f(x) + x, xlim=c(-2, 6), ylim=c(-2, 6), xlab="", ylab="", las=1)
plot(function(x)x, xlim=c(-2, 6), ylim=c(-2, 6), add=T)
mtext(expression(x), 1, line=2.5, cex=1.5)
mtext(expression(g(x) == x), 2, line=2, cex=1.5)

abline(h=0, lty=3, col="gray")
abline(v=0, lty=3, col="gray")
arrows(r1, 6, r1, r1, col=2, length=0.1, code=2)
arrows(r2, 6, r2, r2, col=2, length=0.1, code=2)
arrows(r3, 6, r3, r3, col=2, length=0.1, code=2)
if(files)dev.off()