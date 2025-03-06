
# defining the degrees of freedom 
free = 5
qchisq(.75, df=free) 

# defining the degrees of freedom 
free = 5
# This function can also be used to calculate quantile for a given area under the curve.
qchisq(.999, df=free, lower.tail = TRUE)

# defining degrees of freedom
df = 6
vec <- 1:4

print ("Density function values")
# dchisq gives the density function. That is, it is used for 
# computing the cumulative probability (lower.tail = TRUE for left tail, 
# lower.tail = FALSE for right tail) of less than or equal to the value of vector of quantiles, that is q. 

dchisq(vec, df = df)

# pchisq gives the distribution function.  dchisq(x, df) gives us the probability of χ2 with equivalent to a value of x when the degree of freedom is df. This method can be used to calculate the area under the curve for the specified intervals of the χ2-curve with a given number of degree of freedoms.
# defining degrees of freedom
df = 5

# calculating for the values in the interval [0,5]
print ("Calculating for the values [0,5]")
pchisq(5, df = df,lower.tail = TRUE)

# calculating for the values in the interval [5,inf)
print ("Calculating for the values [5,inf)")
pchisq(5, df = df,lower.tail = FALSE)