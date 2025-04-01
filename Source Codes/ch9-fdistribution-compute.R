
coal = read.csv("coal.csv", header=TRUE)

summary(coal)

mean1 <- mean(as.numeric(coal$mine1), na.rm=TRUE)
mean2 <- mean(as.numeric(coal$mine2), na.rm=TRUE)

var1 <- var(as.numeric(coal$mine1), na.rm=TRUE)
var2 <- var(as.numeric(coal$mine2), na.rm=TRUE)

sd1 <- sd(as.numeric(coal$mine1), na.rm=TRUE)
sd2 <- sd(as.numeric(coal$mine2), na.rm=TRUE)

f <- var1/var2

#qf(p=0.05, df1=1, df2=1, log.p=FALSE, lower.tail=FALSE) 
qf(p=0.05, df1=4, df2=5, log.p=FALSE, lower.tail=FALSE) 

p1 <- pf(q=1.44, df1=4, df2=5, log.p=FALSE, lower.tail=FALSE)
p2 <- pf(q=1/1.44, df1=4, df2=5, log.p=FALSE, lower.tail=TRUE)
