# https://www.geeksforgeeks.org/exponential-distribution-in-r-programming-dexp-pexp-qexp-and-rexp-functions/
library('ggplot2')
# R program to illustrate
# exponential distribution
 
# Set seed for reproducibility
set.seed(500) 
 
# Specify size         
N <- 100
 
# Draw exp distributed values
y_rexp <- rexp(N, rate = 1)
  
# Plot exp density  
hist(y_rexp, breaks = 50, main = "")