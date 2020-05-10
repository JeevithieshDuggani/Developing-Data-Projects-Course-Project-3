library(shiny)
library(ggplot2)
library(dplyr)

diamond <- diamonds[c(1:4,7)]

# Define server logic required to draw a plot
shinyServer(function(input, output) {
    output$diamondPlot <- renderPlot({
        # select diamonds depending of user input
        diamond <- filter(diamonds, 
                          grepl(input$cut, cut), grepl(input$color, color), grepl(input$clarity, clarity))
        # build linear regression model
        fit <- lm( price ~ carat, diamond)
        # predicts the price 
        predR <- predict(fit, newdata = data.frame(carat = input$carat, cut = input$cut,
                                                   color = input$color, clarity = input$clarity))
        # Drow the plot using ggplot2
        graph <- ggplot(data = diamond, aes(x = carat, y = price))
        graph <- graph + geom_point(aes(color = cut), alpha = 0.1) + geom_smooth(method = "lm")
        graph <- graph + geom_vline(xintercept = input$carat, color = "olivedrab") 
        graph <- graph + geom_hline(yintercept = predR, color = "darkblue")
        graph
    })
    output$value <- renderText({
        # renders the text for the prediction below the graph
        diamond <- filter(diamonds, 
                          grepl(input$cut, cut), grepl(input$color, color), grepl(input$clarity, clarity))
        fit <- lm(price ~ carat, diamond)
        pred <- predict(fit, newdata = data.frame(carat = input$carat,
                                                  cut = input$cut,
                                                  color = input$color,
                                                  clarity = input$clarity))
        value <- paste("SGD", round(pred, digits = 4))
        value
    })
})