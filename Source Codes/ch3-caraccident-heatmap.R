library(dplyr)
library(ggplot2)
library(scales)
library(stringr)
library(ggrepel)
library(lubridate)
library(ggthemes)
library(RColorBrewer)
library(data.table)

df <- fread("/root/R/CSV/traffic_accidents.csv")

df2 <- df %>%
  group_by(weather_condition, damage) %>%
  summarise(total_injuries = mean(injuries_total, na.rm = TRUE), .groups = "drop")

df2 <- df2 %>%
  mutate(weather_condition = reorder(weather_condition, total_injuries, .desc = TRUE))

df2$damage <- str_to_title(df2$damage)
df2$weather_condition <- str_to_title(df2$weather_condition)

p <- ggplot(df2, aes(x = weather_condition, y = damage, fill = total_injuries)) +
  geom_tile(color = "black") +
  geom_text(aes(label = round(total_injuries, 1)), color = "black", size = 3)+
  coord_equal(ratio=2) +
  labs(title = "Heatmap of Average Amount of Injuries by Damage & Weather Condition",
       x = "Weather Condition",
       y = "Cost of Damage",
       fill = "Average Amount of Injuries")+
  theme_minimal()+
  theme(
    plot.title = element_text(hjust = 0.5),
    axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1, size = 8)) +
  scale_fill_distiller(palette = "Blues", direction = 1)

print(p)