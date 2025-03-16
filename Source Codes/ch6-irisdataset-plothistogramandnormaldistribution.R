#https://stackoverflow.com/questions/42758483/how-can-i-make-this-histogram-of-a-dataset-variable-overplayed-with-its-normal
library(ggplot2)

iris = read.csv("iris.csv", header=TRUE)

species_list <- split(iris, iris$variety) # split data.frame into lists by Species

par(mfrow = c(1,length(species_list))) # set the grid of the plot to be 1 row, 3 columns 
for(i in 1:length(species_list)){ # using length(species_list) for the # of species
  # subsetting lists with double brackets `[[`
  hist(species_list[[i]]$sepal.width, probability = T, 
       main = "", xlab = "Sepal Width (cm)", ylab = "Probability", # `main` is empty
       col = c("darkslateblue","royalblue1","navyblue")[i]) # picks a new color each time (here out of 3)
  # my favorite function for plot titles
  mtext(toupper(names(species_list)[i]), # upper case species name for title
        side = 3, # 1 is bottom, 2 is left, 3 is top, 4 is right
        line = 0, # do not shift up or down
        font = 2) # 2 is bold
  # Simpler than building from scratch use the built in function:
  curve(dnorm(x, mean = mean(species_list[[i]]$sepal.width), 
                 sd = sd(species_list[[i]]$sepal.width)), 
                 yaxt = "n", add = TRUE, col = "darkgoldenrod2", lwd = 2)
}
# At the end post a new title
mtext("Histograms of Sepal Width by Species Overlayed with a Normal Distribution", 
      outer = TRUE, # this puts it outside of the 3 plots
      side = 3, line = -1, # shift it down so we can see it
      font = 2)
par(mfrow = c(1,1)) # set the plot parameters back to a single plot when finished