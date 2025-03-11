# https://r-coder.com/exponential-distribution-r/
library('ggplot2')

# Grid of X-axis values
x <- seq(0, 8, 0.1)

# lambda = 0.2
plot(x, dexp(x, 0.2), type = "l",
     ylab = "", lwd = 2, col = "red")
# lambda = 0.5
lines(x, dexp(x, rate = 0.5), col = "blue", lty = 1, lwd = 2)

# Adding a legend
legend("topright", c(expression(paste(, lambda)), "1/5", "1/2"),
       lty = c(0, 1, 1), col = c("blue", "red"), box.lty = 0, lwd = 2)