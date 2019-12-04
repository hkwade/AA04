#AA04 project

# data frame work


library(dplyr)
library(leaflet)
library(ggplot2)
library(tidyr)
library(tibble)
#reading in CSV data -------------

df_two <- read.csv("indivisual_state_data.csv",
                   header = TRUE,
                   stringsAsFactors = FALSE
)


df_three <- read.csv("Washington_State.csv",
                     header = TRUE,
                     stringsAsFactors = FALSE
)

wa_state <- setNames(df_three, c("legislative_dist", "18-24", "25-34", "35-44",
                                 "45-54", "55-64",
                                 "65+", "unknown", "total_votes"))


wa_state_df <- wa_state[-c(1:2, 52), ]


wa_state_df[, 2] <- as.numeric(gsub(",", "", wa_state_df[, 2]))
wa_state_df[, 3] <- as.numeric(gsub(",", "", wa_state_df[, 3]))
wa_state_df[, 4] <- as.numeric(gsub(",", "", wa_state_df[, 4]))
wa_state_df[, 5] <- as.numeric(gsub(",", "", wa_state_df[, 5]))
wa_state_df[, 6] <- as.numeric(gsub(",", "", wa_state_df[, 6]))
wa_state_df[, 7] <- as.numeric(gsub(",", "", wa_state_df[, 7]))
wa_state_df[, 9] <- as.numeric(gsub(",", "", wa_state_df[, 9]))

test <- wa_state_df %>%
  arrange(desc(legislative_dist))

new_df_two <- df_two %>%
  group_by(X) %>%
  select(X, State, Turnout.Rates)

new_df_two <- new_df_two[-1, ]
colnames(new_df_two)[1] <- "time"

the_df <- function(year) {
  time <- NULL
  new <- new_df_two %>% filter(time == year)
  return(new)
}



#----------------------------

# pulling data frame from the first data frame (df) to
# create new sub data frames for visulizations,
# this creates easier columns/rows to filter for viz and easier to
# left/right/full join

# --------All population who voted ----------- all these should work---


# -------- DF3 Sorting for Pie Chart -----------

remove_rows <- df_three[-c(1, 2), ]
remove_column <- remove_rows[, -8]
names(remove_column) <- c("Legislative District", "18-24",
                          "25-34", "35-44", "45-54", "55-64",
                          "65 and Older", "Total")
df <- remove_column
df[, 2] <- as.numeric(gsub(",", "", df[, 2]))
df[, 3] <- as.numeric(gsub(",", "", df[, 3]))
df[, 4] <- as.numeric(gsub(",", "", df[, 4]))
df[, 5] <- as.numeric(gsub(",", "", df[, 5]))
df[, 6] <- as.numeric(gsub(",", "", df[, 6]))
df[, 7] <- gsub(",", "", df[, 7])
final_df <- data.frame(t(df[-1]))
colnames(final_df) <- c(1:49)
colnames(final_df)[50] <- "Total"
final_df <- final_df[-7, ]
final_df <- final_df[, -50]
