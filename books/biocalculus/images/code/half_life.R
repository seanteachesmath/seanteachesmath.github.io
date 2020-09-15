# path <- "/Users/seanlaverty/Dropbox/uco/sem_16_fall/math2153/lectures/topics/figures/"
path <- "/Volumes/Data_drive/Dropbox/uco/sem_16_fall/math2153/lectures/topics/figures/"
png(paste(path, "half_life.png", sep=''), width=600, height=600)
par(xaxs='i', yaxs='i', mar=c(3.1, 4.1, 0.8, 0.8))
plot(NULL, xlim=c(0, 1), ylim=c(0, 1), axes=F, xlab="", ylab="")
plot(function(x)0.8*exp(-1.5*x), xlim=c(0, 1), add=T, lwd=3, col=2)
axis(1, c(0, log(2)/1.5, 1), c(0, expression(tau[1/2]), expression(t)), cex.axis=2, col.axis=2, col=2)
axis(2, c(0, 0.4, 0.8, 1), c(0, expression(over(s[0],2)), expression(s[0]), expression(s(t))), las=1, cex.axis=2, col.axis=2, col=2)
box(col=2)
abline(h=0.4, lty=3, col=2, lwd=2)
arrows(log(2)/1.5, 0.4, log(2)/1.5, 0, col=2, lwd=2)
dev.off()