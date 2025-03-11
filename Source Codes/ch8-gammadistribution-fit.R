
set.seed(2017)
x <- rgamma(100,2,11) + rnorm(100,0,.01)

library(fitdistrplus)
fit.gamma <- fitdist(x, distr = "gamma", method = "mle")
summary(fit.gamma)

plot(fit.gamma)