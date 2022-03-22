## define a function
f <- function(t) 2*t*exp(-0.1*t)
# plot(f, xlim=c(0, 10)) ## graph?
# abline(a=0, b=1)

## evaluate it
f(2)

## store a value and print to screen
(x <- 0.1)

## automation, method 1
## evaluate f(x=2) and overwrite x with the result
## can run this line repeatedly by pressing command+return (mac) or control+r (windows)
(x <- f(x))

## automation, method 2
## screen output
x <- 0.1
for(i in 1:20){
	x <- f(x)
	print(x)
}

## automation, method 3
## storage
x <- 0.1
xs <- x

for(i in 1:20){
	x <- f(x)
	xs <- c(xs, x)
}
xs
## Let f take the form of a fixed-point problem and try this on your homework or one of the problems from the supplemental worksheet1