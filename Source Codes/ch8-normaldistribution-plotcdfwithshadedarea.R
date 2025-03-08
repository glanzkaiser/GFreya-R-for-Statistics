# https://stackoverflow.com/questions/27898931/how-to-shade-a-graph-using-curve-in-r

library('ggplot2')

z <- seq(72,92,0.01)
fz <- dnorm(z,mean=82,sd=3)
q <- qnorm(0.05, mean=82,sd=3) # the quantile
x <- seq(72, q, 0.01)
y <- c(dnorm(x, mean=82,sd=3), 0, 0)
x <- c(x, q, 72)
p <- ggplot() + geom_line(aes(z, fz)) +
	   labs(x="x", y = "P(X<x)", title = "Normal distribution for baguette") +
           geom_polygon(data = data.frame(x=x, y=y), aes(x, y), fill='blue')