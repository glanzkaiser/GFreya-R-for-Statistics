# https://stackoverflow.com/questions/66266703/draw-discrete-cdf-in-r
library(ggplot2)

# Create the data first
x <- 0:5
fx <- c(0, 1/16, 1/4, 3/8, 1/4, 1/16)

Fx <- cumsum(fx)
n <- length(x)

#make an empty plot

p <- plot(x = NA, y = NA, pch = NA, 
     xlim = c(0, max(x)), 
     ylim = c(0, 1),
     xlab = "x",
     ylab = "F(x)",
     main = "Discrete cumulative distribution function")

# Create the points and lines
points(x = x[-n], y = Fx[-1], pch=19)
points(x = x[-1], y = Fx[-1], pch=1)
for(i in 1:(n-1)) points(x=x[i+0:1], y=Fx[c(i,i)+1], type="l")


print(p)