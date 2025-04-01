# loading the required package
library(dgof) 
 
# sample 1
# generating a random variate
x <- rnorm(50)
 
# sample 2
# generating a random variate
x2 <- rnorm(50, -1)
 
# plotting the result
# visualization
plot(ecdf(x), 
     xlim = range(c(x, x2)), 
     col = "blue")
plot(ecdf(x2), 
     add = TRUE, 
     lty = "dashed",
     col = "red")
 
# performing the K-S 
# Test on x and x2
ks.test(x, x2, alternative = "l")