library(tidyverse)
library(ggplot2)
library(readxl)

standard_stats <- read_excel("Stats.xlsx")
view(standard_stats)


### Graph 1 ###
ggplot(standard_stats) +
  aes(x = Team, y = wFA) + 
  geom_point(stat = "identity", col = "red")


### Graph 2 ### 
ATL <- standard_stats %>% 
  filter(Team == "ATL") %>% 
  select(Team, Soft_pct, Med_pct, Hard_pct)
ATL

hit <- c("Soft", "Medium", "Hard")
pct <- c(0.134, 0.482, 0.383)
ATL_df <- data.frame(Hit = hit, Pct = pct)

ggplot(ATL_df, aes(x = Hit, y = Pct)) +
  geom_histogram(stat = "identity", fill = "red", color = "white") +
  labs(title = "Histogram of Hit and Pct", x = "Hit", y = "Pct")



### Graph 3 ###
ggplot(standard_stats) + 
  geom_bar(aes(x = Team, y = HR, fill = Team), stat = "identity") +
  guides(fill = FALSE)


### Graph 4 ###
ATL_2 <- standard_stats %>% 
  filter(Team == "ATL") %>% 
  select(Team, O_Swing_pct, Z_Swing_pct)
ATL_2

in_out <- c("O_Swing_pct", "Z_Swing_pct")
pct <- c(0.303, 0.694)
ATL_df2 <- data.frame(Hit = in_out, Pct = pct)

ggplot(ATL_df2, aes(x = "", y = Hit, fill = Pct)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar(theta = "y") +
  theme_minimal() +
  labs(title = "Polar Bar Chart of Hit and Pct")


### Graph 5 ###
ggplot(standard_stats) + 
  geom_bar(aes(x = Team, y = Barrels, col = "red"), stat = "identity") +
  guides(fill = FALSE)
