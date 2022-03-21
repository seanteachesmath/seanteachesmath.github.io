set.seed(1001)
files <- T
f <- function(x) 6*exp(-0.5*x)+1
a <- 1
b <- 10
par(mfrow=c(2, 2), mar=c(3.1, 4.1, 1.8, 1.1), xaxs='i', yaxs='i')


plot(f, xlim=c(0, 11), ylim=c(0, 8), las=1, lwd=2, xlab="", ylab="")
	mtext(expression(x), side=1, font=2, cex=1.0, line=2)
	mtext(expression(f(x)), side=2, font=2, cex=1.0, line=2)
N <- 1
for(i in 1:N){
	polygon(c(a, b, b, a), c(0, 0, f(b), f(a)))
}

plot(f, xlim=c(0, 11), ylim=c(0, 8), las=1, lwd=2, xlab="", ylab="")
	mtext(expression(x), side=1, font=2, cex=1.0, line=2)
	mtext(expression(f(x)), side=2, font=2, cex=1.0, line=2)
N <- 10
dx <- (b-a)/N
for(i in 1:N){
	polygon(c(a+(i-1)*dx, a+(i)*dx, a+(i)*dx, a+(i-1)*dx), c(0, 0, f(a+(i)*dx), f(a+(i-1)*dx)))
}
#######################

# par(mfrow=c(1, 2), mar=c(3.1, 4.1, 1.8, 1.1), xaxs='i', yaxs='i')


plot(f, xlim=c(0, 11), ylim=c(0, 8), las=1, lwd=2, xlab="", ylab="")
	mtext(expression(x), side=1, font=2, cex=1.0, line=2)
	mtext(expression(f(x)), side=2, font=2, cex=1.0, line=2)
N <- 2
dx <- (b-a)/N

# for(i in 1:N){
	x0 <- a#+2*(i-1)*dx
	x1 <- x0+dx
	x2 <- x1+dx
	xs <- seq(x0, x2, length=100)
p <- function(x)f(x0)*(x-x1)*(x-x2)/((x0-x1)*(x0-x2))+f(x1)*(x-x0)*(x-x2)/((x1-x0)*(x1-x2))+f(x2)*(x-x0)*(x-x1)/((x2-x0)*(x2-x1))
	polygon(c(rev(xs),(xs)), c(0*xs, sapply(xs, p)), col="lightgray")
	points(c(x0,x1,x2), sapply(c(x0,x1,x2), p), col="lightgray",pch=19)
	
plot(f, xlim=c(0, 11), ylim=c(0, 8), las=1, lwd=2, xlab="", ylab="")
	mtext(expression(x), side=1, font=2, cex=1.0, line=2)
	mtext(expression(f(x)), side=2, font=2, cex=1.0, line=2)
N <- 10
dx <- (b-a)/N
for(i in 1:(N/2)){

	x0 <- a+2*(i-1)*dx
	x1 <- x0+dx
	x2 <- x1+dx
	xs <- seq(x0, x2, length=100)
p <- function(x)f(x0)*(x-x1)*(x-x2)/((x0-x1)*(x0-x2))+f(x1)*(x-x0)*(x-x2)/((x1-x0)*(x1-x2))+f(x2)*(x-x0)*(x-x1)/((x2-x0)*(x2-x1))
	polygon(c(rev(xs),(xs)), c(0*xs, sapply(xs, p)), col="lightgray")
	points(c(x0,x1,x2), sapply(c(x0,x1,x2), p), col="lightgray",pch=19)
}
