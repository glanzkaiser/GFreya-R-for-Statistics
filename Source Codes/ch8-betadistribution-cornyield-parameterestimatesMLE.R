# this R code needs nleqslv package to be installed for nonlinear solver
library(dplyr) # for filter command

# Sample data
corn = read.csv("cornyield.csv", header=TRUE)

# filter data
corn_indonesia <- filter(corn, country == "Indonesia")

# indicating the data type of each variable  
sapply(corn_indonesia,class)

# this is the code to make numeric vector of length n
cornyield_raw <- corn_indonesia$yield
# we divide it by the maximum yield so the value is between 0 and 1 to fit Beta distribution
cornyield <- cornyield_raw / max(cornyield_raw)

library(fitdistrplus)

fit.beta <- fitdist(cornyield, distr = "beta", method = "mle")

summary(fit.beta)

plot(fit.beta)
