#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source("source.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$bargraph <- renderPlot({

        # generate line graph
        ggplot(the_df(input$selects)) +
            geom_col(aes(x = State, y = Turnout.Rates)) +
            theme(axis.text.x = element_text(angle = 60, hjust = 1)) +
            labs(
                title = "Average Turnout Rates Per Year in America",
                x = "State",
                y = "Turnout Rates"
            )

    })
    output$barchart <- renderPlotly({
        input$wa_state_df

        #generate bar graph
        plot_ly(wa_state_df, x = wa_state_df$legislative_dist,
                y = wa_state_df[, input$age], type = "bar",
                marker = list(color = "rgb(158,202)",
                              line = list(color = "rgb(8,48)",
                                          width = 1.5))) %>%
            layout(title = "Votes per Legislative District",
                   xaxis = list(title = "Legislative District"),
                   yaxis = list(title = "Number of Votes"))
    })

    output$pie_chart <- renderPlot({

       pie(as.numeric(final_df[, input$district]),
           label = row.names(final_df)) +
            title("Proportion of Voters by Age")

    })

})
