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
    sidebarLayout(
      sidebarPanel(
        p("INFO-201A: Technical Foundations of Informatics"),
        p("The Information School"),
        p("University of Washington"),
        p("Autumn 2019")
      ),
      mainPanel(
        h3("Background"),
        p("Today's young adults are frequently becoming more active, although
          they still lack knowledge about today's overall political
          environment. We will use our knowledge and data to advocate for more
          credible knowledge to take light over social media's misinformation
          and technological propaganda. The direct stakeholders are the
          politicians and young adults, while the indirect stakeholders are the
          children and the other countries. The setting of the problem is the
          political atmosphere within the U.S. Some values and tensions that
          are in play are the liberal and conservative ideologies. Some policy
          and ethic elements that exist within this situation are the U.S. laws
          and bills that are passed. There is a lack of political involvement
          within generations across the U.S. We are specifically considered
          about the involvement within our own demographic: young adults."),
        p("Although the United States is ruled by a democracy, political
          involvement is at a low. According to our observations, our
          generation is extremely competent at voicing their opinions; however,
          voter turnout is still low. People show discontent with an election
          outcome, yet they never participate in the election in the first
          place.We will address this problem by focusing on the young adult
          voter population for the Democratic, Republican, and smaller third
          parties. Our consensus will be based on a comparison of young adult
          voter turnout to the voter turnout of older age groups. We will also
          look at how young adult voter turnout has changed over time."),
        h3("Research Questions"),
        p("How do the voting statistics for Washington state compare to the
          statistics for the United States as a whole?"),
        p("What are the voting statistics for Washington state?")
      )
    )

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
        plotOutput("bargraph"),
        h3("Analysis"),
        p("Compared to the United States as a whole, Washington residents
          tend to be more active participants in the voting process. Data
          from this graph shows that, on average, the United States has a
          48% voter turnout, whie Washington has a 55% voter turnout. This
          implies that Washington residents are more involved in politics and
          presidential elections than the United States as a whole.")
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
        plotlyOutput("barchart"),
        h3("Analysis"),
        p("Q. Between the ages 18-24, what is the total number of votes for
          District 36 (King County)?"),
        p("A. 6,800"),
        p("Q. Between the ages 35-44, what is the total number of voters for
          District 36 (King County)?"),
        p("A. 23,989"),
        p("This bar graph shows that there is a lack of political involvement
          within the younger generation of adults. There is a large gap between
          18-24 year olds, typical college students, and 35-44 year olds,
          typical parents, which shows a generational gap in political
          involvement.")
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
        plotOutput("pie_chart"),
        h3("Analysis"),
        p("When looking at the proportion of 18-24 year old voters in
          Washington,
          it is the smallest regardless of district. On the other hand, the
          proportion of 65+ year old voters is consistently the largest. The
          proportion of voters for a particular age group tends to increase
          as the age of voters gets larger. This may show that an interest in
          political involvement grows with age.")
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
    h3("Why the gap? What does this mean?"),
    p("By looking at all the graphs, one can see that there is a lack of
      political involvement within the younger generation of adults. The
      average number of voters in the 18-24 year old range is consistently
      lower than the average number of older ages."),
    h3("Possible causes of this gap?"),
    p("There are many reasons as to why this gap exists. While we cannot
      predict all of them, some of them include:"),
    p(" - the lack of accurate information about upcoming candidates"),
    p(" - not knowing where to start voting research"),
    p(" - not knowing how to register to vote"),
    p(" - not knowing where to turn in the ballot"),
    p(" - lack of time to research and vote"),
    h3("How can we improve?"),
    p("We can start by educating the younger population, starting in high
      school. Young adults need to be educated on the differences between
      accurate and false information on the internet. There should also be
      greater emphasis, in general, on where one can register and turn in
      ballots."),
    h3("Predictions for the Future?"),
    p("Young adults are currently on track to increasing their political
      involvement. Washington is increasingly voting more than the United
      States as a whole, meaning the gap among the state and the country
      could continue to get larger."),
    h3("Overivew"),
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
    sidebarLayout(
      sidebarPanel(
        a("Technical Report", href = "https://github.com/hkwade/AA04/wiki"),
      ),
      mainPanel(
        p("We loaded all of data using .csv files. The major
      libraries that we used were shiny, dplyr, and
      ggplot. We organized our code for the app in a folder
      (AA04) located in the main project repository.
      Using statistical analysis, we will be able to visualize
      the Washington State voter turnout and the
      average United States voter turnout.")
      )
    )
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
