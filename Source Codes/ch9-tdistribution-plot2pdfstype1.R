# https://r-coder.com/exponential-distribution-r/
library('ggplot2')

# Grid of X-axis values
x <- seq(-4, 4, by = 0.01)
degree1 <- 10
degree2 <- 2

# ν = 2
plot(x, dt(x, df = degree1), type = "l", main="t-Distribution",
     ylab = "pdf", lwd = 2, col = "indianred")
# ν = 10
lines(x, dt(x, df = degree2), col = "navyblue", lty = 1, lwd = 2)

# Adding a legend
legend("topright", c(expression(paste(, nu)), "10", "2"),
       lty = c(0, 1, 1), col = c("navyblue", "indianred"), box.lty = 0, lwd = 2)