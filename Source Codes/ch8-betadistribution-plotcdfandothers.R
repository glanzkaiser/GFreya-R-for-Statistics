# The Beta Distribution
plr.data <- data.frame(
  player_avg <- c(seq(0, 1, by = 0.025)),
  stringsAsFactors = FALSE
)
 
# Print the data frame.            
print(plr.data)
print(plr.data$player_avg)
by1 <- dbeta(plr.data$player_avg, shape1 = 5, shape2 = 8)
par(mar = rep(2,4))
plot(by1)
 
# Cummilative distribution function 
by2<- pbeta(plr.data$player_avg, shape1 = 4, shape2 = 6) 
par(mar = rep(2,4))
plot(by2)
 
# Inverse Cummilative distribution function 
by3 <- qbeta(plr.data$player_avg, shape1 = 4, shape2 = 6)
par(mar = rep(2,4))
plot(by3)
 
b4 <- rbeta(plr.data$player_avg, shape1 = 5, shape2 = 8)
par(mar = rep(2,4))
plot(density(b4), main = "Rbeta Plot")