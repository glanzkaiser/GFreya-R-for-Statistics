# Generate data from t-distribution
t_data <- rt(100, df = 5)

# Q-Q plot against t-distribution
qqplot(qt(ppoints(100), df = 5), t_data, main = "Q-Q Plot for t-Distribution")
abline(0, 1, col = "red")