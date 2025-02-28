# Modified from Aneesh Rai

library(ggplot2)

## Code for PMF
p <- ggplot(data = data.frame(x = 1:5,
                         y = c(1/16,1/4,3/8,1/4,1/16),
                         yend = rep(0,5)),
       aes(x = x, y = y, xend = x, yend = yend)) +
  geom_point() +
  geom_segment() +
  scale_x_continuous(name="\nx",
                     breaks=1:5,
                     limits = c(0.5, 4.5)) +
  scale_y_continuous(name="f(x)\n",
                     limits = c(0.0,0.6)) +
  ggtitle("PMF for discrete random variable X\n") +
  annotate(geom = "text",
           x = c(1:5),
           y = c(1/16 + 0.03,1/4 + 0.03,3/8 + 0.03,1/4 + 0.03,1/16 + 0.03),
           label = c("P = 1/16",
                     "P = 1/4",
                     "P = 3/8",
                     "P = 1/4",
                     "P = 1/16")) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5),
        text = element_text(size = 15))

print(p)
