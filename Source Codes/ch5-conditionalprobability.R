
# Create a data frame
priest_data <- data.frame(
  Female = c("Yes", "Yes", "No", "No"),
  Graduate = c("Yes", "No", "Yes", "No"),
  Frequency = c(42, 95, 24, 97)
)

# Calculate the conditional probability

total_graduate <- sum(priest_data$Frequency[priest_data$Graduate == "Yes"])
female_and_graduate <- priest_data$Frequency[priest_data$Graduate == "Yes" & priest_data$Female == "Yes"]
P_female_given_graduate <- female_and_graduate / total_graduate

P_female_given_graduate
