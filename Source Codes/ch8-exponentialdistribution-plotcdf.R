# https://www.geeksforgeeks.org/exponential-distribution-in-r-programming-dexp-pexp-qexp-and-rexp-functions/
library('ggplot2')

# R program to illustrate
# exponential distribution
 
# Specify x-values
x_pexp <- seq(1, 10, by = 0.2)                                     
 
# Apply pexp() function
y_pexp <- pexp(x_pexp, rate = 1) 
 
# Plot values                  
plot(y_pexp)                                                    