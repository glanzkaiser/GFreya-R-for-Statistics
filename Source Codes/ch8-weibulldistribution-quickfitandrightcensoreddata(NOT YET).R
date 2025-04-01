library(knitr)
library(WeibullR)

failures<-c(30, 49, 82, 90, 96) # data of failure time
fit<-MLEw2p(failures)
p1 <- knitr::kable(fit, col.names = "param")

# Right censored data includes suspensions or units that have operated for a period of time without failure
# Let’s add right censored data to the previous example and build a basic probability plot

suspensions<-c(100, 45, 10)
fit<-MLEw2p(failures, suspensions, bounds=TRUE, show=TRUE)