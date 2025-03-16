library(knitr)
library(WeibullR)

# A WeiBayes or 1P Weibull has a fixed β or shape parameter based on prior knowledge or experience

#Weibayes models are typically used when failure data is limited

# Let’s rerun the previous example as a WeiBayes model with a Beta of 2

y <- dnorm(x, mean = 5, sd = 1)
suspensions<-c(100, 45, 10)
eta <- weibayes(failures, suspensions, beta=2)
x <- seq(0, 200, by = .1)
plot(pweibull(x, shape = 2, scale = eta), col = "blue", type = "l", xlab = "Time to Failure", ylab = "Unreliability (%)") 

#The 3-Parameter Weibull Model

# The 3P Weibull has an additional parameter t0 to represent a failure free period (i.e. a component cannot fail until after time t0)

#R(t)=1−F(t)=e−((t−t 0 )/η)β

failures<-c(30, 49, 82, 90, 96)
suspensions<-c(100, 45, 10)
fit<-MLEw3p(failures, suspensions, bounds=TRUE, show=TRUE)