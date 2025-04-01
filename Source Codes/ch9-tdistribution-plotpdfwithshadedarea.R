# https://r-coder.com/exponential-distribution-r/#The_exponential_distribution

t_area <- function(rate = 15, lb, ub, acolor = "lightgray", ...) {
    x <- seq(-6, 6, 0.01) 
    
    if (missing(lb)) {
       lb <- min(x)
    }
    if (missing(ub)) {
        ub <- max(x)
    }

    x2 <- seq(lb, ub, length = 100)    
    # you can change df = rate
    plot(x, dt(x, df = 15), type = "n", xlab = "x", ylab = "pdf")
    
    y <- dt(x2, df = 15)
    polygon(c(lb, x2, ub), c(0, y, 0), col = acolor)
    lines(x, dt(x, df = 15), type = "l", ...)
}


# plot the area:
p <- t_area(rate = 15, lb = 2.131, ub = 6, acolor = rgb(0, 0, 1, alpha = 0.5))
arrows(2.5, 0.1, 2.5, 0.005, length = 0.1, lwd = 2)
text(2.5, 0.12, "2.5%", srt = 90, col = "white", cex = 1.2)
