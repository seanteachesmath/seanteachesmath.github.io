if("scatterplot3d"%in%rownames(installed.packages())){library(scatterplot3d)}else{install.packages("scatterplot3d")}
library(scatterplot3d)
files <- F
# ?cloud
n <- 50000
rs <- runif(3*n, 0, 1)
z <- rs[seq(3, 3*n, by=3)]*2
x <- 2*(rs[seq(1, 3*n, by=3)]-1/2)
y <- 2*(rs[seq(2, 3*n, by=3)]-1/2)

a.z <- z[x^2 + y^2 < z*(2-z) & (1 < z^2)]
a.x <- x[x^2 + y^2 < z*(2-z) & (1 < z^2)]
a.y <- y[x^2 + y^2 < z*(2-z) & (1 < z^2)]

a.z2 <- z[x^2 + y^2 < z*(2-z) & (z^2 > x^2 + y^2) & z^2 < 1]
a.x2 <- x[x^2 + y^2 < z*(2-z) & (z^2 > x^2 + y^2) & z^2 < 1]
a.y2 <- y[x^2 + y^2 < z*(2-z) & (z^2 > x^2 + y^2) & z^2 < 1]

if(files)pdf("ice_cream.pdf", height=5, width=5)
cols1 <- c(sample(c("black", "white"), length(a.x), replace=T), rep("tan", length(a.x2)))

cols2 <- c(rep("pink", length(a.x)), rep("tan", length(a.x2)))

scatterplot3d(c(a.x, a.x2), c(a.y, a.y2), c(a.z,a.z2), color=cols2, pch=19, xlim=c(-1, 1), ylim=c(-1, 1), zlim=c(0, 2), angle=20, main=bquote(est==.(2^3*(length(a.z)+length(a.z2))/n)), xlab="", ylab="", zlab="", axes=F)
if(files)dev.off()
1/3*pi*1^2*1 + (4/3*pi*1^3)/2
if(files)png("ice_cream.png")
cols1 <- c(sample(c("black", "white"), length(a.x), replace=T), rep("tan", length(a.x2)))

cols2 <- c(rep("pink", length(a.x)), rep("tan", length(a.x2)))

scatterplot3d(c(a.x, a.x2), c(a.y, a.y2), c(a.z,a.z2), color=cols2, pch=19, xlim=c(-1, 1), ylim=c(-1, 1), zlim=c(0, 2), angle=20, main=bquote(est==.(2^3*(length(a.z)+length(a.z2))/n)), xlab="", ylab="", zlab="", box=F, grid=F)
if(files)dev.off()
1/3*pi*1^2*1 + (4/3*pi*1^3)/2


?scatterplot3d