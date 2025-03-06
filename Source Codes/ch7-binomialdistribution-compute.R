
# probability mass function for binomial distribution
dbinom(30, size=120, prob=0.2)
# cumulative probability function for binomial distribution
pbinom(30, size=120, prob=0.2)

# list each P(X=x) for x=0,1,2,...30
probabilities = dbinom(x=c(0:30), size=120, 0.2)
data.frame(probabilities)

# P(X >=40)
p40 <- pbinom(39, size=120, 0.2)
1-p40