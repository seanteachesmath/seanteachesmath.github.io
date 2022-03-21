set.seed(1001)
files <- T
f <- function(x) x^2
a <- 0
b <- 2
N <- 100
cols <- hcl.colors(N, alpha=0.1)
auc <- integrate(f, lower=a, upper=b)$value
fhat <- auc/(b-a)
rx <- runif(N, a, b)
ry <- runif(N, f(a), f(b))
rfs <- sapply(rx, f)
idx <- order(rfs)
# rx <- rx[idx]
# rfs <- rfs[idx]
# ry <- ry[idx]

# # # # # # # # # # # # # # # # # # # #
if(files)pdf("intro.pdf", height=5, width=10)
par(mfrow=c(1, 2), mar=c(3.1, 4.1, 1.8, 1.1), xaxs='r', yaxs='r')
xs <- seq(a, b, length=100)
plot(NULL, xlim=c(a,b), ylim=c(f(a), f(b)), las=1, xlab="", ylab="")
	mtext(expression(x), side=1, font=2, cex=1.0, line=2)
	mtext(expression(f(x)), side=2, font=2, cex=1.0, line=2)
	mtext(bquote(paste(exact==.(signif(auc, 6)))), side=3)

polygon(c(rev(xs), xs), c(0*xs, sapply(xs, f)), col="lightgray")
plot(f, xlim=c(a,b), ylim=c(f(a), f(b)), lwd=2, add=T)

plot(NULL, xlim=c(a,b), ylim=c(f(a), f(b)), las=1, xlab="", ylab="")
	mtext(expression(x), side=1, font=2, cex=1.0, line=2)
	mtext(expression(f(x)), side=2, font=2, cex=1.0, line=2)
		mtext(bquote(paste(hat(f)==.(signif(fhat, 6)))), side=3)

polygon(c(a, b, b, a), c(f(a), f(a), fhat, fhat), lwd=2, col="lightgray")
plot(f, xlim=c(a,b), ylim=c(f(a), f(b)), lwd=2, add=T)
if(files)dev.off()

# # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # #
if(files)pdf("rectangles.pdf", height=5, width=10)

par(mfrow=c(1, 2), mar=c(3.1, 4.1, 1.8, 1.1), xaxs='r', yaxs='r')
	plot(NULL, xlim=c(a,b), ylim=c(f(a), f(b)), las=1, xlab="", ylab="")
	mtext(expression(x), side=1, font=2, cex=1.0, line=2)
	mtext(expression(f(x)), side=2, font=2, cex=1.0, line=2)
	for(i in sample(1:N, 5)){
		y <- rfs[i]
		polygon(c(a, b, b, a), c(0, 0, y, y), col=cols[i], lwd=2)
}
	plot(f, xlim=c(a,b), ylim=c(f(a), f(b)), lwd=2, add=T)
	abline(h=fhat, lwd=2, col="black", lty=3)


# # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # #

	plot(NULL, xlim=c(a,b), ylim=c(f(a), f(b)), las=1, xlab="", ylab="")
	mtext(expression(x), side=1, font=2, cex=1.0, line=2)
	mtext(expression(f(x)), side=2, font=2, cex=1.0, line=2)
	mtext(bquote(paste(estimate==.(signif(mean(rfs)*(b-a), 6)), ', ',exact==.(signif(auc, 6)))), side=3)

		polygon(c(a,b,b,a), c(0,0,mean(rfs),mean(rfs)), col="gray", lwd=2)
	plot(f, xlim=c(a,b), ylim=c(f(a), f(b)), lwd=2, add=T)
	abline(h=fhat, col="black", lwd=2, lty=3)
	# }

if(files)dev.off()# # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # #
if(files)pdf("rejection.pdf", height=5, width=5)
par(mfrow=c(1,1), mar=c(3.1, 4.1, 1.8, 1.1), xaxs='r', yaxs='r', bg="white")

	plot(NULL, xlim=c(a,b), ylim=c(f(a), f(b)), las=1, xlab="", ylab="")
	mtext(expression(x), side=1, font=2, cex=1.0, line=2)
	mtext(expression(f(x)), side=2, font=2, cex=1.0, line=2)
	approx2 <- (f(b)-f(a))*(b-a)*sum(ry < rfs)/N
	mtext(bquote(paste(estimate==.(signif(approx2, 6)), ', ',exact==.(signif(auc, 6)))), side=3)
points(rx[ry < rfs], ry[ry < rfs], col="gray", pch=19)
points(rx[ry >= rfs], ry[ry >= rfs], col="black", pch=19)
	plot(f, xlim=c(a,b), ylim=c(f(a), f(b)), lwd=2, add=T)
	
legend("topleft", c("Accept", "Reject"), pch=c(19, 19, NA), col=c("gray", "black", "black"), bg="white")
if(files)dev.off()

# # # # # # # # # # # # # # # # # #
if(files)pdf("Ns.pdf", height=5, width=5)

est <- NULL

# for(N in 10^seq(1, 6, by=0.5)){
# rx <- runif(N, a, b)
# ry <- runif(N, f(a), f(b))
# rfs <- sapply(rx, f)
# est <- rbind(est, c(rep=1, size=N, est1=mean(rfs)*(b-a), est2=(f(b)-f(a))*(b-a)*sum(ry < rfs)/N))
# }


for(m in 1:10){
	# est <- NULL

for(N in 10^seq(1, 6, by=0.5)){
rx <- runif(N, a, b)
ry <- runif(N, f(a), f(b))
rfs <- sapply(rx, f)
est <- rbind(est, c(m, N, mean(rfs)*(b-a), (f(b)-f(a))*(b-a)*sum(ry < rfs)/N))
}
}
est <- as.data.frame(est)
names(est) <- c("i", "N", "est1", "est2")

par(mfrow=c(1, 1), mar=c(3.1, 4.1, 1.8, 1.1), xaxs='r', yaxs='r')

	plot(est1 ~ N, est, subset=i==1, ylim=(b-a)*c(f(a), f(b)), las=1, xlab="", ylab="", log='x', type='b', pch=19, axes=F, lwd=2)
	axis(1, at=10^(1:6), labels=c(expression(10^1, 10^2, 10^3, 10^4, 10^5, 10^6)))
	axis(2, las=1)
	box()
	mtext("Sample points", side=1, font=2, cex=1.5, line=2)
	mtext("Estimation", side=2, font=2, cex=1.5, line=2.5)
	points(est2 ~ N, est, subset=i==1, type='b', pch=19, lwd=2, col="gray")
	legend("topright", c("Averaging", "Accept/Reject"), pch=c(19, 19), col=c("black", "gray"), bg="white")
for(m in 2:10){
points(est1 ~ N, est, subset=i==m, type='b', pch=19, lwd=2, col="black")
points(est2 ~ N, est, subset=i==m, type='b', pch=19, lwd=2, col="gray")
}
# points(aggregate(est$est1, by=list(est$N), mean), col=2, pch=19, type='b')
# points(aggregate(est$est2, by=list(est$N), mean), col=4, pch=19, type='b')

if(files)dev.off()# # # # # # # # # # # # # # # # # # # #
