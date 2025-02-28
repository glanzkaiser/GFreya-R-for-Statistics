# https://forum.posit.co/t/plotting-a-ecdf-and-overlay-it-with-standard-cdf-in-r-ggplot/110387/3
# https://stats.stackexchange.com/questions/239937/empirical-cdf-vs-cdf

library(ggplot2)

set.seed(235)
x<-rgamma(40,2,scale=3)
data= data.frame(x=x,cyl=rep("x",40),stringsAsFactors = F)

# p<-qplot(x,stat="ecdf",geom="step")+theme_bw()
p <- ggplot(data,aes(x)) +
       geom_line(stat = "ecdf")+
       geom_point(stat="ecdf",size=2) +
       stat_function(fun=pgamma,color="blue",args=list(shape=2,scale=3)) +
       labs(title="ECDF and theoretical CDF")

print(p)

