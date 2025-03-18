# https://rpubs.com/rubafikri/Beta_Distributio_nAnalysis

suppressWarnings({library(ggplot2)})

# Function to plot beta distribution
plot_beta <- function(alpha, beta) {
  x <- seq(0, 1, length.out = 100)
  y <- dbeta(x, alpha, beta)
  data <- data.frame(x = x, y = y)
  ggplot(data, aes(x, y)) +
    geom_line() +
    labs(title = paste("Beta Distribution (alpha =", alpha, ", beta =", beta, ")"),
         x = "x", y = "Density")
}

# Plot examples
plot_beta(2, 2)  # Symmetric, bell-shaped
