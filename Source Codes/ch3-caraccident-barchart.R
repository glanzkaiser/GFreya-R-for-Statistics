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

crashcount <- data.frame(count(df, first_crash_type))
crashcount <- crashcount[order(crashcount$n, decreasing = TRUE),]

most_common <- crashcount[1:4,]

other <- crashcount[5:18,]

other_sum <- sum(other$n)

otherdf <- data.frame(first_crash_type = 'OTHER', n = other_sum)

top5 <- rbind(most_common, otherdf)
top5 <- top5[order(top5$n, decreasing = TRUE),]


top5$first_crash_type <- str_to_title(top5$first_crash_type)

p <- ggplot(top5, aes(x= reorder(first_crash_type, -n), y = n)) +
  geom_bar(colour = 'black', fill = 'navyblue', stat = 'identity') +
  labs(title = "Amount of Accidents by Crash Type", x = "Type of Crash", y = "Accident Count") +
  geom_text(aes(label= comma(n)), vjust = -.5, size = 3) +
  theme(plot.title = element_text(hjust=0.5)) +
  theme_gray()+
  scale_y_continuous(label = comma)

print(p)