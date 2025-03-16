library(dplyr)
		
iris = read.csv("iris.csv", header=TRUE)

newCol <- mutate(iris, greater.half = sepal.width > 0.5* sepal.length)
head(newCol) 
		
newCol2 <- mutate(iris, greater.only = sepal.width > sepal.length)
head(newCol2) 