 (user<-as.vector(Sys.info()["user"]))
 setwd(paste("/Users/",user,"/Dropbox/uco/fall_13/2153/lectures/days",sep=""))
# I'd ignore that ^

pdf("cell_vol.pdf", height=5, width=5, bg="white")
par(xaxs='i', yaxs='i')
plot(function(x)(-x*(x-3/2)^2*(x-4.25)/5)+1, xlim=c(0, 4), ylim=c(0, 4), ylab="Cell Volume (cu cm)", las=1, font.lab=2, xlab="Time (min)")
for(i in 0:8){
	abline(v=i/2, lty=3, col="gray", lwd=0.5)
	abline(h=i/2, lty=3, col="gray", lwd=0.5)
	abline(v=floor(i/2), lty=3, lwd=0.5)
	abline(h=floor(i/2), lty=3, lwd=0.5)
}

dev.off()

pdf("diff_cell_vol.pdf", height=10, width=5, bg="white")
par(xaxs='i', yaxs='i')
plot(NA, xlim=c(0, 4), ylim=c(-4, 4), ylab="Rate of Change Cell Volume (cu cm/min)", las=1, font.lab=2, xlab="Time (min)")
for(i in -8:8){
	abline(v=i/2, lty=3, col="gray", lwd=0.5)
	abline(h=i/2, lty=3, col="gray", lwd=0.5)
	abline(v=floor(i/2), lty=3, lwd=0.5)
	abline(h=floor(i/2), lty=3, lwd=0.5)
}

dev.off()

plot(function(x)(-x*(x-3/2)^2*(x-4.25)/5)+1, xlim=c(-1, 4), ylim=c(0, 4), ylab="Cell Volume (cu cm)", las=1, font.lab=2, xlab="Time (min)")
abline(a=1, b=2)
abline(a=14.3, b=-3)
abline(v=0)