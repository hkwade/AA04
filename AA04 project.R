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

# deleting NA and unneeded columns

new_df <- df %>%
  select(-X.15,-X.16,-X.17,-X.18)
View(new_df)

vot_pop <- new_df %>%
  select(-X.3, -X.4, -X.5, -X.6, -X.7, -X.8, -X.9, -X.10, -X.11, -X.13, -X.14, -X.12)
View(vot_pop)

# changed column names - easier readability
data_frame <- setNames(vot_pop, c("Year","Total votes (all ages)  \n - by thousands",
                                  "total population (by percent)",
                                  "citizen population"))
View(data_frame)

# deleting uneeded rows
removed_rows <- data_frame[-c(1:5, 35:37, 67:69, 100:102, 133:135, 166:168, 199:201),]
  View(removed_rows)
