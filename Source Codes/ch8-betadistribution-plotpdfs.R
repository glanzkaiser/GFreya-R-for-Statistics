
beta2 <- curve(dbeta(x, 2,5))

plot(curve(dbeta(x, 1, 10)), col="darkgoldenrod3", type="l", xlab="x", ylab="Beta pdf")
lines(beta2$x, beta2$y, col="navyblue")
legend("topleft", 
       c("Beta(1,10)", "Beta(2,5)"), 
       inset=.01, 
       lty=c(1,1), 
       col=c("darkgoldenrod3", "navyblue"))
