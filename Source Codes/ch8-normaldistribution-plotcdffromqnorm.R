
library('ggplot2')
# The qnorm() function computes the quantile (inverse of pnorm()) for a given cumulative probability.
# lower.tail: If TRUE, probabilities are P[X ≤ x]; otherwise, P[X > x].
# Create a sequence of probability values 
# incrementing by 0.02.
x <- seq(0, 1, by = 0.02)

y <- qnorm(x, mean(x), sd(x))

# output to be present as PNG file
png(file = "qnormExample.png")

# Plot the graph.
plot(x, y)

# Save the file.
dev.off()