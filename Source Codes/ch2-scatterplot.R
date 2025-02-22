library(ggplot2)
		
insurance <- read.csv('insurance.csv')

p <- ggplot(insurance, aes(x=age, y=charges, colour=sex)) + geom_point() + scale_color_manual(values =c('red', 'blue'))
		
png("plot.png")
print(p)
dev.off()