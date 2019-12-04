#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny)
source("source.R")
library(shinythemes)

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
    "WA vs US",
    titlePanel("Washington Compared to the United States"),
    sidebarLayout(
      sidebarPanel(
        selectInput("selects", "Year",
                    choices = list("Select" = new_df_two$time),
                    selected = 1)
      ),
      mainPanel(
        plotOutput("bargraph")
      )
    )
 )

page_viz2 <- tabPanel(
    "District Voters",
    sidebarLayout(
      sidebarPanel(
        selectInput("age", "Age Ranges",
                    choices = colnames(wa_state_df[2:7])),
      ),

      # Show a plot of the generated distribution
      mainPanel(
        plotlyOutput("barchart")
      )
    )
)
page_viz3 <- tabPanel(
    "Age of Voters",
    sidebarLayout(
      sidebarPanel(
        selectInput("district", "Choose a District",
                    c(1:49))
      ),
      mainPanel(
        plotOutput("pie_chart")
      )
    )
)

page_two <- navbarMenu(
    "Washington Voters",
    page_viz2,
    page_viz3
)

page_three <- tabPanel(
    "Conclusion",
    titlePanel("Conclusion"),
    p("The strengths of our project include teamwork,
    communication, and real-world problem solving.
      For instance, we feel that we chose a topic that
      can make a true difference, considering the
      fact that a lot of young adults lack political
      education. However, some weaknesses include the
      data sets we chose to work with and the questions
      we are trying to answer. We've learned that
      we should look at data sets before formulating
      questions. By looking at data sets beforehand,
      we can analyze and become curious about the data
      to form questions. We hope that in the future,
      someone can use what we found to motivate young
      adults and/or Washingtonians to vote more or keep
      doing a good job.")
)

page_four <- tabPanel(
    "About the Tech",
    titlePanel("About the Technology"),
    a("Technical Report", href = "https://github.com/hkwade/AA04/wiki"),
    p("We loaded all of data using .csv files. The major
    libraries that we used were shiny, dplyr, and
      ggplot. We organized our code for the app in a folder
      (AA04) located in the main project repository.
      Using statistical analysis, we will be able to visualize
      the Washington State voter turnout and the
      average United States voter turnout.")
)

page_five <- tabPanel(
    "About Us",
    titlePanel("About Us"),
    br(),
    h4("Raveena Rao"),
    h5("Intended Informatics"),
    h5("2023"),
    br(),
    h4("Precious Stowers"),
    h5("Intended Informatics"),
    h5("2023"),
    br(),
    h4("Hunter Wade"),
    h5("Intended Applied Computational & Mathematical Sciences"),
    h5("2023")
)



ui <- navbarPage(
    theme = shinytheme("flatly"),
    "Young Adult Voter Involvement",
    page_one,
    page_viz1,
    page_two,
    page_three,
    page_four,
    page_five
)
