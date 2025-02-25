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

month_injuries <- df %>%
  group_by(crash_month) %>%
  summarise(total_injuries = sum(injuries_total, na.rm = TRUE)) %>%
  data.frame()

month_injuries$crash_month <- as.factor(month_injuries$crash_month)

high_low <- month_injuries %>%
  filter(total_injuries == min(total_injuries) | total_injuries == max(total_injuries)) %>%
  data.frame()

p <- ggplot(month_injuries, aes(x = crash_month, y = total_injuries, group=1)) +
  geom_line(color = 'navyblue', linewidth =1) +
  geom_point(shape = 21, size =3, color = 'royalblue2', fill = 'royalblue2') +
  labs(x = 'Month', y = 'Total Injuries', title = 'Injuries from Crashes by Month')+
  scale_y_continuous(labels = comma) +
  theme_bw()+
  theme(plot.title = element_text(hjust = 0.5)) +
  geom_point(data = high_low, aes(x=crash_month, y=total_injuries), inherit.aes = FALSE,
             shape = 21, size = 3, fill = 'black', color = 'black') +
  geom_label_repel(aes(label = ifelse(total_injuries == max(total_injuries) 
                  | total_injuries == min(total_injuries), 
                  scales::comma(total_injuries), '')), 
                  box.padding = 1, point.padding =0, size = 3, nudge_x = .5, 
                  color = 'black', segment.color = 'gray') +
  scale_x_discrete(breaks = 1:12, labels = month.abb)

print(p)