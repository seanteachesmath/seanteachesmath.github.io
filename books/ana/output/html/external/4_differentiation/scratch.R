b <- 2
f <- function(x)exp(-b*x)

dx <- 0.1
x0 <- 1.0
d1 <- (f(x0+dx)-f(x0))/dx
exact <- -b*f(x0) 
e1 <- abs(exact-d1)
dat <- NULL
for(i in 1:100){
	dx <- dx/2
	d2 <- (f(x0+dx)-f(x0))/dx
	e2 <- abs(exact-d2)
dat <- rbind(dat, c(i, dx, e2, e2/e1))
	print(e2/e1)
	e1 <- e2
}

(dat <- as.data.frame(dat))
names(dat) <- c("divs", "dx", "err", "ratio")
plot(dat[, c(2,3)], log='xy')

(dx <- dat[which(dat$err==min(dat$err)), "dx"])
(dx <- 2*dx)a
dx <- 0.00000001
d1 <- (f(x0+dx)-f(x0))/dx
(dx <- dx/2)
(d1 <- (f(x0+dx)-f(x0))/dx)
abs(exact-d1)

dx <- 0.00000001
d1 <- (f(x0+dx)-f(x0))/dx
(dx <- dx/10)
(d1 <- (f(x0+dx)-f(x0))/dx)
abs(exact-d1)


(mod <- lm(err ~ divs, dat, subset=divs < 20))
# abline(mod)

log10(dat[,2])


for(n in 1.5:13.5){
print((exp(0.0 + 10^(-n)) - exp(0.0))/(10^(-n)))
print((exp(0.0 + 10^(-n)/2.0) - exp(0.0))/(10^(-n)/2.0))
}