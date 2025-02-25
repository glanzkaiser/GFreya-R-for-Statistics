library(dplyr)
library(ggplot2)

df <- fread("/root/R/CSV/usa_crimes.csv")
summary(df)


head(df)
selected_df = df %>% select(State, Year, Month, Incident, Crime_Type, Crime_Solved, Victim_Sex, Victim_Age, Victim_Race,
		Perpetrator_Sex, Perpetrator_Age, Perpetrator_Race, Relationship, Weapon)

head(selected_df)

perpetratorsexcount <- data.frame(count(selected_df, Perpetrator_Sex))
perpetratorsexcount <- perpetratorsexcount[order(perpetratorsexcount$n, decreasing = TRUE),]

most_common <- perpetratorsexcount[1:3,]

other <- perpetratorsexcount[4:18,]

other_sum <- sum(other$n)

otherdf <- data.frame(Perpetrator_Sex = 'OTHER', n = other_sum)

top5 <- rbind(most_common, otherdf)
top5 <- top5[order(top5$n, decreasing = TRUE),]


top5$Perpetrator_Sex <- str_to_title(top5$Perpetrator_Sex)

p <- ggplot(top5, aes(x= reorder(Perpetrator_Sex, -n), y = n)) +
  geom_bar(colour = 'black', fill = 'navyblue', stat = 'identity') +
  labs(title = "Crime Commited in USA by Gender", x = "Perpetrator Sex", y = "Number of Crimes") +
  geom_text(aes(label= comma(n)), vjust = -.5, size = 3) +
  theme(plot.title = element_text(hjust=0.5)) +
  theme_gray()+
  scale_y_continuous(label = comma)

print(p)