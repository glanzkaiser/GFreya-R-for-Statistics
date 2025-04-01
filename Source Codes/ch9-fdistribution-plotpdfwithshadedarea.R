# https://r-coder.com/exponential-distribution-r/#The_exponential_distribution

f_area <- function(df1 = 4, df2 = 5, lb, ub, acolor = "lightgray", ...) {
    x <- seq(0, 8, 0.01) 
    
    if (missing(lb)) {
       lb <- min(x)
    }
    if (missing(ub)) {
        ub <- max(x)
    }

    x2 <- seq(lb, ub, length = 100)    
    # you can change df = rate
    plot(x, dt(x, df1 = 4, df2 = 5), type = "n", main="F-Distribution d.f.=(4,5)", xlab = "x", ylab = "pdf")
    
    y <- dt(x2, df1 = 4, df2 = 5)
    polygon(c(lb, x2, ub), c(0, y, 0), col = acolor)
    lines(x, dt(x, df1 = 4, df2 = 5), type = "l", ...)
}


# plot the area with the following code:
p <- f_area(df1 = 4, df2 = 5, lb = 5.192168, ub = 8, acolor = rgb(0, 0, 1, alpha = 0.5))
arrows(5.5, 0.1, 5.5, 0.005, length = 0.1, lwd = 2)
text(5.5, 0.14, "5 %", srt = 90, col = "white", cex = 1.2)
