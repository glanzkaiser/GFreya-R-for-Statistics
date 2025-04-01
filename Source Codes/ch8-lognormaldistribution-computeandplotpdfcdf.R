
# plnorm function returns the value of the cumulative density function (cdf) of the lognormal distribution
p1 = 1 - plnorm(q=20, mean=1.8, sd=2, lower.tail=TRUE) 
p2 = 1 - plnorm(q=60, mean=1.8, sd=2, lower.tail=TRUE)
 
cat(paste("P(X > 20) = ", p1))
cat("\n")
cat(paste("P(X > 60) = ", p2))
cat("\n")

# To plot pdf use: dlnorm
# To plot cdf use: plnorm
curve(dlnorm(x, mean=1.8, sd = 2), from=0, to=12,
    main = 'Lognormal Distribution',
    ylab = 'pdf',
    lwd = 2,
    col = 'navyblue')

legend("topright", legend=c("μ=1.8, σ=2"),
       col=c("navyblue"), lty=1, cex=1.2)