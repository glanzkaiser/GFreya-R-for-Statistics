
library('ggplot2')

p <- plot(0:30, pbinom(0:30, size=120, prob=0.2), type='l')
print(p)