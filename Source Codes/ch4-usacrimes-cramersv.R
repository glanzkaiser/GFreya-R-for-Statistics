library(ggplot2)
library(dplyr)
library(data.table) #for fread

# https://www.statology.org/correlation-between-categorical-variables/

df <- fread("/root/R/CSV/usa_crimes.csv")
summary(df)


head(df)
selected_df = df %>% select(State, Year, Month, Incident, Crime_Type, Crime_Solved, Victim_Sex, Victim_Age, Victim_Race,
		Perpetrator_Sex, Perpetrator_Age, Perpetrator_Race, Relationship, Weapon)

head(selected_df)

# to obtain the int value from the variable Male perpetrator
maleperpetrator <- count(selected_df, Perpetrator_Sex=='Male') %>% .$n
blackmaleperpetrator <- count(selected_df, Perpetrator_Sex=='Male', Perpetrator_Race=='Black') %>% pull(n) 

# you can count the frequencies of whichever variable(s) you give to group_by() 
selected_df %>% group_by(Perpetrator_Race,Perpetrator_Sex) %>% tally()

# Count Observations by Two Groups and Sort the Results 
selected_df %>% count(Perpetrator_Race,Perpetrator_Sex, sort=TRUE)


# Given your data is structured as a data frame, the following code has a better running time
# to compute conditional categorical variables from 2 data columns
# plus: test run time
ptm <- proc.time()
nrow(subset(selected_df, Perpetrator_Sex=='Male', Perpetrator_Race=='Black'))
proc.time() - ptm

# Now we can input Cramer's V formula and compute
library(rcompanion)

whitemale <- nrow(subset(selected_df, Perpetrator_Sex=='Male' & Perpetrator_Race=='White'))
blackmale  <- nrow(subset(selected_df, Perpetrator_Sex=='Male'& Perpetrator_Race=='Black'))
asianmale  <- nrow(subset(selected_df, Perpetrator_Sex=='Male' & Perpetrator_Race=='Asian/Pacific Islander'))
nativeamericanmale  <- nrow(subset(selected_df, Perpetrator_Sex=='Male' & Perpetrator_Race=='Native American/Alaska Native'))
whitefemale <- nrow(subset(selected_df, Perpetrator_Sex=='Female' & Perpetrator_Race=='White'))
blackfemale <- nrow(subset(selected_df, Perpetrator_Sex=='Female' & Perpetrator_Race=='Black'))
asianfemale  <- nrow(subset(selected_df, Perpetrator_Sex=='Female' & Perpetrator_Race=='Asian/Pacific Islander'))
nativeamericanfemale  <- nrow(subset(selected_df, Perpetrator_Sex=='Female' & Perpetrator_Race=='Native American/Alaska Native'))

#create 2x4 table
data = matrix(c(whitemale, whitefemale, blackmale, blackfemale, asianmale, asianfemale, nativeamericanmale, nativeamericanfemale), nrow=2)

#view table
data

#calculate Cramer's V
cramerV(data)