#This is a changegg
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI
ui <- fluidPage(
    sliderInput(inputId = "number", label = "Choose Number", value = 25, 
                min = 1, max = 50),
    plotOutput(outputId = "histogram")
)

# Define server
server <- function(input, output) {
    output$histogram <- renderPlot({
        hist(rnorm(input$number), main = "Random Histogram")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

