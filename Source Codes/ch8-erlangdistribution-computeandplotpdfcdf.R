
# pgamma function returns the value of the cumulative density function (cdf) of the Erlang distribution
p1 = pgamma(q=0.5, shape=3, rate=6, lower.tail=TRUE) 
 
cat(paste("P(X < 0.5) = ", p1))
cat("\n")

# To plot pdf use: dgamma
# To plot cdf use: pgamma
curve(dgamma(x, shape=3, rate=6), from=0, to=12,
    main = 'Erlang Distribution',
    ylab = 'pdf',
    lwd = 2,
    col = 'navyblue')

legend("topright", legend=c("n=3, β=1/6"),
       col=c("navyblue"), lty=1, cex=1.2)