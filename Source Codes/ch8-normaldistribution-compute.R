
library('ggplot2')
# creating a sequence of values 
# between 25 to 125 with a difference of 1
x = seq(25, 125, by=1)
 
# dnorm function returns the value of the probability density function (pdf) of the normal distribution
y = dnorm(x, mean=82, sd=3)
  
# Plot the graph.
plot(x, y)

# pnorm function returns the value of the cumulative density function (cdf) of the normal distribution
q1 = 1 - pnorm(83, mean=82, sd=3) 
q2 = pnorm(85, mean=82, sd=3) - pnorm(81, mean=82, sd=3) 
q3 = pnorm(73, mean=82, sd=3) 
 
cat(paste("P(X > 83) = ", q1))
cat("\n")
cat(paste("P(81 < X < 85) = ", q2))
cat("\n")
cat(paste("P(X < 73) = ", q3))
cat("\n")
