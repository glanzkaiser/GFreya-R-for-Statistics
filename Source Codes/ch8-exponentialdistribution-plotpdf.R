# https://www.geeksforgeeks.org/exponential-distribution-in-r-programming-dexp-pexp-qexp-and-rexp-functions/
library('ggplot2')

# R program to illustrate
# exponential distribution
# Specify x-values
x_dexp <- seq(1, 10, by = 0.1) 
      
# Apply dexp() function               
y_dexp <- dexp(x_dexp, rate = 5)    
                
# Plot dexp values 
plot(y_dexp)