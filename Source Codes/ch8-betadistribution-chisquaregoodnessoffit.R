#https://rpubs.com/rubafikri/Beta_Distributio_nAnalysis

# Load required packages
suppressPackageStartupMessages({
  library(MASS)
  library(ggplot2)
})
suppressWarnings({library(fitdistrplus)})

# Example observed data
observed_data <- c(0.1, 0.2, 0.3, 0.5, 0.7, 0.9)

# Estimate the parameters of the Beta distribution using method of moments
alpha_est <- mean(observed_data) * ((mean(observed_data) * (1 - mean(observed_data)) / var(observed_data)) - 1)
beta_est <- (1 - mean(observed_data)) * ((mean(observed_data) * (1 - mean(observed_data)) / var(observed_data)) - 1)

# Fit Beta distribution to the data
fit <- fitdist(observed_data, "beta", start = list(shape1 = alpha_est, shape2 = beta_est))

# Bin the data
bins <- cut(observed_data, breaks = seq(0, 1, length.out = 6))
observed_frequencies <- table(bins)

# Calculate expected frequencies
bin_edges <- seq(0, 1, length.out = 6)
expected_frequencies <- diff(pbeta(bin_edges, fit$estimate[1], fit$estimate[2])) * length(observed_data)

# Perform Chi-Square Test
chi_square_stat <- sum((observed_frequencies - expected_frequencies)^2 / expected_frequencies)
chi_square_p_value <- 1 - pchisq(chi_square_stat, df = length(observed_frequencies) - 1 - 2)

# Print results
cat("Chi-Square Test Statistic:", chi_square_stat, "\n")
cat("Chi-Square Test P-Value:", chi_square_p_value, "\n")

p <- # Plot histogram and fitted PDF
ggplot() +
  geom_histogram(aes(x = observed_data, y = after_stat(density)), bins = 10, fill = "lightblue", alpha = 0.7) +
  stat_function(fun = dbeta, args = list(shape1 = fit$estimate[1], shape2 = fit$estimate[2]), color = "navyblue", linewidth = 1) +
  labs(title = "Histogram and Fitted Beta PDF",
       x = "Observed Data",
       y = "Density") +
  theme_minimal()
