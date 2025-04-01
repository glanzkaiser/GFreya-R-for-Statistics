# https://rpubs.com/heidi_berger/965759

library('ggplot2')
xpos <- seq(-50, 50, by = 1)
degree1 <- 2
degree2 <- 10
p <- ggplot(data = data.frame(x = c(-1, 1)), aes(x = x)) +
        stat_function(fun = dt, args = list(xpos, df = degree1), aes(color = "ν = 2")) +
        stat_function(fun = dt, args = list(xpos, df = degree1), aes(color = "ν = 10")) +
        ggtitle("t-Distributions") +
        ylab("pdf") + xlab("x")

print(p)