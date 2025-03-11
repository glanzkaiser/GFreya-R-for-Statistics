# https://rpubs.com/heidi_berger/965759

library('ggplot2')

p <- ggplot(data = data.frame(x = c(0, 6)), aes(x = x)) +
        stat_function(fun = dgamma, args = list(shape = 1, scale = 1), aes(color = "α = 1, β = 1")) +
        stat_function(fun = dgamma, args = list(shape = 2, scale = 1), aes(color = "α = 2, β = 1")) +
        stat_function(fun = dgamma, args = list(shape = 4, scale = 1), aes(color = "α = 4, β = 1")) +
        ggtitle("Gamma Distributions") +
        ylab("f(x)") + xlab("x")

print(p)