# https://www.statology.org/fitted-values-in-r/

#create data frame
df <- data.frame(minutes=c(5, 10, 13, 14, 20, 22, 26, 34, 38, 40),
                 fouls=c(5, 5, 3, 4, 2, 1, 3, 2, 1, 1),
                 points=c(6, 8, 8, 7, 14, 10, 22, 24, 28, 30))

#view data frame
df

#fit multiple linear regression model
fit <- lm(points ~ minutes + fouls, data=df)

#view summary of model
summary(fit)

#extract fitted values from regression model into new column in original data frame
df$fitted <- fit$fitted.values

#view updated data frame
df