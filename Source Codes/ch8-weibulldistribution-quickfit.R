library(knitr)
library(WeibullR)

failures<-c(30, 49, 82, 90, 96) # data of failure time
fit<-MLEw2p(failures)
p1 <- knitr::kable(fit, "html", col.names = "param")

# Right censored data includes suspensions or units that have operated for a period of time without failure
# Let’s add right censored data to the previous example and build a basic probability plot
suspensions<-c(100, 45, 10)
fit<-MLEw2p(failures, suspensions, bounds=TRUE, show=TRUE)

# Interval censored data is most commonly in the form of inspection data, 
# where the failure occurred between two inspection times, the latest known working time (left entry), 
# and the inspection time when the failure was detected (right entry)

# To create an interval censored model, let’s use the inspection data from Silkworth, 2020
inspection_data<-data.frame(left=c(0, 6.12, 19.92, 29.64, 35.4, 39.72, 45.32, 52.32),
                            right=c(6.12, 19.92, 29.64, 35.4, 39.72, 45.32, 52.32, 63.48),
                            qty=c(5, 16, 12, 18, 18, 2, 6, 17))
suspensions<-data.frame(time=63.48, event=0, qty=73)

obj1<-wblr(suspensions, interval = inspection_data)
obj1<-wblr.fit(obj1, method.fit="mle", col="red") 
obj1<-wblr.conf(obj1, method.conf="fm", lty=2)
p2 <- plot(obj1)

# Life data is often compiled into groups (i.e. a group of units failed or survived at a certain time) 
# Notice how the previous example contained groups in the qty column

suspensions<-data.frame(time=63.48, event=0, qty=73)
knitr::kable(suspensions, "pdf")
# In this case, there are 73 suspensions at time 63.48



#Median Rank Regression (MRR) is a least squares analysis based on minimizing the squared distance from the cumulative probability to the fitted model

#Maximum Likelihood Estimation (MLE) is based on estimating the parameters of the distribution by maximizing the likelihood function of the observed data

# WeibullR includes functions for both methods, such as the MRRw2p, MRRw3p functions for MRR and the MLEw2p, MLEw3p functions for MLE
