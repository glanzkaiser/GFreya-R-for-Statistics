library(ggplot2)
library(tidyr)
library(dplyr)
# Plot multiple time series data
# https://www.sthda.com/english/articles/32-r-graphics-essentials/128-plot-time-series-data-using-ggplot/

df <- fread("/root/R/CSV/nyccrimes.csv")

df1 <- df %>%
  select(Year, Robbery, Assault, Burglary, CarTheft) %>%
  gather(key = "crime", value = "value", -Year)
head(df1, 10)

df2 <- df %>%
  select(Year, Murder, Rape) %>%
  gather(key = "crime", value = "value", -Year)
head(df1, 10)


# Multiple line plot
p <- ggplot(df1, aes(x = Year, y = value)) + 
  geom_line(aes(color = crime), size = 1) +
  scale_color_manual(values = c("yellowgreen", "blueviolet", "orange4", "violet")) +
  theme_minimal()

print(p)

p <- ggplot(df2, aes(x = Year, y = value)) + 
  geom_line(aes(color = crime), size = 1) +
  scale_color_manual(values = c("goldenrod3", "darkorange")) +
  theme_minimal()

print(p)