n <- 1000
## find y < x^2 (approx integral to x^2 on [0, 1])
## note rs = (x1, y1, x2, y2, ...)
rs <- runif(2*n, 0, 1)
a <- rs[seq(2, 2*n, by=2)] < rs[seq(1, 2*n, by=2)]^2
sum(a)
sum(a)/n

####
## find sin(sqrt(ln(x+y+1))) on the region (x-1/2)^2 + (y-1/2)^2 <- 1/4
n <- 1000
rs <- runif(2*n, 0, 1)

est <- sin(sqrt(log(rs[seq(1, 2*n, by=2)] + rs[seq(2, 2*n, by=2)]+ 1)))[(rs[seq(1, 2*n, by=2)] - 1/2)^2 + (rs[seq(1, 2*n, by=2)] - 1/2)^2 <= 0.25]

pi/4*sum(est)/sum(((rs[seq(1, 2*n, by=2)] - 1/2)^2 + (rs[seq(2, 2*n, by=2)] - 1/2)^2) <= 0.25)

####
# # find volume of region 
# # x^2 + sin(y) <= z and 
# # x-z+e^y <= 1 for 
# # 0 <=, x, y, z, <= 1
# # find which points satisfied the conditions
n <- 1000
rs <- runif(3*n, 0, 1)
a <- rs[seq(1, 3*n, by=3)]^2 + sin(rs[seq(2, 3*n, by=3)]) <= rs[seq(3, 3*n, by=3)]
b <- rs[seq(1, 3*n, by=3)] - rs[seq(3, 3*n, by=3)] + exp(rs[seq(2, 3*n, by=3)]) <= 1

1*sum(a & b)/n

####
# # find volume of region 
# # x^2 + sin(y) <= z and 
# # x-z+e^y <= 1 for 
# # 0 <=, x, y, z, <= 1
ests <- NULL
for(i in 1:100){
	rs <- runif(3*n, 0, 1)

a <- rs[seq(1, 3*n, by=3)]^2 + sin(rs[seq(2, 3*n, by=3)]) <= rs[seq(3, 3*n, by=3)]
b <- rs[seq(1, 3*n, by=3)] - rs[seq(3, 3*n, by=3)] + exp(rs[seq(2, 3*n, by=3)]) <= 1

ests <- c(ests, 1*sum(a & b)/n)
}
hist(ests)