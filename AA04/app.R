#AA04 project

# data frame work

setwd("~/Desktop/AA04/AA04")
library(dplyr)
library(leaflet)
library(ggplot2)
library(tidyr)

#reading in CSV data -------------

df <- read.csv("Voting_data.csv",
               header = TRUE,
               stringsAsFactors = FALSE
)


df_two <- read.csv("Indivisual_state_data.csv",
                   header = TRUE,
                   stringsAsFactors = FALSE
)



df_three <- read.csv("Washington_State.csv",
                     header = TRUE,
                     stringsAsFactors = FALSE
) 



# deleting unneeded columns from data-------------

new_df <- df %>%
  select(-X.3:-X.12, -X.15:-X.18, -X.13:-X.14)


# changed column names - easier readability --------------

data_one <- setNames(new_df, c("Year","Total votes (all ages)  \n - by thousands",
                               "total population (by percent)",
                               "citizen population"))


wa_state <- setNames(df_three, c("legislative_dist", "eighteen_to_twenty_four",
                                 "twentyfive_to_thirty_four","thirtyfive_to_fourty_four", 
                                 "fourtyfive_to_fifty_four","fiftyfive_to_sixty_four",
                                 "sixtyfive_to_and over", "uknown", "total_votes"))



# -----deleting uneeded rows from data frames ------------

first_best_frame <- data_one[-c(1:5, 35:37, 67:69, 100:102, 133:135, 166:168, 199:201),]


wa_state_df <- wa_state[-c(1:2, 52),]


new_df_two <- df_two %>%
  filter(State == "United States") %>%
  select(X, State, Turnout.Rates) %>%
  slice(1:9)
View(new_df_two)



#----------------------------

# pulling data frame from the first data frame (df) to 
# create new sub data frames for visulizations,
# this creates easier columns/rows to filter for viz and easier to 
# left/right/full join

# --------All population who voted ----------- all these should work---

all_voted <-first_best_frame %>%
  select(everything()) %>%
  slice(2:29)


# ------All population who registered ---------

all_registered <-first_best_frame %>%
  select(everything()) %>%
  slice(31:58) %>%
  setNames(c("year","all registered", "total pop \n by percent", "citizen pop \n (by thousands)"))


# --- 18-24 who voted--------

young_voted <-first_best_frame %>%
  select(everything()) %>%
  slice(61:88) %>%
  setNames(c("year"," 18-24 \n voted", "total pop \n by percent", "citizen pop \n (by thousands)"))


#-----18-24 who registered --------

young_registered <-first_best_frame %>%
  select(everything()) %>%
  slice(91:118) %>%
  setNames(c("year","18-24 \n registered", "total pop \n by percent", "citizen pop \n (by thousands)"))


#-----25-44 who voted --------

middle_voted <-first_best_frame%>%
  select(everything()) %>%
  slice(121:148) %>%
  setNames(c("year","24-44 \n voted", "total pop \n by percent", "citizen pop \n (by thousands)"))


#-----25-44 who registered ---------

middle_registered <- first_best_frame %>%
  select(everything()) %>%
  slice(151:178) %>%
  setNames(c("year","24-44 \n registered", "total pop \n by percent", "citizen pop \n (by thousands)"))


#-----45-64 who voted --------

older_voted <- first_best_frame %>%
  select(everything()) %>%
  slice(181:208) %>%
  setNames(c("year","45-64 \n voted", "total pop \n by percent", "citizen pop \n (by thousands)"))


#-----45-64 who registered ---------

older_registered <- first_best_frame %>%
  select(everything()) %>%
  slice(214:241) %>%
  setNames(c("year","45-64 \n registered", "total pop \n by percent", "citizen pop \n (by thousands)"))


#-----65 and older who voted -----

oldest_voted <- first_best_frame %>%
  select(everything()) %>%
  slice(247:274) %>%
  setNames(c("year","65 and older \n voted", "total pop \n by percent", "citizen pop \n (by thousands)"))


#-----45-64 who registered ---------

oldest_registered <- first_best_frame %>%
  select(everything()) %>%
  slice(280:306) %>%
  setNames(c("year","65 and older \n registered", "total pop \n by percent", "citizen pop \n (by thousands)"))


# --------- visulizations ---------
line_graph <- ggplot(data = new_df_two, 
                     aes(x = X, y = Turnout.Rates, group = 1)) +
  geom_line(color = "BLACK") +
  geom_point() +
  ggtitle("Average Turnout Rates Per Year in America") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1))


washington_bar_graph <- ggplot(wa_state_df) + 
  geom_col(mapping = aes(x = legislative_dist, y = eighteen_to_twenty_four))
