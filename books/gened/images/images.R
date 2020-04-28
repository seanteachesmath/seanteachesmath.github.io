library(jpeg)

dat <- readJPEG("butterfly2.jpg")

file <- T

# if(file)pdf("sample.pdf", height=5, width=5)

red <- t(as.matrix(dat[,,1]))
green <- t(as.matrix(dat[,,2]))
blue <- t(as.matrix(dat[,,3]))
if(file)png("butterfly-red.png")
par(mar=c(0.8, 0.8, 0.8, 0.8), mfrow=c(1, 1))
image(red, main="butterfly (red layer)", col=gray(0:255/255), axes=F)
if(file)dev.off()
if(file)png("butterfly-green.png")
par(mar=c(0.8, 0.8, 0.8, 0.8), mfrow=c(1, 1))
image(green, main="butterfly (green layer)", col=gray(0:255/255), axes=F)
if(file)dev.off()
if(file)png("butterfly-blue.png")
par(mar=c(0.8, 0.8, 0.8, 0.8), mfrow=c(1, 1))
image(blue, main="butterfly (blue layer)", col=gray(0:255/255), axes=F)
if(file)dev.off()


tmp <- t(as.matrix(dat[,,1]))
r <- nrow(tmp)
col <- ncol(tmp)

if(file)png("butterfly-noise.png")
par(mar=c(0.8, 0.8, 0.8, 0.8), mfrow=c(2, 2))
for(n in 0:3){
noise <- matrix(runif(r*col, 0.2*n, 1), nrow=r, ncol=col)
tmp2 <- tmp*(noise)
image(tmp2, col=gray(0:255/255), axes=F)
}
if(file)dev.off()

if(file)pdf("sample2.pdf", height=5, width=5)

ds <- dim(as.matrix(dat[,,3]))
row <- ceiling(2.25*ds[2]/5)

par(mfrow=c(2,1), mar=c(4.1, 4.1, 0.8, 0.8), xaxs='i', yaxs='i')
image(1:ds[1], 1:ds[2], as.matrix(dat[,,3]), main="B: post oak_2.0", xlim=c(0, ds[1]), ylim=c(0, ds[2]))
abline(h=row)

plot(as.matrix(dat[, , 1]+dat[, , 2]+dat[, , 3])[, row], pch=".", xlim=c(0, ds[1]), ylim=c(0, 3), las=1)
# points(as.matrix(dat[, , 1])[, row], pch=".", col=2)
# points(as.matrix(dat[, , 2])[, row], pch=".", col=3)
points(as.matrix(dat[, , 3])[, row], pch=".", col=4)

if(file)dev.off()




if(file)pdf("sample3.pdf", height=5, width=5)
ds <- dim(as.matrix(dat[,,3]))

row <- ceiling(2.25*ds[2]/5)
layout(matrix(1:6, nrow=2, ncol=3, byrow=F))
par(mar=c(4.1, 4.1, 0.8, 0.8), xaxs='i', yaxs='i')

image(1:ds[1], 1:ds[2], as.matrix(dat[,,1]), main="R: post oak_2.0", xlim=c(0, ds[1]), ylim=c(0, ds[2]))
abline(h=row)
plot(as.matrix(dat[, , 1]+dat[, , 2]+dat[, , 3])[, row], pch=".", xlim=c(0, ds[1]), ylim=c(0, 3), las=1)
points(as.matrix(dat[, , 1])[, row], pch=".", col=2)


image(1:ds[1], 1:ds[2], as.matrix(dat[,,2]), main="G: post oak_2.0", xlim=c(0, ds[1]), ylim=c(0, ds[2]))
abline(h=row)
plot(as.matrix(dat[, , 1]+dat[, , 2]+dat[, , 3])[, row], pch=".", xlim=c(0, ds[1]), ylim=c(0, 3), las=1)
points(as.matrix(dat[, , 2])[, row], pch=".", col=3)

image(1:ds[1], 1:ds[2], as.matrix(dat[,,3]), main="B: post oak_2.0", xlim=c(0, ds[1]), ylim=c(0, ds[2]))
abline(h=row)
plot(as.matrix(dat[, , 1]+dat[, , 2]+dat[, , 3])[, row], pch=".", xlim=c(0, ds[1]), ylim=c(0, 3), las=1)
points(as.matrix(dat[, , 3])[, row], pch=".", col=4)

if(file)dev.off()
