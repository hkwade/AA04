#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source('source.R')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$line_graph <- renderPlot({

        # generate line graph
        ggplot(data = new_df_two, 
                             aes(x = input$obs, y = Turnout.Rates, group = 1)) +
            geom_line(color = "BLACK") +
            geom_point() +
            ggtitle("Average Turnout Rates Per Year in America") +
            theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
            geom_vline(xintercept = input$obs) 
    })
    output$washington_bar_graph <- renderPlot({
        
        #generate bar graph
        ggplot(wa_state_df) + 
            geom_col(mapping = aes(x = legislative_dist, y = eighteen_to_twenty_four))
    })
    
})
