#################
#UI for gambler's ruin simulation.
#################
library(shiny)
source("gambler_ruin_FUNC.R")

#Runs a number of iterations of gambler's ruin and displays the results.
#Results only change when 'run' button is pressed, not when sliders are changed.
shinyServer(
  function(input, output) {
    #Creates a set of simulation sims results when 'run' button is pressed
     results <- reactive({
       input$run
       simRuinFullMultiple(input$startWealth, input$winWealth, input$winp, input$runs)
     })
     #Draws plot of all runs
    output$plot1 <- renderPlot({
      input$run
      isolate(plotResultsList(results(), input$winWealth))
    })
     #Gives the number and percentage of wins
     output$text1 <- renderText({
       input$run
       isolate({
         win <- getWinRate(results(), input$winWealth)
         runs <- length(results())
         winNum <- round(win * runs, 0)
         paste("Win percentage: ", round(win * 100, 1), "% ", sep="",
               "(", winNum, " out of ", runs, ")")
       })
       
     })
  }
)
