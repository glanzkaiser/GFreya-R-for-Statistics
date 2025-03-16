library(ggplot2)

iris = read.csv("iris.csv", header=TRUE)

# graphics layout
par(mfrow=c(2,2),oma=c(1,1,1,1))

boxplot(sepal.length ~ variety, main = "Box Plot Sepal Length - Species", data = iris, xlab = "", ylab = "Length (cm)",col = "light pink")

boxplot(sepal.width ~ variety, main = "Box Plot Sepal Width - Species", data = iris, xlab = "", ylab = "Width (cm)", col = "light yellow")

boxplot(petal.length ~ variety, main = "Box Plot Petal Length - Species", data = iris, xlab = "", ylab = "Length (cm)", col = "light blue")

boxplot(petal.length ~ variety, main = "Box Plot Petal Width - Species", data = iris, xlab = "", ylab = "Width (cm)", col = "thistle2")
