# https://www.statology.org/simple-linear-regression-in-r/

#create dataset
df <- data.frame(hours=c(1, 2, 4, 5, 5, 6, 6, 7, 8, 10, 11, 11, 12, 12, 14),
                 score=c(64, 66, 76, 73, 74, 81, 83, 82, 80, 88, 84, 82, 91, 93, 89))

#view first six rows of dataset
head(df)

#attach dataset to make it more convenient to work with
attach(df)

p1 <- scatter.smooth(hours, score, main='Hours studied vs. Exam Score')

boxplot(score)

#fit simple linear regression model
# using hours as the explanatory variable and score as the response variable:
model <- lm(score~hours)

#view model summary
summary(model)