

library(shiny)


shinyServer(function(input, output) {

    output$developer_plot <- renderPlot({

        ggplot(game_sales) +
            aes(x = developer, y = sales, fill = developer) +
            geom_col(developer = input$developer) +
            theme(axis.text.x = element_text(angle = 90)) +
            scale_fill_discrete()

    })
    
    output$platform_plot <- renderPlot({
        
        ggplot(game_sales) +
            aes(x= platform, y = sales, fill = platform) +
            geom_col(platform = input$platform) +
            scale_fill_discrete()
    })
    
    output$genre_plot <- renderPlot({
        
        ggplot() +
            aes(x = genre, y = sales, fill = genre) +
            geom_col(genre = input$genre) +
            theme(axis.text.x = element_text(angle = 45)) +
            scale_fill_discrete()
    })

})
