# simple bar chart
library(ggplot2)

data(Marriage, package = "mosaicData")

library(treemapify)
# create a treemap of marriage officials
plotdata <- Marriage %>% count(officialTitle)

# plot the bars as percentages,
# in decending order with bar labels
p <- ggplot(plotdata,aes(fill = officialTitle, area = n, label = officialTitle)) +
geom_treemap() +
geom_treemap_text(colour = "white", place = "centre") +
labs(title = "Marriages by officiate") +
theme(legend.position = "none")

print(p)