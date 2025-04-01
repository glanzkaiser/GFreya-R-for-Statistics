# α = scale β = shape

# Calculate the PDF at x = 10
pdf_value <- dweibull(10, shape = 50, scale = 2)

# Calculate the CDF at x = 10
cdf_value <- pweibull(10, shape = 50, scale = 2)

# Find the quantile for probability 0.5
quantile_value <- qweibull(0.5, shape = 50, scale = 2)

cat(paste("pdf of Weibull(x = 10, α=2, β=50) = ", pdf_value))
cat("\n")
cat(paste("cdf of Weibull(x = 10, α=2, β=50) = ", cdf_value))
cat("\n")
cat(paste("quantile of Weibull(q = 0.5, α=2, β=50) = ", quantile_value))
cat("\n")

curve(dweibull(x, shape=50, scale = 2), from=0, to=3,
    main = 'Weibull Distribution',
    ylab = 'pdf',
    lwd = 2,
    col = 'blue3')

legend("topright", legend=c("α=2, β=50"),
       col=c("blue3"), lty=1, cex=1.2)