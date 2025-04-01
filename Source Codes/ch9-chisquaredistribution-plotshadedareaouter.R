# https://www.statology.org/plot-chi-square-distribution-in-r/


#create density curve
curve(dchisq(x, df = 10), from = 0, to = 40,
main = 'Chi-Square Distribution (df = 10)',
ylab = 'Density',
lwd = 2)

#find upper and lower values for middle 95% of distribution
lower95 <- qchisq(.025, 10)
upper95 <- qchisq(.975, 10)

#create vector of x values
x_lower95 <- seq(0, lower95)

#create vector of chi-square density values
p_lower95 <- dchisq(x_lower95, df = 10)

#fill in portion of the density plot from 0 to lower 95% value
polygon(c(x_lower95, rev(x_lower95)), c(p_lower95, rep(0, length(p_lower95))),
        col = adjustcolor('red', alpha=0.3), border = NA)

#create vector of x values
x_upper95 <- seq(upper95, 40)

#create vector of chi-square density values
p_upper95 <- dchisq(x_upper95, df = 10)

#fill in portion of the density plot for upper 95% value to end of plot
polygon(c(x_upper95, rev(x_upper95)), c(p_upper95, rep(0, length(p_upper95))),
        col = adjustcolor('red', alpha=0.3), border = NA)