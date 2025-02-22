library(ggplot2)

insurance <- read.csv('insurance.csv')

# create an obesity variable
insurance$obese <- ifelse(insurance$bmi >= 30,"obese", "not obese")

p <- ggplot(data = insurance,mapping = aes(x = age,y = charges, color = smoker)) + geom_point(alpha = .5) + geom_smooth(method = "lm", se = FALSE) +
scale_x_continuous(breaks = seq(0, 70, 10)) + scale_y_continuous(breaks = seq(0, 60000, 20000), label = scales::dollar) +
scale_color_manual(values = c("indianred3","cornflowerblue")) + facet_wrap(~obese) +
labs(title = "Relationship between age and medical expenses",
subtitle = "US Census Data 2013",
caption = "source: https://github.com/stedy/Machine-Learning-with-R-datasets/",
x = " Age (years)",
y = "Medical Expenses",
color = "Smoker?") +
theme_minimal()

png('plot.png')
print(p)
dev.off()