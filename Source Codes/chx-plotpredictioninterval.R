# 

#view first six rows of mtcars
head(mtcars)

#fit simple linear regression model
#we’ll fit a simple linear regression model using disp as the predictor variable and mpg as the response variable.
model <- lm(mpg ~ disp, data = mtcars)

#view summary of fitted model
summary(model)

#create data frame with three new values for disp
new_disp <- data.frame(disp= c(150, 200, 250))

#use the fitted model to predict the value for mpg based on the three new values
#for disp
predict(model, newdata = new_disp)

#create 95% prediction intervals around the predicted values
pi <- predict(model, newdata = new_disp, interval = "predict")

#create 99% prediction intervals around the predicted values
pi99 <- predict(model, newdata = new_disp, interval = "predict", level = 0.99)

# Visualization

#define dataset
data <- mtcars[ , c("mpg", "disp")]

#create simple linear regression model
model <- lm(mpg ~ disp, data = mtcars)

#use model to create prediction intervals
predictions <- predict(model, interval = "predict")

#create dataset that contains original data along with prediction intervals
all_data <- cbind(data, predictions)

#load ggplot2 library
library(ggplot2)

#create plot
p <- ggplot(all_data, aes(x = disp, y = mpg)) + #define x and y axis variables
  geom_point() + #add scatterplot points
  stat_smooth(method = lm) + #confidence bands
  geom_line(aes(y = lwr), col = "coral2", linetype = "dashed") + #lwr pred interval
  geom_line(aes(y = upr), col = "coral2", linetype = "dashed") #upr pred interval
