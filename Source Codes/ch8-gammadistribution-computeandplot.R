# https://rpubs.com/mpfoley73/459051

alpha = 10
beta = 1 / 3
x = 3
# exact
pgamma(q = x, shape = alpha, scale = beta)

# simulated
mean(rgamma(n = 10000, shape = alpha, scale = beta) <= x)

library(dplyr)
library(ggplot2)

p <- data.frame(x = 0:1000 / 100, prob = pgamma(q = 0:1000 / 100, shape = alpha, scale = beta, lower.tail = TRUE)) %>%
  mutate(Interval = ifelse(x >= 0 & x <= 3, "0 to 3", "other")) %>% 
  ggplot(aes(x = x, y = prob, fill = Interval)) +
  geom_area(alpha = 0.3) +
  labs(title = "X ~ Gam(alpha = 10, theta = .25)",
       subtitle = "Probability of 10 transactions in 3 seconds when the mean time to an event is 0.3 seconds.",
       x = "Transaction",
       y = "Cum Probability") 

print(p)