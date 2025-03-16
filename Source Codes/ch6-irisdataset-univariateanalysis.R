# https://jonasmoss.github.io/univariateML/articles/overview.html

library(univariateML)
library(dplyr) # for filter command

iris = read.csv("iris.csv", header=TRUE)

newCol1 <- mutate(iris, ratio1 = petal.width/petal.length)
newCol2 <- mutate(iris, ratio2 = sepal.width/sepal.length)

arr.setosa1 <- newCol1 %>% filter(variety =="Setosa") %>% arrange(ratio1)
arr.virginica1 <- newCol1 %>% filter(variety =="Virginica") %>% arrange(ratio1)
arr.versicolor1 <- newCol1 %>% filter(variety =="Versicolor") %>% arrange(ratio1)

arr.setosa2 <- newCol2 %>% filter(variety =="Setosa") %>% arrange(ratio2)
arr.virginica2 <- newCol2 %>% filter(variety =="Virginica") %>% arrange(ratio2)
arr.versicolor2 <- newCol2 %>% filter(variety =="Versicolor") %>% arrange(ratio2)

p1 <- hist(arr.setosa1$ratio1, xlab = "Petal width / Petal length", main = "Ratio of Petal Width / Petal length for Setosa", freq = FALSE)

# The AIC is a handy and easy to use model selection tool, as it only depends on the log-likelihood and number of parameters of the models. The generic in R can take multiple models, and the lower the the better.

p2 <- AIC(
  mlbetapr(arr.setosa1$ratio1),
  mlexp(arr.setosa1$ratio1),
  mlinvgamma(arr.setosa1$ratio1),
  mlgamma(arr.setosa1$ratio1),
  mllnorm(arr.setosa1$ratio1),
  mlrayleigh(arr.setosa1$ratio1),
  mlinvgauss(arr.setosa1$ratio1),
  mlweibull(arr.setosa1$ratio1),
  mlinvweibull(arr.setosa1$ratio1)
  #mllgamma(arr.setosa1$ratio1)
)


# to see the parameter estimates
p3 <- mllnorm(arr.setosa1$ratio1)
p4 <- summary(mllnorm(arr.setosa1$ratio1))

# The model selection process can be automatized with model_select(arr.setosa1$ratio1):
p5 <- model_select(arr.setosa1$ratio1, models = c("lnorm", "betapr"))

qqmlplot(arr.setosa1$ratio1, mlbeta, datax = TRUE, main = "QQ Plot for Petal Width/Petal Length for Setosa", col = "darkolivegreen4")
qqmlline(arr.setosa1$ratio1.length, mlbeta, datax = TRUE, col = "blue")
#qqmlpoints(arr.setosa1$ratio1.length, mlinvgauss, datax = TRUE, col = "darkgreen")
legend("bottomright", legend = c("Beta", "Beta line"), fill = c("darkolivegreen4", "black"))

#qqmlplot(arr.setosa1$ratio1, mllnorm, datax = TRUE, main = "QQ Plot for Petal Width/Petal Length for Setosa", col = "steelblue2")
#qqmlline(arr.setosa1$ratio1.length, mllnorm, datax = TRUE, color="black")
#legend("bottomright", legend = c("Lognormal", "Lognormal line"), fill = c("steelblue2", "black"))
