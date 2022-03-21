f <- function(x) exp(x)
P4 <- function(x) 1 + x + x^2/2 + x^3/6 + x^4/24
Tt4 <- function(x) x^4 - x^2 + 1/8

P3 <- function(x)P4(x) - 1/24*Tt4(x)
P2 <- function(x)P3(x) - 1/6*(x^3 - 3/4*x)
P1 <- function(x)P2(x) - 13/24*(x^2 - 1/2) ## coeffs of highest term
P0 <- function(x)P1(x) - 9/8*(x) ## coeffs of highest term

par(mfrow=c(1,2), mar=c(4.1,4.1,1.1,1.1))
plot(f, xlim=c(0, 1),ylim=c(0, 3), las=1)
plot(P4, col=2, add=T)
plot(P3, xlim=c(0, 1), col=4, add=T)
plot(P2, xlim=c(0, 1), col=3, add=T)
plot(P1, xlim=c(0, 1), col=5, add=T)
plot(P0, xlim=c(0, 1), col=6, add=T)

plot(function(x)f(x)-P4(x), col=2, ylim=c(-0.25, 0.25), las=1)
plot(function(x)(f(x)-P3(x))/f(x), col=3, add=T)
plot(function(x)(f(x)-P2(x))/f(x), col=4, add=T)
plot(function(x)(f(x)-P1(x))/f(x), col=5, add=T)
plot(function(x)(f(x)-P0(x))/f(x), col=6, add=T)