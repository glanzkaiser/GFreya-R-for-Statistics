# simple bar chart
library(ggplot2)

data(Marriage, package = "mosaicData")

# plot the distribution as percentages
#ggplot(Marriage, aes(x = race, y = after_stat(count/sum(count)))) +
#geom_bar(fill="navyblue", color="black") +
#labs(x = "Race", y = "Percent", title = "Participants by race") +
#scale_y_continuous(labels = scales::percent)

#print(p)

# calculate number of participants in each race category
library(dplyr)

plotdata <- Marriage %>% count(race) %>% mutate(pct = n / sum(n), pctlabel = paste0(round(pct*100), "%"))

# plot the bars as percentages,
# in decending order with bar labels
p <- ggplot(plotdata, aes(x = reorder(race, -pct), y = pct)) +
geom_bar(stat="identity", fill="navyblue", color="black") +
geom_text(aes(label = pctlabel), vjust=-0.25) +
scale_y_continuous(labels = scales::percent) +
labs(x = "Race", y = "Percent", title = "Participants by race")

print(p)