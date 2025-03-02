# Merci Freya, Sentinel, Berlin.

library(GGally)
library(corrplot)
library(ggcorrplot)
library(car)
library(tidyverse)
library(data.table) #for fread

data <- fread("/root/R/CSV/countries_of_the_world.csv")

selected_data = data %>% select(Country, Population, Area, PopulationDensity, Coastline, NetMigration, InfantMortality, GDP, Literacy, Arable, Crops, Other, Birthrate, Deathrate, Agriculture, Industry, Service)
head(selected_data)

# Show country, GDP and Literacy and sort them in decreasing order of the GDP
newdata = selecteddata %>% select(Country,GDP,Literacy)
w1 <- newdata[order(newdata$GDP, decreasing = TRUE)]
head(w1,20)

# Pearson correlation test
# The Pearson correlation coefficient varies between -1 and 1, 
# where 0 indicates no relationship, 1 indicates perfect positive relationship, -1 indicates perfect negative relationship. 

correlation_gdp_literacy <- cor.test(selected_data$GDP, selected_data$Literacy)

cat(paste("Pearson correlation between GDP and literacy : "))
cat("\n")
cat(paste(correlation_gdp_literacy))
cat("\n")

# Spearman correlation test
# cor.test(data$Literacy, data$Climate, method = 'spearman')

# Correlation matrix and visualization
economic_data1 = selected_data %>% select(Arable, Crops, Other, Agriculture, Industry, Service)

economic_data2 = selected_data %>% select(PopulationDensity, Coastline, NetMigration, InfantMortality, GDP, Literacy)

p1 <- plot(economic_data1, gap = 1/10, main = 'Pair-wise correlation matrix')

p2 <- plot(economic_data2, gap = 1/10, main = 'Pair-wise correlation matrix')

p3 <- scatterplotMatrix(formula = ~Arable+Crops+Other+Agriculture+Industry+Service, data = economic_data1,
                  smooth = FALSE, regLine = TRUE, ellipse = FALSE)

# Create the r matrix
cor_mat = cor(economic_data1, use="complete.obs")
p4 <- round(cor_mat, 2) 
cor_mat2 = cor(economic_data2, use="complete.obs")
p41 <- round(cor_mat2, 2) 

# Create the p matrix
p_mat = cor_pmat(economic_data1, use="complete.obs")
p5 <- round(p_mat, 2) 
p_mat2 = cor_pmat(economic_data2, use="complete.obs")
p51 <- round(p_mat2, 2) 

p6 <- ggcorrplot(cor_mat)

p7 <- ggcorrplot(corr = cor_mat, p.mat = p_mat,
           method = 'square',
           type = 'lower', insig = 'pch', 
           ggtheme = ggplot2::theme_test)

p8 <- corrplot(cor_mat)

p9 <- corrplot(corr = cor_mat, p.mat = p_mat,
         method = 'pie',
         type = 'lower',
         insig = 'pch',
         diag = FALSE,
         bg = 'grey95',
         tl.col = 'black',
         title = "Correlation matrix based on Pearson's r",
         mar = c(1,1,2,1))

p10 <- ggpairs(economic_data1) + theme_test()