library('ggplot2')
# creating a sequence of values 
# between 25 to 125 with a difference of 1
x = seq(25, 125, by=1)
 
# dnorm function returns the value of the probability density function (pdf) of the normal distribution
y = dnorm(x, mean=82, sd=3)
  
# Plot the graph.
plot(x, y)