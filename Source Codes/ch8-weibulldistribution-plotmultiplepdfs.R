# α = scale β = shape

# Calculate the PDF at x = 1.5
pdf_value <- dweibull(1.5, shape = 3.5, scale = 1)

# Calculate the CDF at x = 1.5
cdf_value <- pweibull(1.5, shape = 3.5, scale = 1)

# Find the quantile for probability 0.5
quantile_value <- qweibull(0.5, shape = 3.5, scale = 1)

cat(paste("pdf of Weibull(x = 1.5, α=1, β=3.5) = ", pdf_value))
cat("\n")
cat(paste("cdf of Weibull(x = 1.5, α=1, β=3.5) = ", cdf_value))
cat("\n")
cat(paste("quantile of Weibull(q = 0.5, α=1, β=3.5) = ", quantile_value))
cat("\n")

curve(dweibull(x, shape=3.5, scale = 1), from=0, to=3,
    main = 'Weibull Distribution',
    ylab = 'pdf',
    lwd = 2,
    col = 'blue3')
curve(dweibull(x, shape=1, scale = 1), from=0, to=3, col='green', add=TRUE)
curve(dweibull(x, shape=2, scale = 1), from=0, to=3, col='indianred', lwd = 2, add=TRUE)

legend("topright", legend=c("α=1, β=3.5", "α=1, β=1", "α=1, β=2"),
       col=c("blue3", "green", "indianred"), lty=1, cex=1.2)