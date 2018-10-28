library(shiny)

source("compute_gale_shapley_names.R")
#gs <- compute_gale_shap(3)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Rhian's Tinder"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("n",
                     "Number of couples:",
                     min = 3,
                     max = 10, 
                     value = 3),
         actionButton("goButton", "Go!")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        
        tabsetPanel(type = "tabs",
                    tabPanel("Preferences", tableOutput("m_pref"), tableOutput("w_pref")),
                    tabPanel("Dating", verbatimTextOutput("story")),
                    tabPanel("Final Matching", tableOutput("matching"))
        )
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  gs <- eventReactive(input$goButton, {
   gs <-  compute_gale_shap(input$n)
  })

   output$m_pref <- renderTable({
    gs()$m_pref
   }, digits = 0, rownames = TRUE)
   
   output$w_pref <- renderTable({
     gs()$w_pref
   }, digits = 0, rownames = TRUE)
   
   output$story <- renderText({
     gs()$story
   })
   
   output$matching <- renderTable({
     gs()$matching
   }, digits = 0)
   
}

# Run the application 
shinyApp(ui = ui, server = server)

