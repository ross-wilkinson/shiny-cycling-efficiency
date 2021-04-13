library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Extrapolating metabolic efficiency to cycling performance"),
    withMathJax(),
    # Sidebar with a slider input for power output 
    sidebarLayout(
        sidebarPanel(
          h4("Rider 1: Variables"),
          numericInput("grossEfficiency",
                       "Gross efficiency (%):",
                       min = 0,
                       max = 100,
                       value = 25),
          numericInput("windVelocity",
                       "Wind velocity (m/s):",
                       min = 0,
                       max = 1000,
                       value = 2.94),
          numericInput("groundVelocity",
                       "Ground velocity (m/s):",
                       min = 0,
                       max = 1000,
                       value = 8.36),
          numericInput("airDensity",
                       "Air density (kg/m\\(^{3}\\)):",
                       min = 0,
                       max = 2,
                       value = 1.2),
          numericInput("cda",
                       "CdA:",
                       min = 0,
                       max = 1,
                       value = 0.2565),
          numericInput("windDirection",
                       "Wind direction (degrees):",
                       min = 0,
                       max = 360,
                       value = 340),
          numericInput("rideDirection",
                       "Ride direction (degrees):",
                       min = 0,
                       max = 360,
                       value = 310),
          numericInput("dragFactor",
                       "Spoke drag factor:",
                       min = 0,
                       max = 1,
                       value = 0.0044),
          numericInput("gravity",
                       "Gravity (m/s\\(^{2}\\)):",
                       min = -100,
                       max = 0,
                       value = -9.81),
          numericInput("riderMass",
                      "Rider mass (kg):",
                      min = 0,
                      max = 1000,
                      value = 80),
          numericInput("bicycleMass",
                      "Bicycle mass (kg):",
                      min = 0,
                      max = 1000,
                      value = 10),
          numericInput("gradient",
                       "Gradient (%):",
                       min = 0,
                       max = 1000,
                       value = 2.94),
          numericInput("mu",
                       "Coefficient of rolling resistance:",
                       min = 0,
                       max = 1,
                       value = 0.0033),
        ),
        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a plot
server <- function(input, output) {
    output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2]
      bins <- seq(min(x), max(x), length.out = input$power + 1)

      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
