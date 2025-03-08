
library('ggplot2')


x = seq(72, 92, by=0.05)

p <- curve(dnorm(x, mean=82, sd = 3), from=72, to=92, 
  main = "The Standard Normal Distibution", 
  ylab = "Probability Density",
  xlab = "X")

