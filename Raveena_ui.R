#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)
library(shinythemes)
source("source.R")

# Define UI for application that draws a histogram
page_one <- tabPanel(
  "Background",
  titlePanel("Background and Research Questions"),
  h3("Background"),
  p("There is a lack of political involvement within generations
      across the U.S."),
  h3("Research Questions"),
  print("How does misinformation/lack of information affect
          voting history?"),
  br(),
  print("What is the young adult voting history?")
  
)

page_viz1 <- tabPanel(
  "Viz 1",
  titlePanel("Visualization One"),
  sidebarLayout(
    sidebarPanel(
      selectInput("selects", "Year",  
                  choices = list("Select" = new_df_two$X),
                  selected = 1)
    ),
    mainPanel(
      h3("Bar Graph"),
      plotOutput("bar_graph2")
    )
  )
  
)
page_viz2 <- tabPanel(
  "Viz 2", 
  titlePanel("Visualization Two"),
  sidebarLayout(
    sidebarPanel(
      h3("Age Group"),
      checkboxInput('young', '18-24'),
      checkboxInput('not as young', '25-34'),
      checkboxInput('older', '35-44'),
      checkboxInput('old', '45-54'),
      checkboxInput('even older', '55-64'),
      checkboxInput('oldest', '65 and older')
    ),
    mainPanel(
      h3("Bar Graph"),
      plotOutput(outputId = "washington_bar_graph")
    )
  )
  
)
page_viz3 <- tabPanel(
  "Viz 3",
  titlePanel("Visualization Three")
)

page_two <- navbarMenu(
  "Visualizations",
  page_viz1,
  page_viz2,
  page_viz3
  
)

page_three <- tabPanel(
  "Conclusion",
  titlePanel("Conclusion"),
  p("The strengths of our project include teamwork, communication, and real-world problem solving.
      For instance, we feel that we chose a topic that can make a true difference, considering the
      fact that a lot of young adults lack political education. However, some weaknesses include the
      data sets we chose to work with and the questions we are trying to answer. We've learned that
      we should look at data sets before formulating questions. By looking at data sets beforehand,
      we can analyze and become curious about the data to form questions. We hope that in the future,
      someone can use what we found to motivate young adults and/or Washingtonians to vote more or keep
      doing a good job.")
)

page_four <- tabPanel(
  "About the Tech",
  titlePanel("About the Technology"),
  a("Technical Report", href = "https://github.com/hkwade/AA04/wiki"),
  p("We loaded all of data using .csv files. The major libraries that we used were shiny, dplyr, and
      ggplot. We organized our code for the app in a folder (AA04) located in the main project repository.
      Using statistical analysis, we will be able to visualize the Washington State voter turnout and the
      average United States voter turnout.")
)

page_five <- tabPanel(
  "About Us",
  titlePanel("About Us"),
  h3("Raveena Rao: Intended Informatics"),
  br(),
  h3("Precious Stowers: Intended Informatics"),
  br(),
  h3("Hunter Wade: Intended Applied Computational & Mathematical Sciences")
  
)



ui <- navbarPage(
  theme = shinytheme("flatly"),
  "Young Adult Political Involvement",
  page_one,
  page_two,
  page_three,
  page_four,
  page_five
)