# https://steemit.com/programming/@dkmathstats/creating-normal-distribution-plots-with-r-programming
library('ggplot2')

dnorm_one_sd <- function(x){
  norm_one_sd <- dnorm(x)
  # Have NA values outside interval x in [-1, 1]:
  norm_one_sd[x <= -1 | x >= 1] <- NA
  return(norm_one_sd)
}

## Standard normal distribution:

xvalues <- data.frame(x = c(-3, 3))
p2 <- ggplot(xvalues, aes(x=xvalues)) + stat_function(fun=dnorm) +
	stat_function(fun = dnorm_one_sd), geom = "area", fill = "yellow", alpha=0.3) +
	xlim(c(-4, 4)) + 
	labs(x = "\n Z-Score (z)", y = "f(z) \n", title = "Standard Normal Distribution \n") +
	geom_line(aes(z, fz)) +
        geom_polygon(data = data.frame(x=x, y=y), aes(x, y), fill='blue')
