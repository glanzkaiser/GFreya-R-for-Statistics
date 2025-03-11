# Grid of X-axis values
x <- seq(0, 12, 0.1)

# lambda = 0.2
plot(x, pexp(x, rate = 0.2), type = "l",
     ylab = "F(x)", lwd = 2, col = "red")
# lambda = 0.1
lines(x, pexp(x, rate = 0.1), col = "blue", lty = 1, lwd = 2)

# Adding a legend
legend("topright", c(expression(paste(, lambda)), "0.1", "0.2"),
       lty = c(0, 1, 1), col = c("red", "blue"), box.lty = 0, lwd = 2)