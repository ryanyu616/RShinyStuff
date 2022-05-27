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
    h1("My First App"),
    sliderInput(inputId = "number", label = "Choose Number", value = 25, 
                min = 1, max = 50),
    textInput(inputId = "title", label = "Title: ", 
              value = "Histogram of Random Normal"),
    actionButton(inputId = "go", label = "Update"),
    plotOutput(outputId = "histogram"),
    verbatimTextOutput(outputId = "stats")
)

# Define server
server <- function(input, output) {
    
    data <- eventReactive(input$go, {
        rnorm(input$number)
    })
    
    output$histogram <- renderPlot({
        hist(data(), main = isolate(input$title))
    })
    output$stats <- renderPrint({
        summary(data())
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

