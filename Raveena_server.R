# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source('source.R')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$selects<- renderPrint({ 
        input$selects
    })
    output$bar_graph2 <- renderPlot({
        
        # generate bar graph
        ggplot(the_df(input$selects)) +
            geom_col(aes(x = State, y = Turnout.Rates, fill = State)) +
            theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
            labs(
                title = "Average Turnout Rates Per Year in America",
                x = "State",
                y = "Turnout Rates"
            ) 
    })
})
