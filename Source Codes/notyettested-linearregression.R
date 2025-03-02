# https://www.rpubs.com/Elias1993/560533

library(readr)
library(ggplot2)  
library(DMwR)
library(lawstat)
library(lmtest)
library(car)
library(gridExtra)

Iris <- read.csv("iris.csv", colClasses = c(NA,NA,NA,NA,NA))

attributes(Iris) # List your attributes within your data set.
summary(Iris) # Prints the min, max, mean, median, and quartiles of each attribute.
str(Iris) # Displays the structure of your data set.
names(Iris) # Names your attributes within your data set.

names(Iris) <- c("Sepal_Length", "Sepal_Width", "Petal_Length", "Petal_Width", "Species")

is.na(Iris) # Will show NA´s thorugh logical data.


Iris$Sepal_Length[is.na(Iris$Sepal_Length)] <- mean(Iris$Sepal_Length, na.rm = TRUE) 

hist_Sepal_Length <- ggplot(Iris, aes(Iris$Sepal_Length)) + geom_histogram(color="black", binwidth = 0.2)
hist_Sepal_Width <- ggplot(Iris, aes(Iris$Sepal_Width)) + geom_histogram(color="black", binwidth=0.2)
hist_Petal_Length <- ggplot(Iris, aes(Iris$Petal_Length)) + geom_histogram(color="black", binwidth = 0.2)
hist_Petal_Width <- ggplot(Iris, aes(Iris$Petal_Width)) + geom_histogram(color="black", binwidth=0.2)
p <- grid.arrange(hist_Sepal_Length, hist_Sepal_Width,hist_Petal_Length,hist_Petal_Width, nrow=2, ncol = 2)

print(p)

p <- ggplot(Iris, aes(Iris$Species, fill=Species)) + geom_bar(stat="count", position="dodge") # fill = Species, classiffy its bar with the specy color.

print(p)

scatter_Sepal <- ggplot(Iris, aes(Iris$Sepal_Length, Iris$Sepal_Width)) + geom_point(color="black")
scatter_Petal <- ggplot(Iris, aes(Iris$Petal_Length, Iris$Petal_Width)) + geom_point(color="blue")
scatter_Length <- ggplot(Iris, aes(Iris$Sepal_Length, Iris$Petal_Length)) + geom_point(color="green")
scatter_Width <- ggplot(Iris, aes(Iris$Sepal_Width, Iris$Petal_Width)) + geom_point(color="red")
scatter_SepalLength_PetalWidth <- ggplot(Iris, aes(Sepal_Length, Petal_Width)) + geom_point(color="yellow")
scatter_SepalWidth_PetalLength <- ggplot(Iris, aes(Sepal_Width, Petal_Length)) + geom_point(color="purple")

p <- grid.arrange(scatter_Sepal, scatter_Petal, scatter_Length, scatter_Width, scatter_SepalLength_PetalWidth, scatter_SepalWidth_PetalLength, nrow=2 ,ncol = 3)

print(p)

par(mfrow=c(2, 2))  # divide graph area in 2 columns
boxplot(Iris$Sepal_Length, main="Sepal Length")
boxplot(Iris$Sepal_Width, main="Sepal Width")  
boxplot(Iris$Petal_Length, main="Petal Length") 
boxplot(Iris$Petal_Width, main="Petal Width") 

outliers <- boxplot(Iris$Sepal_Width, plot=FALSE)$out

Iris_outliers <- Iris[which(Iris$Sepal_Width %in% outliers),] #  First you need to  find in which rows the outliers are.
Iris[-which(Iris$Sepal_Width %in% outliers),] #  Print the data set without the outliers.

Iris_dataprep <- Iris[-which(Iris$Sepal_Width %in% outliers),] # Create a new data set without the outliers.

set.seed(123)

trainSize <- round(nrow(Iris_dataprep)*0.8) 
testSize <- nrow(Iris_dataprep)-trainSize

training_indices <- sample(seq_len(nrow(Iris_dataprep)),size =trainSize) 
testing_indices <- sample(seq_len(nrow(Iris_dataprep)),size =testSize)
# seq_len() --> creates a sequence that starts at 1 and with steps of 1 finishes at the number value
trainSet <- Iris_dataprep[training_indices,]
testSet <- Iris_dataprep[testing_indices,]

IrisLinearMod <- lm(Petal_Length ~ Petal_Width, trainSet)
summary(IrisLinearMod)

print(IrisLinearMod) # y = 1.038 + 2.27 * X (x = Petal_Width, y = Petal_Length)

mean(IrisLinearMod$residuals)

par(mfrow=c(2,2))  
plot(IrisLinearMod) # plot() function prints a plot

acf(IrisLinearMod$residuals)

runs.test(IrisLinearMod$residuals)

dwtest(IrisLinearMod)

cor.test(trainSet$Petal_Width, IrisLinearMod$residuals)

var(trainSet$Petal_Length)

IrisLinearMod_2 <- lm(Petal_Width ~ ., data=Iris_dataprep)  
vif(IrisLinearMod_2)

par(mfrow=c(2,2))
plot(IrisLinearMod)

IrisPrediction <- predict(IrisLinearMod,testSet)

actuals_preds <- data.frame(cbind(actuals=testSet$Petal_Length, predicteds=IrisPrediction))  # make actuals_predicteds dataframe.
correlation_accuracy <- cor(actuals_preds)
correlation_accuracy # 96.29%

regr.eval(actuals_preds$actuals, actuals_preds$predicteds)