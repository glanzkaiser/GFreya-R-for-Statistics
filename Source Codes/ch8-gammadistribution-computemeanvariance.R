set.seed(31234)
x <- rgamma(100, 2.0, 11.0) + rnorm(100, 0, .01) #gamma distr + some gaussian noise
#print(x)

m <- mean(x)
v <- var(x)

scale <- v/m # scale = β
shape <- m*m/v # shape = α 