#AA04 project

# data frame work

setwd("~/Desktop/AA04")
library(dplyr)
library(leaflet)
library(ggplot2)
library(tidyr)

#reading in CSV data -------------

df <- read.csv("Voting_data.csv",
               header = TRUE,
               stringsAsFactors = FALSE
)

df_two <- read.csv("more_data.csv",
                   header = TRUE, 
                   stringsAsFactors = FALSE
)

# deleting NA and unneeded columns -------------

new_df <- df %>%
  select(-X.3:-X.12, -X.15:-X.18, -X.13:-X.14)
View(new_df)


new_two_df <- df_two %>%
  select(-X.14:-X.56)
View(new_two_df)


# changed column names - easier readability --------------

data_one <- setNames(new_df, c("Year","Total votes (all ages)  \n - by thousands",
                                  "total population (by percent)",
                                  "citizen population"))
View(data_one)
  
data_two <- setNames(new_two_df, c("state"))


# deleting uneeded rows
first_best_frame <- data_one[-c(1:5, 35:37, 67:69, 100:102, 133:135, 166:168, 199:201),]
  View(first_best_frame)

second_best_frame <- data_two[-c(1),]

#joining together for final frame

View(second_best_frame) # This is where I stopped

final_frame <- first_best_frame %>%
  left_join(second_best_frame, by = state) # this function does not work, because I need to name 
View(final_frame)                                      # all of the collumns still
  
# pulling data to create new sub data frames for visulizations ------------
  # this creates easier columns/rows to filter for viz and easier to 
  # left/right/full join
  
# --------All population who voted -----------

all_voted <-first_best_frame %>%
  select(everything()) %>%
  slice(2:29)
View(all_voted)

# ------All population who registered ---------

all_registered <-first_best_frame %>%
  select(everything()) %>%
  slice(31:58)
View(all_registered)

# --- 18-24 who voted--------

young_voted <-first_best_frame %>%
  select(everything()) %>%
  slice(61:88)
View(young_voted)

#-----18-24 who registered --------

young_registered <-first_best_frame %>%
  select(everything()) %>%
  slice(91:118)
View(young_registered) 

#-----25-44 who voted --------

middle_voted <-first_best_frame%>%
  select(everything()) %>%
  slice(121:148)
View(middle_voted)

#-----25-44 who registered ---------

middle_registered <- first_best_frame %>%
  select(everything()) %>%
  slice(151:178)
View(middle_registered)

#-----45-64 who voted --------

older_voted <- first_best_frame %>%
  select(everything()) %>%
  slice(181:208)
View(older_voted)

#-----45-64 who registered ---------

older_registered <- first_best_frame %>%
  select(everything()) %>%
  slice(214:241)
View(older_registered)

#-----65 and older who voted -----

oldest_voted <- first_best_frame %>%
  select(everything()) %>%
  slice(247:274)
View(oldest_voted)

#-----45-64 who registered ---------

oldest_registered <- first_best_frame %>%
  select(everything()) %>%
  slice(280:306)
View(oldest_registered)

  