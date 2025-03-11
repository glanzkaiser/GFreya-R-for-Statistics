# https://rpubs.com/rsshalini/109890

# the distribution of averages of independent and identically distributed (IID) variables 
# becomes that of a standard normal as the sample size increases.

# The random samples are drawn from exponential distribution generated using rexp(n)
set.seed(1)
par(mfrow=c(2,2))
set.seed(1)
hist(rexp(10))
hist(rexp(100))
hist(rexp(1000))
hist(rexp(10000))

# We will generate the distribution of the averages of 40 exponentials with lambda (rate parameter) = 0.2.
set.seed(1)
mns=NULL
for (i in 1 : 1000) mns = c(mns, mean(rexp(40,0.2)))
data <- data.frame(mns,size=40)

sampleMean <- mean(mns)

library(ggplot2)

p1 <- ggplot(data,aes(x=mns,fill=size))+
  theme_bw()+
  geom_histogram(aes(y=..density..),alpha=0.7,binwidth=.25,col="black") + 
  ylim(c(0,0.6))+
  stat_function(fun=dnorm,arg=list(mean=5,sd=sd(mns)))+
  geom_vline(aes(xintercept=mean(mns),colour="red")) +
  geom_text(aes(x=mean(mns),label="\nsample mean",y=0.2),colour="black",angle=90, text = element_text(size=11))+
              xlab("Averages of the distribution") + ylab("Density")+
            ggtitle("Figure 1: Distribution of the averages of \n40 random exponentials (1000 simulations)")

theoreticalMean <- 1/0.2

sampleVariance <- var(mns)

theoreticalVariance <- ((1/0.2)/sqrt(40))^2

# with 10,000 simulations 

set.seed(1)
mns2=NULL
for (i in 1 : 10000) mns2 = c(mns2, mean(rexp(40,0.2)))
data2 <- data.frame(mns2,size=40)
p2 <- ggplot(data2,aes(x=mns2,fill=size))+
  geom_histogram(aes(y=..density..),binwidth=.25,col="black") + 
  ylim(c(0,0.6))+
  stat_function(fun=dnorm,arg=list(mean=5,sd=sd(mns2)))+
  geom_vline(aes(xintercept=mean(mns),colour="red"))+
  geom_text(aes(x=mean(mns2),label="\nsample mean",y=0.2),colour="black",angle=90, text = element_text(size=11))+
  xlab("Averages of the distribution") + ylab("Frequency")+
  ggtitle("Figure 3: Distribution of the averages of \n40 random exponentials (10000 simulations)")