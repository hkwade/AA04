#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

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
    "Viz 1"
)

page_viz2 <- tabPanel(
    "Viz 2"
)

page_viz3 <- tabPanel(
    "Viz 3"
)

page_two <- navbarMenu(
    "Visualizations",
    page_viz1,
    page_viz2,
    page_viz3
    
)

page_three <- tabPanel(
    "Conclusion",
    titlePanel("Conclusion")
)

page_four <- tabPanel(
    "About the Tech",
    titlePanel("About the Technology")
    
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
    "Young Adult Political Involvement",
    page_one,
    page_two,
    page_three,
    page_four,
    page_five
)