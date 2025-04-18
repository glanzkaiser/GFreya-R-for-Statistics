# https://stats-stackexchange-com.translate.goog/questions/132652/how-to-determine-which-distribution-fits-my-data-best?_x_tr_sl=en&_x_tr_tl=id&_x_tr_hl=id&_x_tr_pto=sc

library(gamlss)
library(gamlss.dist)
library(gamlss.add)

iris = read.csv("iris.csv", header=TRUE)

x <- iris$petal.length
#x <- c(37.50,46.79,48.30,46.04,43.40,39.25,38.49,49.51,40.38,36.98,40.00,
#       38.49,37.74,47.92,44.53,44.91,44.91,40.00,41.51,47.92,36.98,43.40,
#       42.26,41.89,38.87,43.02,39.25,40.38,42.64,36.98,44.15,44.91,43.40,
#       49.81,38.87,40.00,52.45,53.13,47.92,52.45,44.91,29.54,27.13,35.60,
#       45.34,43.37,54.15,42.77,42.88,44.26,27.14,39.31,24.80,16.62,30.30,
#       36.39,28.60,28.53,35.84,31.10,34.55,52.65,48.81,43.42,52.49,38.00,
#       38.65,34.54,37.70,38.11,43.05,29.95,32.48,24.63,35.33,41.34)

fit <- fitDist(x, k = 2, type = "realplus", trace = FALSE, try.gamlss = TRUE)

summary(fit)

# According to the AIC, the Weibull distribution (more specifically WEI2, a special parametrization of it) fits the data best. 