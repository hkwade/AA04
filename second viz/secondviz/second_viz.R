# second viz for Midpoint


library(leaflet)
library(mapview)
library(ggplot2)
library(plotly)


df_three <- read.csv("Washington_State.csv",
                     header = TRUE,
                     stringsAsFactors = FALSE
)   

wa_state <- setNames(df_three, c("legislative_dist", "seventeen-twentyfour", "twentyfive-thirtyfour","thirtyfive-fourtyfour", 
                                 "fourtyfive-fiftyfour","fifty-sixtyfour",
                                 "65_and_over", "unknown", "total_votes"))
View(wa_state)

wa_state_df <- wa_state[-c(1:2, 52),]
View(wa_state_df)

wa_state_df[, 2] <- as.numeric(gsub(",","", wa_state_df[, 2]))
wa_state_df[, 3] <- as.numeric(gsub(",","", wa_state_df[, 3]))
wa_state_df[, 4] <- as.numeric(gsub(",", "", wa_state_df[, 4]))
wa_state_df[, 5] <- as.numeric(gsub(",", "", wa_state_df[, 5]))
wa_state_df[, 6] <- as.numeric(gsub(",", "", wa_state_df[, 6]))
wa_state_df[, 7] <- as.numeric(gsub(",", "", wa_state_df[, 7]))
wa_state_df[, 9] <- as.numeric(gsub(",", "", wa_state_df[, 9]))

test <- wa_state_df %>%
  arrange(desc(legislative_dist))
View(test)

plot_ly(wa_state_df, x = wa_state_df$legislative_dist, y = wa_state_df[, input$age], type = 'bar',
        marker = list(color = 'rgb(158,202)',
                      line = list(color = 'rgb(8,48)',
                                  width = 1.5))) %>%
  layout(title = "Votes per legislative district",
         xaxis = list(title = "Legislative district"),
         yaxis = list(title = "number of votes"))