library(ggplot2)

# Sample data
corn = read.csv("cornyield.csv", header=TRUE)

p <- ggplot(corn, aes(x=year, y=yield, color = country)) +
	geom_line() +
	geom_point(aes(color=country)) +
	xlab("Year") +
	ylab("Yield (ton/hectare)") +
	ggtitle("Corn Yield 2014-2024") +
	scale_x_continuous(breaks = seq(2014, 2024, by = 1), limits = c(2014,2024))
