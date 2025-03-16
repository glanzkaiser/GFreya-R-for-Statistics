
library(fitdistrplus)
library(ggplot2)

# Generate random data from a Weibull distribution
set.seed(123)
weibull_data <- rweibull(n = 1000, shape = 1.5, scale = 2)

# Display the first few values
head(weibull_data)

# Plot histogram with density

p <- ggplot(data.frame(weibull_data), aes(x = weibull_data)) +
  geom_histogram(aes(y = ..density..), bins = 30, color = "black", fill = "skyblue") +
  stat_function(fun = dweibull, args = list(shape = 1.5, scale = 2), color = "red", size = 1) +
  labs(title = "Weibull Distribution", x = "Values", y = "Density") +
  theme_minimal()


# Fit a Weibull distribution to the generated data
fit <- fitdist(weibull_data, "weibull")

# Display the estimated parameters
print(fit)

# Plot the fitted distribution
plot(fit)