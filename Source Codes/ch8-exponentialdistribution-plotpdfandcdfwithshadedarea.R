# https://r-coder.com/exponential-distribution-r/#The_exponential_distribution

exp_area <- function(rate = 0.2, lb, ub, acolor = "lightgray", ...) {
    x <- seq(0, 17, 0.01) 
    
    if (missing(lb)) {
       lb <- min(x)
    }
    if (missing(ub)) {
        ub <- max(x)
    }

    x2 <- seq(0, 17, length = 0.01)    
    plot(x, dexp(x, rate = rate), type = "n", xlab = "x", ylab = "f(x)")
   
    y <- dexp(x2, rate = rate)
    polygon(c(lb, x2, ub), c(0, y, 0), col = acolor)
    lines(x, dexp(x, rate = rate), type = "l", ...)
}

x <- seq(0, 17, 0.01)
par(mfrow = c(1, 2))
# beta = 1/lambda
#-----------------------------
# Distribution function
#-----------------------------
plot(x, pexp(x, rate=1/5), type = "l", ylab = "F(x)", col = "blue", lwd = 2)
segments(8, 0, 8, pexp(8), lwd = 2, lty = 2)
#segments(0, pexp(8), 8, pexp(8), lwd = 2, lty = 2)

#-----------------------------
# Probability density function
#-----------------------------
#plot(x, dexp(x, rate=1/5), type = "l", ylab = "f(x)", col = "red", lwd = 2)

# Area
exp_area(rate = 1/5, ub = 8, acolor = rgb(1, 0, 1, alpha = 0.1))
# Text
text(2.7, 0.05, "79.81%")