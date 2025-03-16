
library(fitdistrplus)
library(logspline)
x <- c(37.50,46.79,48.30,46.04,43.40,39.25,38.49,49.51,40.38,36.98,40.00,
38.49,37.74,47.92,44.53,44.91,44.91,40.00,41.51,47.92,36.98,43.40,
42.26,41.89,38.87,43.02,39.25,40.38,42.64,36.98,44.15,44.91,43.40,
49.81,38.87,40.00,52.45,53.13,47.92,52.45,44.91,29.54,27.13,35.60,
45.34,43.37,54.15,42.77,42.88,44.26,27.14,39.31,24.80,16.62,30.30,
36.39,28.60,28.53,35.84,31.10,34.55,52.65,48.81,43.42,52.49,38.00,
38.65,34.54,37.70,38.11,43.05,29.95,32.48,24.63,35.33,41.34)

mydata <- c(37.50,46.79,48.30,46.04,43.40,39.25,38.49,49.51,40.38,36.98,40.00,
38.49,37.74,47.92,44.53,44.91,44.91,40.00,41.51,47.92,36.98,43.40,
42.26,41.89,38.87,43.02,39.25,40.38,42.64,36.98,44.15,44.91,43.40,
49.81,38.87,40.00,52.45,53.13,47.92,52.45,44.91,29.54,27.13,35.60,
45.34,43.37,54.15,42.77,42.88,44.26,27.14,39.31,24.80,16.62,30.30,
36.39,28.60,28.53,35.84,31.10,34.55,52.65,48.81,43.42,52.49,38.00,
38.65,34.54,37.70,38.11,43.05,29.95,32.48,24.63,35.33,41.34)

fitdistr(mydata, "weibull")

ks.test(mydata, "pweibull", scale=43.2474500, shape=6.4632971)
ks.test(mydata, "pnorm", mean=mean(mydata), sd=sd(mydata))

descdist(x, discrete = FALSE)

# The kurtosis and squared skewness of your sample are plotted as a blue point named "Observation". It seems that possible distributions include the Weibull, Lognormal and possibly the Gamma distribution.

fit.weibull <- fitdist(x, "weibull")
fit.norm <- fitdist(x, "norm")

plot(fit.norm)
plot(fit.weibull)

fit.weibull$aic
fit.normal$aic

# Kolmogorov-Smirnov test simulation
n.sims <- 5e4

stats <- replicate(n.sims, {      
  r <- rweibull(n = length(x)
                , shape= fit.weibull$estimate["shape"]
                , scale = fit.weibull$estimate["scale"]
  )
  estfit.weibull <- fitdist(r, "weibull") # added to account for the estimated parameters
  as.numeric(ks.test(r
                     , "pweibull"
                     , shape= estfit.weibull$estimate["shape"]
                     , scale = estfit.weibull$estimate["scale"])$statistic
  )      
})

plot(ecdf(stats), las = 1, main = "KS-test statistic simulation (CDF)", col = "darkorange", lwd = 1.7)
grid()

# Finally, our p-value using the simulated null distribution of the KS-statistics is:

fit <- logspline(stats)

1 - plogspline(ks.test(x
                       , "pweibull"
                       , shape= fit.weibull$estimate["shape"]
                       , scale = fit.weibull$estimate["scale"])$statistic
               , fit
)

