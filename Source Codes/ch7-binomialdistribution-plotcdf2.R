
library('ggplot2')

# To determine the k in P(X ≤ k) = 0.95
qbinom(0.95, size=120, prob=0.2)

# To plot
x <- seq(0,1, by=0.1) # Create a sample of number from 0 to 1 which are incremented by 0.1.
y <- qbinom(x, size=120, prob=0.2)
p <- plot(x,y, type = 'l', xlab = "P(X ≤ x)", ylab = "n", pbinom(0:30, size=120, prob=0.2), )

print(p)