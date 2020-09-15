pdf("/Users/slaverty/Dropbox/uco/fall_13/2153/lectures/days/quad.pdf", height=5, width=5)
par(xaxs='i', yaxs='i')
plot(function(x)x^2, xlim=c(0,1), las=1, xlab="time, t, sec", ylab="velocity, v(t), m/s", font.lab=2, lwd=2)
for(i in c(1:5)/5){
	abline(h=i, lty=3)
	abline(v=i, lty=3)
}
dev.off()