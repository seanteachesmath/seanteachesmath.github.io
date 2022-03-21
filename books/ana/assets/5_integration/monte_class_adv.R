f <- function(x) exp(x)
layout(matrix(c(1, 2, 3, 4, 5, 6, 0, 7, 0), byrow=T, nrow=3, ncol=3))
par(mar=c(5.1, 4.1, 1.1, 1.1), xaxs="i", yaxs='i')

u <- 2
integrate(f, lower=0, upper=u)

est <- NULL
ns <- 10^(0:6)
for(i in ns){
xs <- runif(i)*u
ys <- runif(i)*f(u)
if(i < max(ns)){
	plot(xs, ys, pch=19, cex=0.1, xlim=c(0, u), ylim=c(0, f(u)))
	plot(f, xlim=c(0, u), lwd=2, las=1, col=2, add=T)
	mtext(bquote(est==.(u*exp(u)*length(ys[ys < sapply(xs, f)])/length(ys), 3)), at=1.0)
}

est <- c(est, u*exp(u)*length(ys[ys < sapply(xs, f)])/length(ys))
}

cbind(ns, est)
plot(cbind(ns, est), type='b', log='x', ylim=c(0, ceiling(max(est))))

# # # # # # # # # # # # # # #
# # # # # # # # # # # # # # #

f <- function(x, y) x^2+y^2
X <- 2
Y <- 2
est <- NULL
ns <- 10^(1:6)
for(i in ns){
xs <- runif(i)*X
ys <- runif(i)*Y
zs <- runif(i)*f(X,Y)
#if(i < max(ns)){
	# could use wireframe or scatter3d
	#plot(f, xlim=c(0, 1), lwd=2, las=1)
#	cloud(xs, ys)
#}

est <- c(est, X*Y*f(X,Y)*length(zs[zs < f(xs, ys)])/length(xs))
}

cbind(ns, est)
par(mfrow=c(1,1))
plot(cbind(ns, est), type='b', log='x', ylim=c(0, ceiling(max(est))))