# Create a vector of z-score values
z_scores <- seq(-3, 3, by = 0.1)

# Calculate the corresponding probabilities using pnorm()
probabilities <- pnorm(z_scores)

# Combine the z-score and probability vectors into a data frame
z_score_table <- data.frame(z_score = z_scores, probability = probabilities)

# Print the resulting table
print(z_score_table)