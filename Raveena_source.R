new_df_two <- df_two %>%
  group_by(X) %>% 
  select(X, State, Turnout.Rates) 

new_df_two <- new_df_two[-1, ]

the_df <- function(year) {
  new <- new_df_two %>% filter(X == year)
}
