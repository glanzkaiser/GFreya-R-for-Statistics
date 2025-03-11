library('ggplot2')

cdf <- 1 - pexp(q=8, rate=1/5)

binom <- 1- pbinom(1, size=5, prob=1/5)
