(user<-as.vector(Sys.info()["user"]))
setwd(paste("/Users/",user,"/Dropbox/uco/spring_14/2153/lectures/topics/figures/",sep=""))
# I'd ignore that ^

f <- function(x)x/(1+x)
a <- 0.1
b <- 0.6
pdf("rate_of_change.pdf", height=10, width=10)
par(xaxs='i', yaxs='i', mai=c(0.8, 1.1, 0.1, 0.1))
plot(f,xlim=c(0,1),ylab="", xlab="", axes=F, lwd=2)
box()
mtext(expression(t),1, font=2, las=1, line=2, cex=2.5)
mtext(expression(f(t)),2, font=2, las=1, line=2, cex=2.5)
axis(1, c(a, b), c(expression(a), expression(b)), cex.axis=2.25)
axis(2, c(f(a), f(b)), c(expression(f(a)), expression(f(b))), las=1, cex.axis= 2.25)
m <- (f(b)-f(a))/(b-a)

offset <- 0.01
abline(a=f(a) - m*a, b=m, col="gray", lwd=2)
arrows(a+ offset, f(a), b-offset, f(a), code=3, length=0.1)
arrows(b, f(a)+ offset, b, f(b)-offset, code=3, length=0.1)
text(b+offset, (f(a)+f(b))/2, expression(paste(Delta,f)==f(b)-f(a)), pos=4, srt=0, cex= 2.25)
text((b+a)/2, f(a)-offset/2, expression(paste(Delta,t)==b-a), pos=1, srt=0, cex= 2.25)
points(c(a, b), c(f(a), f(b)), pch=19)
dev.off()