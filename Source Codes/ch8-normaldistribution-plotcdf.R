
library('ggplot2')

# The pnorm() function calculates the cumulative probability up to a given quantile.
# creating a sequence of values
# between -10 to 10 with a difference of 0.1
x <- seq(-10, 10, by=0.1)

y <- pnorm(x, mean = 2.5, sd = 2)

# output to be present as PNG file
png(file="pnormExample.png")

# Plot the graph.
plot(x, y)

# saving the file
dev.off() 
