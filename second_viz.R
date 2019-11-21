# second viz for Midpoint


library(leaflet)
library(mapview)
library(ggplot2)
library(leaflet)
library(plotly)

source("AA04 project.R")

df_three <- read.csv("Washington_State.csv",
                     header = TRUE,
                     stringsAsFactors = FALSE
)   

wa_state <- setNames(df_three, c("legislative_dist", "17-24", "25-34","35-44", "45-54","55-64",
                                 "65_and_over", "uknown", "total_votes"))
View(wa_state)

wa_state_df <- wa_state[-c(1:2, 52),]
View(wa_state_df)

washington_bar_graph <- ggplot(wa_state_df) + 
                        geom_col(mapping = aes(x = legislative_dist, y = eighteen_to_twenty_four))
