library(ggplot2)

data(Marriage, package = "mosaicData")

p <- ggplot(Marriage, aes(x = age)) +
geom_density(fill = "navyblue", bw = 2) +
labs(title = "Participants by age",subtitle = "bandwidth = 2")

# default bandwidth for the age variable
# choosing a value that is less than bw.nrd0(Marriage$age) will resulting in less smoothing and more detail
bw.nrd0(Marriage$age)

png('plot.png')
print(p)
dev.off()