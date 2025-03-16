

# Calculate the PDF at x = 1.5
pdf_value <- dweibull(1.5, shape = 1.5, scale = 2)
print(pdf_value)

# Calculate the CDF at x = 1.5
cdf_value <- pweibull(1.5, shape = 1.5, scale = 2)
print(cdf_value)

# Find the quantile for probability 0.5
quantile_value <- qweibull(0.5, shape = 1.5, scale = 2)
print(quantile_value)

dweibull(x, shape, scale = 1) #to create the probability density function.

curve(dweibull(x, shape=2, scale = 2), from=0, to=5,
    main = 'Weibull Distribution (shape = 2, scale = 2)',
    ylab = ' dWeibull gives the density',
    lwd = 2,
    col = 'blue3')
curve(dweibull(x, shape=1.5, scale = 2), from=0, to=5, col='green', add=TRUE)

legend(2, .3, legend=c("shape=2, scale=2", "shape=1.5, scale=2"),
       col=c("green", "blue3"), lty=1, cex=1.2)