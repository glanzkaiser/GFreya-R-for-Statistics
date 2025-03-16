library(dplyr) # for filter command

iris = read.csv("iris.csv", header=TRUE)

# filter() the data for variety virginica
virginica <- filter(iris, variety == "Virginica")
head(virginica) # This dispalys the first six rows

# filter with multiple conditions
virginica2 <- filter(iris, variety == "virginica", sepal.length > 6)
tail(virginica2)

