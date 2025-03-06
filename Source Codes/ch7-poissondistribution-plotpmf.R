# Set the seed for reproducibility
set.seed(123)

# Generate a Poisson-distributed dataset
lambda <- 1.825  # Average rate of events
poisson_data <- rpois(500, lambda) # generates a vector of Poisson distributed random variables with length of n=500.

# Create a bar plot to visualize the probability mass function
barplot(table(poisson_data)/length(poisson_data), 
        col = "navyblue", 
        main = "Poisson Distribution PMF",
        xlab = "Number of Events",
        ylab = "Probability",
        ylim = c(0, 0.35))

# Add a red line representing the theoretical Poisson PMF
points(0:max(poisson_data), dpois(0:max(poisson_data), lambda), type = "b", col = "sienna3")

# Add legend
legend("topright", legend = c("Empirical PMF", "Theoretical PMF"), 
       fill = c("navyblue", "sienna3"), 
       cex = 0.8)