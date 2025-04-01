# https://www.r-bloggers.com/2023/12/chi-square-distribution-and-test-in-r/
library(ggplot2)

battery<-c(1.9, 2.4, 3, 3.5, 4.2) # Data of batteries lifetimes
n <- length(battery)
sd <- 1

chi <- (n-1)*var(battery)/sd
cat(paste("χ_{α} = ", chi))
cat("\n")

x <- seq(0, 20, 0.1)
y <- dchisq(x, df = n-1)

df_4 <- data.frame(x = x, y = y, df = n-1)

# Create the lower and upper boundary for the shaded area
# with df = 4, 95 % of the chi-squared value fall between lower95 and upper95
lower95 <- qchisq(.025, n-1)
upper95 <- qchisq(.975, n-1)

cat(paste("95 % of the chi-squared value fall between = ", lower95))
cat(paste(" and ", upper95))
cat("\n")

x1 <- seq(lower95, upper95, 0.01)
y1 <- c(dchisq(x1, df=n-1))
# to make the shaded area smooth and nice
y1[1] <- 0
y1[1066] <- 0

p <- ggplot(data=df_4, aes(x = x, y = y))+
  geom_line(linewidth=1, color = "#C84848")+
  geom_polygon(data = data.frame(x=x1, y=y1), aes(x,y), fill='darkgoldenrod2', alpha=0.2)+
  geom_vline(xintercept = chi, size = 0.4, color = "navyblue", linetype = "dashed")+
  labs(title="Chi-squared (d.f. = 4)", y = "Density Function",
       x = "χ_{α}")+
  annotate("text", x=chi, y=-0.01, label="3.26")