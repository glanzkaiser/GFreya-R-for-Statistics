library(knitr)
library(WeibullR)

# A system or component may have multiple different failure modes (e.g. corrosion, fatigue, overload)
# Each failure mode has a different distribution of time to failure

# A basic Weibull with competing failure modes tends to -
#   Not fit the data well
#    Look random (Beta of 1)

# Example
data <- data.frame(
  time = c(rweibull(5, 0.5, 10), rweibull(10, 1, 10), rweibull(5, 2, 10), rweibull(100, 2, 10)),
  event = c(rep(1, 20), rep(0, 100)),
  failure_mode = c(rep("A", 5), rep("B", 10), rep("C", 5), rep("", 100))
  )

# Fit an overall Weibull
obj <- wblr.conf(wblr.fit(wblr(data)))
plot(obj, col="darkgreen")

# Now create a separate data set for each failure mode
dat1 <- data
dat2 <- data
dat3 <- data
dat1$event[dat1$failure_mode != "A"] <- 0
dat2$event[dat2$failure_mode != "B"] <- 0
dat3$event[dat3$failure_mode != "C"] <- 0

# fit a wblr object for each failure mode and plot the results
obj1 <- wblr.fit(wblr(dat1, col="blue"))
obj2 <- wblr.fit(wblr(dat2, col="red"))
obj3 <- wblr.fit(wblr(dat3, col="orange"))
plot.wblr(list(obj1, obj2, obj3), is.plot.legend = FALSE)