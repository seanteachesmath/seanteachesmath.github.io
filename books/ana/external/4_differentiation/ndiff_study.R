par(mfrow=c(1, 2), mar=c(4.1, 4.1, 1.1, 1.1))
## make up data
# set.seed(100)
# xs <- seq(0, 0.45, by=0.05)
# n <- length(xs)
# ys <- 3 + 4*xs^2
# ys2 <- ys + runif(n, -1, 1)/10
# plot(xs, ys, xlim=c(0, 0.5), ylim=c(0, 10))
# plot(function(x) 3 + 4*x^2, xlim=c(0, 0.45), add=T)

## enter given data
xs <- seq(0, 0.45, by=0.05)
n <- length(xs)
ys <- c(3.0, 3.2, 3.4, 3.6, 3.8, 4.0, 4.2, 4.4, 4.6, 4.8)
plot(xs, ys, xlim=c(0, 0.5), ylim=c(0, 10))
lm(ys ~ xs)
plot(function(x) 3 + 4*x, xlim=c(0, 0.45), add=T) ## abline(lm(ys ~ xs)) ## works also

ys2 <- c(2.96, 3.15, 3.41, 3.51, 3.79, 4.00, 4.26, 4.37, 4.61, 4.73)
points(xs, ys2, pch=19)

(fp <- (ys[1+1] - ys[1])/(xs[1+1] - xs[1]))## initialize
for(i in 2:(n-1)){## repeat
	fp <- c(fp, (ys[i+1] - ys[i])/(xs[i+1] - xs[i]))
}
fp## look

plot(xs[-n], fp, ylim=c(0, 10), type='b')## or xs[1:9]

(fp <- (ys[2:n] - ys[1:(n-1)])/(xs[2:n] - xs[1:(n-1)]))## slick
(fp2 <- (ys2[2:n] - ys2[1:(n-1)])/(xs[2:n] - xs[1:(n-1)]))## slick

points(xs[-n], fp2, pch=19, type='b')
## if you use the code and print these graphs, make them look better