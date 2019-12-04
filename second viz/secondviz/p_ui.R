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
shinyUI(fluidPage(

    # Application title
    titlePanel("viz 2"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("age", "age ranges", 
                       choices = colnames(wa_state_df[2:7])),
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotlyOutput("barchart"),
            plotlyOutput("piechart")
        )
    )
))
