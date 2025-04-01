library(knitr)
library(WeibullR)

failures<-c(30, 49, 82, 90, 96) # data of failure time
fit<-MLEw2p(failures)
p1 <- knitr::kable(fit, col.names = "param")