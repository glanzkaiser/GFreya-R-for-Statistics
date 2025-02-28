
# Create a data frame
weather_data <- data.frame(
  Cloudy = c("Yes", "Yes", "No", "No"),
  Rain = c("Yes", "No", "Yes", "No"),
  Frequency = c(30, 20, 10, 40)
)

# Calculate the conditional probability

total_cloudy <- sum(weather_data$Frequency[weather_data$Cloudy == "Yes"])
rainy_and_cloudy <- weather_data$Frequency[weather_data$Cloudy == "Yes" & weather_data$Rain == "Yes"]
P_rain_given_cloudy <- rainy_and_cloudy / total_cloudy
P_rain_given_cloudy
