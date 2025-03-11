# https://rpubs.com/heidi_berger/965759

library('ggplot2')

p <- ggplot(data = data.frame(x = c(-10, 12)), aes(x = x)) +
        stat_function(fun = dnorm, args = list(mean = 2, sd = sqrt(16)), aes(color = "mean 2, var 16")) +
        stat_function(fun = dnorm, args = list(mean = 0, sd = sqrt(1)), aes(color = "mean 0, var 1")) +
        ggtitle("Normal Distributions") +
        ylab("density")

print(p)