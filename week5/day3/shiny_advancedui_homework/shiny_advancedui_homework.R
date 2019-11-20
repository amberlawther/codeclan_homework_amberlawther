
library(shiny)
library(shinyWidgets)
library(tidyverse)
library(CodeClanData)
library(styler)
library(shinydashboard)
library(shinythemes)


ui <- fluidPage(theme = shinytheme("superhero"),
    titlePanel("Five Country Medal Comparison"),
    
    sidebarLayout(
        sidebarPanel(
            radioButtons(inputId = "season",
                         label = tags$i("Summer or Winter Olympics?"),
                         choices = c("Summer", "Winter")
            ),
            
            radioButtons(inputId = "medal",
                         label = tags$i("Compare Which Medals?"),
                         choices = c("Gold", "Silver", "Bronze")
            )
        ),
        
        mainPanel(
            plotOutput("medal_plot"),
            
        tabsetPanel(
            tabPanel("Plot", plotOutput("plot")),
            tabPanel("Summary", verbatimTextOutput("summary")),
            tabPanel("Table", tableOutput("table"))
            
            
        )
        
        )
    )
)

server <- function(input, output) {
    
    
    output$medal_plot <- renderPlot({
        
        olympics_overall_medals %>%
            filter(team %in% c("United States",
                               "Soviet Union",
                               "Germany",
                               "Italy",
                               "Great Britain")) %>%
            filter(medal == input$medal) %>%
            filter(season == input$season) %>%
            ggplot() +
            aes(x = team, y = count, fill = medal) +
            geom_col() +
            scale_fill_manual(values = c(
                "Gold" = "#DAA520",
                "Silver" = "#C0C0C0",
                "Bronze" = "#CD7F32"))
        
        
        
    })
}

shinyApp(ui = ui, server = server)














