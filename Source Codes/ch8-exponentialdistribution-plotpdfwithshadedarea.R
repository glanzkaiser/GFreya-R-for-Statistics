# https://r-coder.com/exponential-distribution-r/#The_exponential_distribution

exp_area <- function(rate = 1, lb, ub, acolor = "lightgray", ...) {
    x <- seq(0, 12, 0.01) 
    
    if (missing(lb)) {
       lb <- min(x)
    }
    if (missing(ub)) {
        ub <- max(x)
    }

    x2 <- seq(lb, ub, length = 100)    
    plot(x, dexp(x, rate = rate), type = "n", xlab = "x", ylab = "pdf")
   
    y <- dexp(x2, rate = rate)
    polygon(c(lb, x2, ub), c(0, y, 0), col = acolor)
    lines(x, dexp(x, rate = rate), type = "l", ...)
}


# plot the area under an exponential curve of rate 0 between 0.5 and 5 with the following code:
p <- exp_area(rate = 0.2, lb = 0, ub = 8, acolor = rgb(0, 0, 1, alpha = 0.5))
text(1, 0.075, "79.81%", srt = 90, col = "white", cex = 1.2)


# uncomment belows to show the plot below
#exp_area(rate = 0.2, lb = 8, acolor = rgb(0, 0, 1, alpha = 0.1))
#arrows(10, 0.1, 10, 0.015, length = 0.1, lwd = 2)
#text(10, 0.12, "20.19%", cex = 1.2)