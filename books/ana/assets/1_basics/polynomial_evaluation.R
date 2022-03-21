files <- T
if(!"microbenchmark"%in%row.names(installed.packages()))install.packages("microbenchmark")
require(microbenchmark)

f1 <- function(x) x^5 - 15*x^4 + 85*x^3 - 225*x^2 + 274*x -120

f2 <- function(x) (x - 1)*(x - 2)*(x - 3)*(x - 4)*(x - 5)

f3 <- function(x) -120 + x*(274 + x*(-225 + x*(85 + x*(-15 + x))))


x <- runif(1000)

## checking run time
start.time <- Sys.time()
a <- sapply(x, f1)
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken

start.time <- Sys.time()
a <- sapply(x, f2)
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken

start.time <- Sys.time()
a <- sapply(x, f3)
end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken


## more sophisticated package
(times1 <- microbenchmark( sapply(x, f1), sapply(x, f2), times=1e3))

(times2 <- microbenchmark( sapply(x, f1), sapply(x, f3), times=1e3))

# wait for it 
dat <- rbind(times1, times2)
dat$time2 <- dat$time/1e5

if(files)pdf("polynomial_evaluation_plot.pdf", height=5, width=5)
par(mar=c(5.1, 5.1, 1.1, 1.1))


plot(dat[, c("expr", "time2")], ylim=c(2, 250), log='y', axes=F, xlab="", ylab="", main="")
mtext("Method", 1, line=3, cex=1.5)
mtext(expression(paste("Compute time (times ", 10^5 , ")")), 2, line=2.5, cex=1.5)
axis(1, 1:3, c("Normal", "Factored", "Nested"), cex=1.5)
axis(2, c(2, 5, 20, 50, 100, 200, 250), las=1)
box()
if(files)dev.off()