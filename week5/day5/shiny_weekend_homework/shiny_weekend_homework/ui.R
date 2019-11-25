

library(shiny)
library(tidyverse)
library(CodeClanData)
library(wesanderson)
library(viridis)
library(ggthemes)
library(shinythemes)


shinyUI(fluidPage(

    
    titlePanel("Video Game Sales"),

    
    sidebarLayout(
        sidebarPanel(
            selectInput("developer",
                        "Which Developer?",
                        choices = unique(game_sales$developer)),
            
            selectInput("platform",
                        "Which Platform?",
                        choices = unique(game_sales$platform)),
            
            selectInput("genre",
                        "Which Genre?",
                        choices = unique(game_sales$genre))
        ),

        
        mainPanel(
            plotOutput("developer_plot"),
            plotOutput("platform_plot"),
            plotOutput("genre_plot")
                       
        )
    )
))
