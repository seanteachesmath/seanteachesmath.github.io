L0 <- function(x) 1/2*(x)*(x-1)
L1 <- function(x) -1/1*(x+1)*(x-1)
L2 <- function(x) 1/2*(x)*(x+1)

L0p <- function(x) x-1/2
L1p <- function(x) -2*x
L2p <- function(x) x+1/2

h0 <- function(x) (1-2*(x-(-1))*L0p(-1))*(L0(x))^2
h1 <- function(x) (1-2*(x-(0))*L1p(0))*(L1(x))^2
h2 <- function(x) (1-2*(x-(1))*L2p(1))*(L2(x))^2

hh0 <- function(x) (x-(-1))*(L0(x))^2
hh1 <- function(x) (x-(0))*(L1(x))^2
hh2 <- function(x) (x-(1))*(L2(x))^2


e <- function(x)exp(x)
L <- function(x)exp(-1)*L0(x) + exp(0)*L1(x) + exp(1)*L2(x)
H <- function(x)exp(-1)*h0(x) + exp(0)*h1(x) + exp(1)*h2(x) + exp(-1)*hh0(x) + exp(0)*hh1(x) + exp(1)*hh2(x)

par(mar=c(4.1, 4.1, 1.1, 1.1))
plot(e, xlim=c(-1, 1), ylim=c(0, 3))
plot(L, xlim=c(-1, 1), col=2, add=T)
plot(H, xlim=c(-1, 1), col=3, add=T)

par(mar=c(4.1, 4.1, 1.1, 5.1))
plot(function(x)e(x)-L(x), xlim=c(-1, 1), ylim=c(-0.08, 0.08), ylab="act err", las=1)
par(new=T)
plot(function(x)e(x)-H(x), xlim=c(-1, 1), ylim=c(-0.008, 0.008), col=2, las=1, axes=F)
axis(4, las=1, col=2, col.axis=2)

par(mar=c(4.1, 4.1, 1.1, 1.1))
plot(function(x)(abs(e(x)-L(x))), xlim=c(-1, 1), ylim=c(1e-8, 0.1), log='y', las=1, ylab="log abs err")
plot(function(x)(abs(e(x)-H(x))), xlim=c(-1, 1), col=2, add=T)
