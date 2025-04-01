# https://www.statology.org/plot-chi-square-distribution-in-r/

battery<-c(1.9, 2.4, 3, 3.5, 4.2) # Data of batteries lifetimes
n <- length(battery)
sd <- 1

chi <- (n-1)*var(battery)/sd
cat(paste("χ_{α} = ", chi))
cat("\n")

#create density curve
curve(dchisq(x, df = 4), from = 0, to = 15,
main = 'Chi-Square Distribution (df = 4)',
ylab = 'Density',
lwd = 2)

#find upper and lower values for middle 95% of distribution
lower95 <- qchisq(.025, 4)
upper95 <- qchisq(.975, 4)

#create vector of x values
x_vector <- seq(lower95, upper95)

#create vector of chi-square density values
p_vector <- dchisq(x_vector, df = 4)

#fill in density plot
polygon(c(x_vector, rev(x_vector)), c(p_vector, rep(0, length(p_vector))),
        col = adjustcolor('navyblue', alpha=0.3), border = NA)