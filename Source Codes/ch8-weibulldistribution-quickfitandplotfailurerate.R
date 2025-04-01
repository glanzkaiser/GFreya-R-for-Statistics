library(knitr)
library(WeibullR)
library(dplyr) # for filter command
library(formattable) # to show less digits in decimals

# Sample data
laptop = read.csv("laptopfailuretime.csv", header=TRUE)

failures_dell <- filter(laptop, brand == "Dell")
failures <- failures_dell$failuretime

fit<-MLEw2p(failures)
p1 <- knitr::kable(fit, col.names = "param")

alpha <- fit[1]
beta <- fit[2]

eq = function(x){alpha*beta*x**(beta-1)} # to plot hazard rate / failure rate
eq_reliability = function(x){exp(-alpha*x^(beta))} # to plot reliability function

curve(eq, from=1, to=50, 
	xlab="t", ylab="Z(t)",
	lwd = 2,
    	col = 'navyblue',main=paste("Weibull Distribution Failure Rate", alpha))

legend("topright", legend=c("Failure Rate with α = ",formattable(fit[1],digits=3), "β = ",formattable(fit[2], digits=3)),
       col=c("navyblue"), lty=1, cex=1.2)