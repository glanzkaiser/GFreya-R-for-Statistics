suppressWarnings({library(ggplot2)})

# Function to plot CDF and SF
plot_beta_cdf_sf <- function(alpha, beta) {
  x <- seq(0, 1, length.out = 100)
  cdf <- pbeta(x, alpha, beta)
  sf <- pbeta(x, alpha, beta, lower.tail = FALSE)
  data <- data.frame(x = x, cdf = cdf, sf = sf)
  ggplot(data, aes(x = x)) +
    geom_line(aes(y = cdf, color = "CDF")) +
    geom_line(aes(y = sf, color = "SF")) +
    labs(title = paste("Beta Distribution CDF and SF (α =", alpha, ", β =", beta, ")"),
         x = "x", y = "Probability") +
    scale_color_manual(values = c("CDF" = "navyblue", "SF" = "darkgoldenrod3"))
}

# Plot CDF and SF
plot_beta_cdf_sf(2, 3)