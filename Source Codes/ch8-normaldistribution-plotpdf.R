
library('ggplot2')
# The dnorm() function computes the density (height of the probability density function) at a given point for a normal distribution.
# creating a sequence of values 
# between -15 to 15 with a difference of 0.1
x = seq(-15, 15, by=0.1)
 
y = dnorm(x, mean(x), sd(x))
 
# output to be present as PNG file
png(file="dnormExample.png")
 
# Plot the graph.
plot(x, y)
 
# saving the file
dev.off() 