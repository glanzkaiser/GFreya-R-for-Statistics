# compute the pmf of Poisson distribution

x <- 1
lambda <- 1.825
probability <- dpois(x, lambda)
cat(paste("\nPoisson approximation with np = λt = 1.825 "))
cat("\n")
cat(paste("\nP(X=1) = p(x=1;λt=2) : "))
cat(paste(probability))


# compute the cdf of Poisson distribution

q <- 3
lambda <- 1.825
cumulative_probability <- ppois(q, lambda)
cat("\n")
cat(paste("\nPoisson cdf with np = λt = 1.825 "))
cat("\n")
cat(paste("P(X≤3) = Σ p(x=i;λt=2) , i=1,2,3 : "))
cat(paste(cumulative_probability))

# It returns  the quantile function of the Poisson distribution / 
# the smallest integer `q` such that `ppois(q, lambda)` is greater than or equal to `p`.
p <- 0.6
lambda <- 1.825
quantile_value <- qpois(p, lambda)
cat("\n")
cat(paste("\nP(X≤k) = Σ p(x=i;λt=2) = 0.6 , i=1,2,..,k : "))
cat("\n k = ")
cat(paste(quantile_value))
cat("\n")
