a <- 0
b <- 1
f <- function(x)sin(pi*x)
a11 <- integrate(function(x) 1 + 0*x, lower=a, upper=b)$value

a12 <- a21 <- integrate(function(x) x, lower=a, upper=b)$value 

a13 <- a22 <- a31 <- integrate(function(x) x^2, lower=a, upper=b)$value

a23 <- a32 <- integrate(function(x) x^3, lower=a, upper=b)$value

a33 <- integrate(function(x) x^4, lower=a, upper=b)$value


(A <- matrix(c(a11, a12, a13, a21, a22, a23, a31, a32, a33 ), 3, 3, byrow=T))

b1 <- integrate(function(x) f(x), lower=a, upper=b)$value
b2 <- integrate(function(x) x*f(x), lower=a, upper=b)$value
b3 <- integrate(function(x) x^2*f(x), lower=a, upper=b)$value
b <- matrix(c(b1, b2, b3), 3, 1)

cs <- solve(A, b)

file <- T
if(file)pdf("example-8-2-1.pdf", height=10, width=5)
par(mfrow=c(2, 1), mar=c(4.1, 4.1, 1.1, 1.1))
plot(f, xlim=c(0, 1), ylim=c(-0.1, 1), las=1)
plot(function(x) cs[1] + cs[2]*x + cs[3]*x^2, xlim=c(0, 1), col=2, add=T)
for(i in 1:3)text(0.4, 0.4-0.1*i, bquote(a[.(i-1)]==.(round(cs[i], 4))), pos=4)
legend("topleft", c("Function", "Approximation"), col=c(1, 2), lwd=1, bg="white")

plot(function(x) f(x) - (cs[1] + cs[2]*x + cs[3]*x^2), xlim=c(0, 1), ylim=c(-0.05, 0.05), col=2, ylab="Error", las=1)
# plot(function(x) (f(x) - (cs[1] + cs[2]*x + cs[3]*x^2))^2, xlim=c(0, 1), ylim=c(-0.05, 0.05), col=2, lty=3, add=T)
if(file)dev.off()