#################
#UI for gambler's ruin simulation.
#################
library(shiny)
shinyUI(fluidPage(
  titlePanel("Gambler's Ruin"),
  sidebarLayout(
    sidebarPanel(
      h3("Inputs"),
      "Win probability",
      sliderInput("winp", "",
                  min = 0, max = 1, value = 0.5, 
                  step=0.05),
      br(),
      "Starting wealth:",
      sliderInput("startWealth", "",
                  min = 0, max = 80, value = 10),
      br(),
      "Wealth needed to win:",
      sliderInput("winWealth", "",
                  min = 0, max = 80, value = 20),
      br(),
      "Number of simulation runs:",
      sliderInput("runs", "",
                  min = 1, max = 50, value = 3),
      br(),
      br(),
      p(actionButton("run", label = "Run Simulation"), align = "center")
      
    ),
    mainPanel(
      h3("Results"),
      h5(textOutput("text1")),
      plotOutput("plot1", width="80%", height="600px")
      )
  )
  
))
