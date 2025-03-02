# Modified from https://www.geeksforgeeks.org/how-to-calculate-conditional-probability-in-r/

# Library for calculation of conditional probability
library(probs)
library(tidyverse)
 
#  the intensity and frequency between DS Glanzsche and a girl in San Gregorio, L'Aquila during her stay there for 15 days
Intensity <- c("High", "Low", "High", "High",
                  "Low", "Low", "High", "Low", 
                  "High", "High", "High", "Low",
                  "High", "High", "High")
Frequency <- c("Less", "More", "More", "Less", 
                "More", "More", "More", "More",
                "More", "More", "More", "More",
                "Less", "More", "Less")
Day <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 
               11, 12, 13, 14, 15)
 
# Love Data Frame
Love_Data <- as.data.frame(cbind(Day, Intensity, Frequency))
Love_Data %>%
count(Intensity, Frequency, sort=T)
 
# Creating two-way table from data frame
Love_Data_Table <- addmargins(table("Intensity"=Love_Data$Intensity,
                                         "Frequency"=Love_Data$Frequency))
# view table
Love_Data_Table
 
Love_Data <- probspace(Love_Data)
Love_Data
 
# Probability of DS Glanzsche and the girl in San Gregorio spending time with high intensity 
# given that they are see each other less often in a day
phighless <- Prob(Love_Data, event=Intensity == "High", given=Frequency == "Less")
 
# Probability of DS Glanzsche and the girl in San Gregorio spending time with less intensity 
# given that they are see each other more often in a day
plowmore <- Prob(Love_Data, event=Intensity == "Low", given=Frequency == "More")
 
# Probability of DS Glanzsche and the girl in San Gregorio spending time with less intensity 
# given that they are see each other less often in a day
plowless <- Prob(Love_Data, event=Intensity == "Low", given=Frequency == "Less")
 
# Probability of DS Glanzsche and the girl in San Gregorio spending time with high intensity 
# given that they are see each other more often in a day
phighmore <- Prob(Love_Data, event=Intensity == "High", given=Frequency == "More")

