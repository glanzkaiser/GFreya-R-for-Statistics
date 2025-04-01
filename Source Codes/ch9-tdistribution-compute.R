
# Find t for a 95% confidence interval with 2.5% in each tail and df=15
qt(p=0.025, df = 15, lower.tail=TRUE)
qt(p=0.025, df = 15, lower.tail=FALSE)

# To compute a t-statistic of 1.9
# t-stat=1.9 , df = 15
# one-sided p-value
# P(t >= 1.9)
#it will return the p-value and will elad to rejection of H0 at a significance level greater than the p-value
pt (q=1.9, df = 15, lower.tail=FALSE)
