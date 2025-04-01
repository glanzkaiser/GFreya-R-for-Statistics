# loading the required package
library(dgof) 
 
# generating random variate sample 1
x <- rnorm(50)
 
# generating random deviates sample 2
y <- runif(30)

# performing the K-S Test Do x and y
# come from the same distribution?
ks.test(x, y)