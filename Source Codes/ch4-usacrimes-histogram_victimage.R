library(dplyr)
library(ggplot2)
library(data.table) #for fread

df <- fread("/root/R/CSV/usa_crimes.csv")

selected_df = df %>% select(State, Year, Month, Incident, Crime_Type, Crime_Solved, Victim_Sex, Victim_Age, Victim_Race,
		Perpetrator_Sex, Perpetrator_Age, Perpetrator_Race, Relationship, Weapon)

p <- ggplot(selected_df, aes(x = Victim_Age)) +
geom_histogram(fill = "navyblue", color = "white", binwidth = 5) +
labs(title = "Crime Commited in USA", subtitle = "binwidth = 5", x = "Age of Victim") +
scale_x_discrete(drop=FALSE) + xlim(c(0, 100))


print(p)