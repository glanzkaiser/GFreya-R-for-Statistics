library(knitr)
library(WeibullR)

# To build a plot with multiple Weibull models, start by creating a wblr object
failures<-c(30, 49, 82, 90, 96)
obj1<-wblr(failures) 

# Add a default fit that appears as a red line on the plot
obj1<-wblr.fit(obj1, col="red") 

# Add default confidence bounds using a single width line
obj1<-wblr.conf(obj1, lwd=1) 

# Now create a second wblr object
failures<-c(30, 49, 82, 90, 96)
suspensions<-c(100, 45, 10)
obj2<-wblr.conf(wblr.fit(wblr(failures, suspensions, col="purple"),),lwd=1)

# Add the 2 wblr objects to a list and plot both objects in a single chart
plot.wblr(list(obj1, obj2))