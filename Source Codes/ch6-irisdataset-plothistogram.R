library(ggplot2)

iris = read.csv("iris.csv", header=TRUE)

# graphics layout
par(mfrow=c(2,2),oma=c(1,1,1,1))
 

hist(iris$sepal.length,col = "turquoise", main="Sepal Length", xlab="Length(cm)")
hist(iris$sepal.width,col = "darkgreen", main="Sepal Width", xlab="Width(cm)")
hist(iris$petal.length,col = "navyblue", main="Petal Length", xlab="Length(cm)")
hist(iris$petal.width,col = "royalblue1", main="Petal Width", xlab="Width(cm)")
