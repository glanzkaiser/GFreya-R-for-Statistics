library(dplyr)
library(ggplot2)
library(scales)
library(stringr)
library(ggrepel)
library(lubridate)
library(ggthemes)
library(RColorBrewer)
library(data.table)

df$trafficway_type <- str_to_title(df$trafficway_type)
toptt <- count(df, trafficway_type)
toptt <- toptt[order(-toptt$n),]
#toptt[toptt$trafficway_type %in% c("Not Divided", "Four Way", "Divided - W/Median (Not Raised)", "One-Way", "Divided - W/Median Barrier", "T-Intersection"), "n"] / sum(toptt$n)

df3 <- df %>%
  select(trafficway_type, crash_date) %>%
  mutate(year = year(mdy_hms(crash_date)),
         toptrafficway = ifelse(trafficway_type == "Not Divided", "Not Divided", ifelse(trafficway_type=="Four Way", "Four Way", ifelse(trafficway_type=="Divided - W/Median (Not Raised)", "Divided - W/Median (Not Raised)", ifelse(trafficway_type=="One-Way", "One-Way", ifelse(trafficway_type=="Divided - W/Median Barrier", "Divided - W/Median Barrier", ifelse(trafficway_type=="One-Way", "One-Way", "Other"))))))) %>%
  group_by(year, toptrafficway) %>%
  summarise(n=length(toptrafficway), .groups = 'keep') %>%
  group_by(year) %>%
  mutate(percent_of_total = round(100*n/sum(n), 1)) %>%
  ungroup() %>%
  data.frame()

df3 <- subset(df3, year >= max(df3$year-2))

p <- ggplot(data = df3, aes(x="", y=n, fill=toptrafficway)) +
  geom_bar(stat="identity", position="fill") +
  coord_polar(theta="y", start=0) +
  labs(fill="Traffic Way Type", x=NULL, y=NULL, title="Traffic Way Type Count by Year", caption = "Slices under 4% are not labeled") +
  theme_minimal()+
  theme(plot.title=element_text(hjust=0.5),
        axis.text=element_blank(),
        axis.ticks=element_blank(),
        panel.grid=element_blank()) +
  facet_wrap(~year, ncol = 3, nrow = 1) +
  scale_fill_brewer(palette = "Blues")+
  geom_text(aes(x=1.9, label=ifelse(percent_of_total>4, paste0(percent_of_total, "%"), " ")), size = 3, position=position_fill(vjust=0.5))

print(p)
