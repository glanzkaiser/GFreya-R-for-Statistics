library(ggplot2)

data(Marriage, package = "mosaicData")

p <- ggplot(Marriage, aes(x = age)) +
geom_histogram(fill = "navyblue", color = "white", bins = 20) +
labs(title = "Participants by age", subtitle = "number of bins = 20", x = "Age")

# displays the data with binwidth that are 5 years wide
#p <- ggplot(Marriage, aes(x = age)) +
#geom_histogram(fill = "navyblue", color = "white", binwidth = 5) +
#labs(title = "Participants by age", subtitle = "binwidth = 5 years", x = "Age")

# plot the histogram with percentages on the y-axis
#library(scales)

#p <- ggplot(Marriage, aes(x = age, y = after_stat(count/sum(count)))) +
#geom_histogram(fill = "navyblue", color = "white", binwidth = 5) +
#labs(title="Participants by age", y = "Percent", x = "Age") +
#scale_y_continuous(labels = percent)

png('plot.png')
print(p)
dev.off()