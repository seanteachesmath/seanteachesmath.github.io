options(digits=20)

b <- 6
1/b

x <- 1/4
for(i in 1:10){
	x <- x*(2-b*x)
	print(x)
}