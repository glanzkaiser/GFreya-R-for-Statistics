
# generating x coordinates
xpos <- seq(-1, 1, by = 0.01)
xpos_cdf <- seq(-2, 2, by = 0.01)

print('x coordinates")
print(xpos)

# generating y coordinates using dt() method
degree <- 2
ypos_pdf <- dt(xpos, df = degree)

print('y coordinates for pdf")
print(ypos_pdf)

ypos_cdf <- pt(xpos_cdf, df = degree)
ypos_quantile <- qt(xpos, df = degree)

# comments 2 to unshow, uncomment 1 to show
pdf <- plot(ypos_pdf, xaxt='n', type = "l", main="t-distribution", ylab="pdf")
axis(side=1, at=c(0,100,200), labels=c("-1","0","1"))

#cdf <- plot(ypos_cdf, xaxt='n', type = "l", main="t-distribution cdf", xlab="cdf")
#axis(side=1, at=c(0,200,400), labels=c("-1","0","1"))

#quant <- plot(ypos_quantile, type = "l", main="t-distribution Quantile plot")
