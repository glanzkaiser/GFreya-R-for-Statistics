
library('ggplot2')

# Create a sample of 120 numbers which are incremented by 1.
x <- seq(0,120,by = 1)

# Create the binomial distribution.
y <- dbinom(x,120,0.2)

# Give the chart file a name.
png(file = "dbinom.png")

# Plot the graph for this sample.
p <- plot(x,y, xlab='x', ylab='P(X=x)', main='Binomial PMF')

# Save the file.
dev.off()