# simple bar chart
library(ggplot2)

data(Marriage, package = "mosaicData")

# bar chart with rotated labels
p <- ggplot(Marriage, aes(x=officialTitle)) +
geom_bar(fill="navyblue", color="black") +
labs(x = "", y = "Frequency", title = "Marriages by officiate") +
theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(p)