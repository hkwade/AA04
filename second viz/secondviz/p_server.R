#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$value <- renderText({ 
        input$wa_state_df })
        
    output$barchart <- renderPlotly({
        
          plot_ly(wa_state_df, x = wa_state_df$legislative_dist, y = wa_state_df[, input$age], type = 'bar',
                     marker = list(color = 'rgb(158,202)',
                                   line = list(color = 'rgb(8,48)',
                                               width = 1.5))) %>%
            layout(title = "Votes per legislative district",
                   xaxis = list(title = "Legislative district"),
                   yaxis = list(title = "number of votes"))
    }) 
    
    # output$value <- renderText({
    #     input$wa_state_df})
    
    # output$piechart <- renderPlotly({
    #     
    # plot_ly(wa_state_df, labels = colnames(wa_state_df[2:7]), values = wa_state_df[input$age], type = 'pie') %>%
    #     layout(title = 'United States Personal Expenditures by Categories in 1960',
    #            xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
    #            yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    # })
})
