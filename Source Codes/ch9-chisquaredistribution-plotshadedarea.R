# https://www.statology.org/plot-chi-square-distribution-in-r/


#create density curve
curve(dchisq(x, df = 10), from = 0, to = 40,
main = 'Chi-Square Distribution (df = 10)',
ylab = 'Density',
lwd = 2)

#create vector of x values
x_vector <- seq(10, 40)

#create vector of chi-square density values
p_vector <- dchisq(x_vector, df = 10)

#fill in portion of the density plot from 10 to 40
polygon(c(x_vector, rev(x_vector)), c(p_vector, rep(0, length(p_vector))),
        col = adjustcolor('navyblue', alpha=0.3), border = NA)