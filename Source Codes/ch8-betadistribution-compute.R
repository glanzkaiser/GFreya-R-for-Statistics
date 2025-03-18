
pdf <- dbeta(x=0.6, shape1 = 1 , shape2 = 10, ncp=0, log=FALSE)

cdf <- pbeta(q=0.6, shape1 = 1, shape2 = 10, ncp = 0, lower.tail = TRUE, log.p = FALSE)

alpha = 1
beta = 10

mean <- alpha/(alpha+beta)
var <- (alpha*beta)/(((alpha+beta)^2)*(alpha+beta+1))

