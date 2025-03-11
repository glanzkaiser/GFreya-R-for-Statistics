# https://www.statology.org/gamma-distribution-in-r/

#define x-values
x <- seq(0, 2, by=0.01)   
  
#calculate gamma density for each x-value
y <- dgamma(x, shape=5) 
  
#create density plot
plot(y)

#define x-values
x <- seq(0, 2, by=0.01)   
  
#calculate gamma density for each x-value
y <- pgamma(x, shape=5) 
  
#create cumulative density plot
plot(y)

#define x-values
x <- seq(0, 1, by=0.01)   
  
#calculate gamma density for each x-value
y <- qgamma(x, shape=5) 
  
#create quantile plot
plot(y)

#make this example reproducible
set.seed(0)

#generate 1,000 random values that follow gamma distribution
x <- rgamma(n=1000, shape=5, rate=3)

#create histogram to view distribution of values
hist(x)