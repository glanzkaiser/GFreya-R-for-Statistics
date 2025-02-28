library(ggplot2)
library(dplyr)
library(data.table) #for fread

df <- fread("/root/R/CSV/usa_crimes.csv")
summary(df)


head(df)
selected_df = df %>% select(State, Year, Month, Incident, Crime_Type, Crime_Solved, Victim_Sex, Victim_Age, Victim_Race,
		Perpetrator_Sex, Perpetrator_Age, Perpetrator_Race, Relationship, Weapon)

head(selected_df)

# Pearson correlation test
#cor.test(selected_df$Victim Sex, selected_df$Perpetrator Sex)

# Spearman correlation test

#cor.test(selected_df$Victim Sex, selected_df$Perpetrator Sex, method = 'spearman')