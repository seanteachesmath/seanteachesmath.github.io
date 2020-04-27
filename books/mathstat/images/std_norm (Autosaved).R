x <- seq(-2.5, 2.5, length=100)
y <- dnorm(x)


png("std_norm1.png")
par(mar=c(4.1, 5.1, 1.1, 1.1), xaxs='i', yaxs='i')
plot(x, y, xlim=c(-2.5, 2.5), ylim=c(0, 0.5), type='l', las=1, axes=F, ylab="Standard Normal", lwd=2)
axis(1, at=-5:5)
axis(2, at=(0:5)/10, las=1)
box()
x1 <- seq(0, 0.3, length=100)
y1 <- dnorm(x1)

polygon(c(x1, rev(x1)), c(0*x1, rev(y1)), col=2, density=20, lwd=2)
dev.off()


png("std_norm2.png")
plot(x, y, xlim=c(-2.5, 2.5), ylim=c(0, 0.5), type='l', las=1, axes=F, ylab="Standard Normal", lwd=2)
axis(1, at=-5:5)
axis(2, at=(0:5)/10, las=1)
box()
x2 <- c(-rev(x1), x1)
y2 <-  c(rev(y1), y1)

polygon(c(x2, rev(x2)), c(0*x2, rev(y2)), col=2, density=20, lwd=2)
dev.off()

png("std_norm3.png")
par(mar=c(4.1, 5.1, 1.1, 1.1), xaxs='i', yaxs='i')
plot(x, y, xlim=c(-2.5, 2.5), ylim=c(0, 0.5), type='l', las=1, axes=F, ylab="Standard Normal", lwd=2)
axis(1, at=-5:5)
axis(2, at=(0:5)/10, las=1)
box()
x3 <- seq(0.3, 0.6, length=100)
y3 <- dnorm(x3)

polygon(c(x3, rev(x3)), c(0*x3, rev(y3)), col=2, density=20, lwd=2)
dev.off()

png("std_norm4.png")
par(mar=c(4.1, 5.1, 1.1, 1.1), xaxs='i', yaxs='i')
plot(x, y, xlim=c(-2.5, 2.5), ylim=c(0, 0.5), type='l', las=1, axes=F, ylab="Standard Normal", lwd=2)
axis(1, at=-5:5)
axis(2, at=(0:5)/10, las=1)
box()
x4 <- seq(0.6, 2.5, length=100)
y4 <- dnorm(x4)

polygon(c(x4, rev(x4)), c(0*x4, rev(y4)), col=2, density=20, lwd=2)
dev.off()