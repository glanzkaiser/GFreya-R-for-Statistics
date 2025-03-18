# this R code needs nleqslv package to be installed for nonlinear solver
library(dplyr) # for filter command

# Sample data
corn = read.csv("cornyield.csv", header=TRUE)

# filter data
corn_indonesia <- filter(corn, country == "Indonesia")

# this is the code to make numeric vector of length n
cornyield_raw <- corn_indonesia$yield
# we divide it by the maximum yield so the value is between 0 and 1 to fit Beta distribution
sample_data <- cornyield_raw / max(cornyield_raw)

# select the column yield only
# sample_data <- corn_indonesia %>% select(yield)
# sample_mean <- colMeans(sample_data)

# Method of Moments Estimators
sample_mean <- mean(sample_data)
sample_var <- var(sample_data)

# Solving for alpha and beta
moment_equations <- function(params) {
  alpha <- params[1]
  beta <- params[2]
  
  eq1 <- sample_mean - (alpha / (alpha + beta))
  eq2 <- sample_var - (alpha * beta) / ((alpha + beta)^2 * (alpha + beta + 1))
  
  return(c(eq1, eq2))
}

initial_guess <- c(1, 1)
estimates <- nleqslv::nleqslv(initial_guess, moment_equations)$x

alpha_hat <- estimates[1]
beta_hat <- estimates[2]

cat("Estimated alpha:", alpha_hat, "\n")

cat("Estimated beta:", beta_hat, "\n")