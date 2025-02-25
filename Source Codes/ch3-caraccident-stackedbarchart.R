library(dplyr)
library(ggplot2)
library(scales)
library(stringr)
library(ggrepel)
library(lubridate)
library(ggthemes)
library(RColorBrewer)
library(data.table)

df$prim_contributory_cause <- str_to_title(df$prim_contributory_cause)

topcontrib <- df %>%
  count(prim_contributory_cause, sort = TRUE) %>%
  slice_head(n = 5)

df5 <- df %>%
  filter(prim_contributory_cause %in% topcontrib$prim_contributory_cause) %>%
  group_by(damage, prim_contributory_cause) %>% 
  summarise(totalcars = sum(num_units), .groups = "drop") %>%  
  data.frame()

df5$damage <- as.factor(df5$damage)

p <- ggplot(df5, aes(x = reorder(prim_contributory_cause, totalcars), y = totalcars, fill = damage)) +
  geom_bar(stat = "identity", position = position_stack(reverse = TRUE)) +
  labs(title = "Cars Involved in Top 5 Primary Contributory Causes by Damage",
       x = " ",
       y = "Amount of Cars Involved in Accidents",
       fill = "Cost of Damage") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_y_continuous(labels = comma,
                     breaks = seq(0, 120000, by = 20000)) +
  geom_text(aes(label = comma(totalcars)), 
            stat = "identity", 
            position = position_stack(vjust = 0.5, reverse = TRUE), 
            size = 3, color = "black", angle = 0)+
  scale_fill_brewer(palette = "Blues")

print(p)
