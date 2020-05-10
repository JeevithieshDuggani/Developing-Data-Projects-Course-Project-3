library(shiny)

shinyUI(fluidPage(

    titlePanel("Predict the price of diamonds"),

    sidebarLayout(
  
        sidebarPanel(
            
            helpText("Predict the price of your diamonds from their characteristics"),
            
            h3(helpText("Choose the characteristics of the diamond")),
            
            numericInput("carat", label = h4("Size of the diamond in carats"), step = 0.05, value = 1),
            
            radioButtons("cut", label = h4("Cut of the diamond"),
                         choices = list("Unknown" = "*", 
                                        "Fair" = "Fair", "Good" = "Good",
                                        "Very Good" = "Very Good", "Premium" = "Premium",
                                        "Ideal" = "Ideal")),
            
            radioButtons("color", label = h4("Color of the Diamond"), 
                        choices = list("Unknown" = "*", "D" = "D", "E" = "E",
                                       "F" = "F", "G" ="G",
                                       "H" = "H", "I" = "I",
                                       "J" = "J")),
            radioButtons("clarity", label = h4("Clarity of the Diamond"), 
                        choices = list("Unknown" = "*", "I1" = "I1", "SI2" = "SI2",
                                       "SI1" = "SI1", "VS2" = "VS2", "VS1" = "VS1",
                                       "VVS2" = "VVS2", "VVS1" = "VVS1", "IF" = "IF" ))
        ),
        
        mainPanel(
            plotOutput("diamondPlot"),
            h4("The Value of the diamond is predicted to be "),
            h3(textOutput("value"))
        )
    )
))
