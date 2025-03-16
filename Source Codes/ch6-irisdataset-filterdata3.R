library(dplyr) # for filter command

iris = read.csv("iris.csv", header=TRUE)

# create a new column that stores logical values for sepal.width greater than half of sepal.length
newCol <- mutate(iris, greater.half = sepal.width > 0.5 * sepal.length)
tail(newCol)

# The chain operator, or the pipeline %>%
# This will first filter, and then arrange our data. Note that here the order in which you call functions does not matter, but in other cases it might
arr.setosa <- newCol %>% filter(variety == "Setosa") %>% arrange(sepal.width)
arr.setosa[30:35,] # will show us rows 30 through 35 and all columns

arr.setosa2 <- newCol %>% filter(variety == "Setosa") %>% arrange(sepal.length)

arr.setosa3 <- newCol %>% filter(variety == "Setosa") %>% arrange(petal.length)

arr.setosa4 <- newCol %>% filter(variety == "Setosa") %>% arrange(petal.width)
