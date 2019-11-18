#AA04 project

# data frame work

setwd("~/Desktop/info_project")
library(dplyr)
library(leaflet)
library(ggplot2)
#reading in CSV data
df <- read.csv("Voting_data.csv",
               header = TRUE,
               stringsAsFactors = FALSE
)

#getting rid of NA columns

new_df <- df %>%
  select(-X.15,-X.16,-X.17,-X.18)
View(new_df)

vot_pop <- new_df %>%
  select(-X.3, -X.4, -X.5, -X.6, -X.7, -X.8, -X.9, -X.10, -X.11, -X.13, -X.14)
View(vot_pop)