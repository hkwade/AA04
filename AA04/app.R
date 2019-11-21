# Data Visualizations

library(ggplot2)
library(leaflet)
library(mapview)
library(ggplot2)
library(plotly)
source("AA04 project.R")



line_graph <- ggplot(data = new_df_three, 
                     aes(x = Year, y = TurnoutRates, group = 1)) +
  geom_line(color = "BLACK") +
  geom_point() +
  ggtitle("Average Turnout Rates Per Year in America") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1))


washington_bar_graph <- ggplot(wa_state_df) + 
  geom_col(mapping = aes(x = legislative_dist, y = eighteen_to_twenty_four))
