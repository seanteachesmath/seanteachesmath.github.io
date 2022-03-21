files <- T
if(files)pdf("fixpt_trig.pdf", height=5, width=10)


par(mfrow=c(1, 2), mar=c(4.1, 5.1, 1.1, 1.1), xaxs='i', yaxs='i')

f <- function(x)sin(x)

plot(f, xlim=c(0, pi/2), ylim=c(0, 1), las=1, lwd=2, ylab=expression(g(x)==sin(x)), xlab=expression(x), cex.lab=1.25)
abline(a=0, b=1, lty=3)


p0 <- 1
ps <- p0
N <- 20
cols <- hcl.colors(N+1, palette="viridis")
for(i in 1:N){
	
		p1 <- f(p0)
		
		ps <- c(ps, p1)
	if(i==1){
		segments(p0, 0, p0, f(p0), col=cols[i], lwd=2)
		segments(p0, f(p0), p1, f(p0), col=cols[i], lwd=2)
	}else{
		segments(p0, p0, p0, p1, col=cols[i], lwd=2)
		segments(p0, f(p0), p1, f(p0), col=cols[i], lwd=2)
	}
	#points(p0, p1, pch=19)
		p0 <- p1

}
#ps
#ps.lab <- parse(text=paste("x[", 0:(length(ps)-1),"]", sep=''))
#axis(1, ps, labels=F, tick=T, cex.axis=0.7, padj=-1.5, col.ticks=gray(length(ps)/length(ps)))
for(i in 1:(N+1))axis(1, ps[i], labels=F, tick=T, tck=0.1*(1-(i/(N+1))^1), cex.axis=0.7, padj=-1.5, col.ticks=cols[i], lwd=2)

f <- function(x)cos(x)

plot(f, xlim=c(0, pi/2), ylim=c(0, 1), las=1, lwd=2, ylab=expression(g(x)==cos(x)), xlab=expression(x), cex.lab=1.25)
abline(a=0, b=1, lty=3)

p0 <- 1
ps <- p0
for(i in 1:N){
	
		p1 <- f(p0)
		
		ps <- c(ps, p1)
	if(i==1){
		segments(p0, 0, p0, f(p0), col=cols[i], lwd=2)
		segments(p0, f(p0), p1, f(p0), col=cols[i], lwd=2)
	}else{
		segments(p0, p0, p0, p1, col=cols[i], lwd=2)
		segments(p0, f(p0), p1, f(p0), col=cols[i], lwd=2)
	}
	#points(p0, p1, pch=19)
		p0 <- p1

}
# ps
# ps.lab <- parse(text=paste("x[", 0:(length(ps)-1),"]", sep=''))
# axis(1, ps, labels=F, tick=T, cex.axis=0.7, padj=-1.5)
for(i in 1:(N+1))axis(1, ps[i], labels=F, tick=T, tck=0.1*(1-(i/(N+1))^1), cex.axis=0.7, padj=-1.5, col.ticks=cols[i], lwd=2)


if(files)dev.off()

cbind(0:(length(ps)-1), ps)
