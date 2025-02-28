library(dplyr)
#library(ggplot2)
library(data.table) #for fread
library(stringr)
library(scales) # for comma in geom_text

df <- fread("/root/R/CSV/iris.csv")

head(df)

plot(ecdf(iris$Sepal.Length), main="ecdf for Sepal Length", xlab="x", ylab="F(x)")

