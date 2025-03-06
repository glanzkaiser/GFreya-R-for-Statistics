
library('ggplot2')
# rchisq(n, df) returns n random numbers from the chi-square distribution. It is therefore to generate random deviates. 
# computing values of 50k random values with 5 degrees of freedom
x <- rchisq(50000, df = 5)

hist(x, 
     freq = FALSE, 
     xlim = c(0,16), 
     ylim = c(0,0.2))

curve(dchisq(x, df = 5), from = 0, to = 15, 
      n = 5000, col= 'red', lwd=2, add = T)