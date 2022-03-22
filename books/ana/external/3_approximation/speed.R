

xs <- c(0, 3, 5, 8, 13)
h <- diff(xs)

as <- c(0, 225, 383, 623, 993)
plot(xs, as)
(A <- matrix(c(
2*h[1], h[1], 0, 0, 0,
h[1], 2*(h[1]+h[2]), h[2], 0, 0, 
0, h[2], 2*(h[2]+h[3]), h[3], 0,
0, 0, h[3], 2*(h[3]+h[4]), h[4],
 0, 0, 0, h[4], 2*h[4]), byrow=T, nrow=5, ncol=5))

(rhs <- matrix(c(
3*(as[2]-as[1])/h[1] - 3*(75), 
3*(as[3]-as[2])/h[2] - 3*(as[2]-as[1])/h[1], 
3*(as[4]-as[3])/h[3] - 3*(as[3]-as[2])/h[2], 
3*(as[5]-as[4])/h[4] - 3*(as[4]-as[3])/h[3], 
3*72-3*(as[5]-as[4])/h[4] 
), nrow=5, ncol=1))

(cs <- solve(A, rhs))
bs <- NULL
ds <- NULL
for(i in 4:1){
	bs[i] <- (as[i+1]-as[i])/h[i] - h[i]*(cs[i+1] + 2*cs[i])/3
	ds[i] <- (cs[i+1] -cs[i])/(3*h[i])
}

(coefs <- rbind(as[1:4], bs, cs[1:4],ds))


## hermite, symbolic work in mathematica
h <- function(x) 75*x + 7.16191*x^2 - 10.0953*x^3 + 5.50812*x^4 - 1.5383*x^5 + 0.243041*x^6 - 0.0218757*x^7 + 0.00104059*x^8 - 0.0000202236*x^9
hp <- function(x) 75 + 2*7.16191*x - 3*10.0953*x^2 + 4*5.50812*x^3 - 5*1.5383*x^4 + 6*0.243041*x^5 - 7*0.0218757*x^6 + 8*0.00104059*x^7 - 9*0.0000202236*x^8
 
 
# # # # # # # #
# # # # # # # #
# # # # # # # #
files <- T
if(files)pdf("speed1.pdf", height=5, width=5)
#layout(matrix(c(1,1,2,3), 2, 2, byrow=T))
par(mar=c(4.1, 4.1, 1.1, 1.1), xaxs='i', yaxs='i')

plot(h, xlim=c(0, 13), ylim=c(0, 1000), xlab="time", ylab="distance", las=1, lwd=2)
(mod <- lm(as ~ xs))
abline(mod, col=4, lty=31, lwd=2)
for(i in 1:4){
	plot(function(x) coefs[1, i] + coefs[2, i]*(x-xs[i]) + coefs[3, i]*(x-xs[i])^2+ + coefs[4, i]*(x-xs[i])^3, xlim=c(xs[i], xs[i+1]), add=T, col=2, lty=2, lwd=2)
}
legend("topleft", c("Data", "Hermite", "Spline", "Linear trend"), pch=c(19, NA, NA, NA), lty=c(NA, 1, 2, 3), col=c(1, 1, 2, 4), lwd=2)
points(xs, as, pch=19)
if(files)dev.off()

# # # # # # # #
if(files)pdf("speed2.pdf", height=5, width=5)
plot(hp, xlim=c(0, 13), ylim=c(40, 120), xlab="time", ylab="ft/sec", las=1, lwd=2)
abline(h=coefficients(mod)['xs'], col=4, lty=3, lwd=2)
for(i in 1:4){
	plot(function(x) (coefs[2, i] + 2*coefs[3, i]*(x-xs[i]) + 3*coefs[4, i]*(x-xs[i])^2), xlim=c(xs[i], xs[i+1]), add=T, col=2, lty=2, lwd=2)
}
points(xs, c(75, 77, 80, 74, 72), pch=19)
dev.off()
# # # # # # # #
if(files)pdf("speed3.pdf", height=5, width=5)
plot(function(x)hp(x)*(3600/5280), xlim=c(0, 13), ylim=c(40, 120)*(3600/5280), xlab="time", ylab="mph", las=1, lwd=2)
abline(h=coefficients(mod)['xs']*(3600/5280), col=4, lty=3, lwd=2)

for(i in 1:4){
	plot(function(x) ((coefs[2, i] + 2*coefs[3, i]*(x-xs[i]) + 3*coefs[4, i]*(x-xs[i])^2))*(3600/5280), xlim=c(xs[i], xs[i+1]), add=T, col=2, lty=2, lwd=2)
}
points(xs, c(75, 77, 80, 74, 72)*(3600/5280), pch=19)
if(files)dev.off()