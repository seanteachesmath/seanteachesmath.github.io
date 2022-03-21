files <- T
if(files)pdf("fixedpoint.pdf", height=5, width=5)
f <- function(x)2^-x
par(mar=c(4.1, 5.1, 1.1, 1.1), xaxs='i', yaxs='i')

plot(f, xlim=c(0, 1), ylim=c(0, 1), las=1, lwd=2, ylab=expression(g(x)==2**-x), xlab=expression(x), cex.lab=1.25)
abline(a=0, b=1, lty=3)

p0 <- 0.5
ps <- p0
for(i in 1:30){
	
		p1 <- f(p0)
		
		ps <- c(ps, p1)
	if(i==1){
		segments(p0, 0, p0, f(p0))
		segments(p0, f(p0), p1, f(p0))
	}else{
		segments(p0, p0, p0, p1)
		segments(p0, f(p0), p1, f(p0))
	}
	#points(p0, p1, pch=19)
		p0 <- p1

}
ps
# text(ps[1:5], 0*ps[1:5], parse(text=paste("x[", 0:(length(ps)-1),"]", sep=''))[1:5], cex=0.75, adj=c(0.5, 0))
axis(1, ps[1:5], parse(text=paste("p[", 0:(length(ps)-1),"]", sep=''))[1:5], cex.axis=0.4, hadj=0.5, padj=-3)

if(files)dev.off()

cbind(0:(length(ps)-1), ps)


(log10(10^-5)-log10(0.5))/log10(0.6931)