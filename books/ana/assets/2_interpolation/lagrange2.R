N <- 8
xs <- seq(-1, 1, length=N)#sample(1:20, 10)
(xs <- xs[order(xs)])
xs
L <- function(x, j){
	tmp <- 1
 for(i in 1:N){
	if(i!=j)tmp <- tmp*(x-xs[i])/(xs[j] - xs[i])
 }
tmp
}

files <- F
if(files)pdf("Li.pdf", height=5, width=10)
par(mfrow=c(2, ceiling(N/2)), mar=c(4.1, 4.1, 1.1, 1.1))
plot(function(x)L(x,1), xlim=c(min(xs), max(xs)), ylim=c(-1, 1), las=1, xlab=expression(x), ylab=expression(L[0](x)))
points(xs, sapply(xs, function(x)L(x,1)), pch=19)


for(i in 2:N){
plot(function(x)L(x,i), xlim=c(min(xs), max(xs)), ylim=c(-1, 1), las=1, xlab=expression(x), ylab=bquote(paste(L[.(i-1)](x))))
points(xs, sapply(xs, function(x)L(x,i)), pch=19)
}
if(files)dev.off()

if(files)pdf("fLi.pdf", height=5, width=10)
par(mfrow=c(2, ceiling(N/2)), mar=c(4.1, 4.1, 1.1, 1.1))
plot(function(x)f(xs[1])*L(x,1), xlim=c(min(xs), max(xs)), ylim=c(-3, 3), las=1, xlab=expression(x), ylab=expression(f(x[0])*L[0](x)))
points(xs, sapply(xs, function(x)f(xs[1])*L(x,1)), pch=19)


for(i in 2:N){
plot(function(x)f(xs[i])*L(x,i), xlim=c(min(xs), max(xs)), ylim=c(-3, 3), las=1, xlab=expression(x), ylab=bquote(paste(f(x[.(i-1)])*L[.(i-1)](x))))
points(xs, sapply(xs, function(x)f(xs[i])*L(x,i)), pch=19)
}
if(files)dev.off()


f <- function(x)x^3*exp(-1.1*x)*sin(x)

Pk <- function(x, k){
	tmp <- 0
	for(i in 1:k){
			tmp <- tmp + f(xs[i])*L(x, i)
	}
	tmp
}



if(files)pdf("fP.pdf", height=5, width=10)
par(mfrow=c(1,2), mar=c(4.1, 5.1, 1.1, 1.1))
plot(f, xlim=c(min(xs), max(xs)), ylab="Function and approximation", las=1, lwd=2)
plot(function(x)Pk(x,N), xlim=c(min(xs), max(xs)), add=T, col="gray")
points(xs, sapply(xs, f), pch=19)
points(xs, sapply(xs, P), pch=19, col='gray')

plot(function(x) f(x) - Pk(x, N), xlim=c(min(xs), max(xs)), ylab="Error (f(x) - P(x))\n", las=1)
points(xs, 0*xs, pch=19, col=1)
if(files)dev.off()



if(files)pdf("fPk.pdf", height=5, width=10)
par(mfrow=c(2, ceiling(N/2)), mar=c(4.1, 4.1, 1.1, 1.1))
for(i in 1:N){
	plot(f, xlim=c(min(xs), max(xs)), ylab= bquote(paste("Function, approximation, and ", P[.(N)][","][.(i)](x))), las=1, lwd=2, ylim=c(0, 3))
	# plot(P, xlim=c(min(xs), max(xs)), add=T, col="gray")
	plot(function(x)Pk(x,i), xlim=c(min(xs), max(xs)), add=T, col="gray", lwd=2)
	points(xs[1:i], sapply(xs[1:i], f), pch=19)
}
if(files)dev.off()
