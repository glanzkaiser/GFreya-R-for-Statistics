# https://rpubs.com/nicoleknight/936037

library(ggplot2)
library(tidyverse)
library(PNWColors)

x <- seq(0.001, 0.999, by = 0.001)  #generate a series of values at which to evaluate the beta distribution

a_values <- seq(1, 5, by = 1)
b_values <- seq(1, 5, by = 1)
beta_df <- expand.grid(a_values, b_values, x)
colnames(beta_df) <-c ("α", "β", "x")

beta_df$beta <- dbeta(beta_df$x, 
                      beta_df$a, 
                      beta_df$b)

beta_df$ID <- paste(beta_df$a, ", ", beta_df$b, sep = "")
beta_df$a_label <- paste("α = ", beta_df$a, sep = "")
beta_df$b_label <- paste("β = ", beta_df$b, sep = "")

colour_scale <- pnw_palette(name="Starfish", length(unique(beta_df$a_label)))

beta_df %>%
  ggplot(aes(x = x, y = beta)) + 
  geom_point(aes(colour = a_label), size = 1) + 
  theme_light() + 
  scale_colour_manual(values = colour_scale) +
  facet_grid(vars(b_label), vars(a_label)) +
  ylab("Beta(x)") +
  theme(legend.position = "none",
        strip.text = element_text(size = 12, colour = "black"),
        strip.background = element_blank())