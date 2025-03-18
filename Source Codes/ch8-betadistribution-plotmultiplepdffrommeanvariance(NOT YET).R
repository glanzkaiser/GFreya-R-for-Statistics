# https://rpubs.com/nicoleknight/936037

#-Generate values of a and b from mu and phi-#
library(ggplot2)
library(tidyverse)
library(PNWColors)

mu <- c(0.1, 0.2, 0.4, 0.6, 0.8)
phi <- c(1, 5, 10, 20, 50)

par_values <- expand.grid(mu, phi)
colnames(par_values) <- c("μ", "σ^2")

#-We can back-calculate a and b from mu and phi with a little algebra-#

par_values$a <- par_values$mu *par_values$phi 
par_values$b <- par_values$phi - par_values$mu * par_values$phi

#-Create labels for the plot-#

par_values$mu_label <- paste("μ = ", par_values$mu, sep =)
par_values$phi_label <- paste("σ^2 = ", par_values$phi, sep = "")
par_values$ID <- paste(par_values$a, ", ", par_values$b, sep = "")

beta_df2 <- expand.grid(par_values$ID, x)
colnames(beta_df2) <- c("ID", "x")
beta_df2 <- full_join(beta_df2, par_values, by = "ID")

#-Calculate probability estimates-#

beta_df2$beta <- dbeta(beta_df2$x, beta_df2$a, beta_df2$b)

#-Build our plot-#

beta_df2$phi_label <- factor(as.factor(beta_df2$phi_label), 
                      c('σ^2 = 1', 'σ^2 = 5', 'σ^2 = 10', 'σ^2 = 20', 'σ^2 = 50'))

colour_scale2 <- pnw_palette("Sailboat", length(unique(beta_df2$mu_label)))
                              
beta_df2 %>%
  ggplot(aes(x = x, y = beta)) + 
  geom_point(aes(colour = mu_label), size = 1) + 
  theme_light() + 
  scale_colour_manual(values = colour_scale2) +
  facet_grid(vars(phi_label), vars(mu_label), scale = "free") +
  ylab("Beta(x)") +
  theme(legend.position = "none",
        strip.text = element_text(size = 12, colour = "black"),
        strip.background = element_blank())