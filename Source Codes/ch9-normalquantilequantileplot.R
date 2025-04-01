# Generate random data from a normal distribution
qqplot = read.csv("qqplot.csv", header=TRUE)

lamps <- qqplot$lamps

# Basic Q-Q plot
# qqnorm() creates a normal QQ plot. 
qqnorm(lamps)
qqline(lamps, col = "blue")  # Adds a reference line

# In this example, the qqnorm() function creates the Q-Q plot, 
# and qqline() adds a straight line to represent the normal distribution. 
# If the points fall near the line, the data is likely normally distributed.
