library(shiny)
library(ggplot2)
library(palmerpenguins)
library(RColorBrewer)

ui <- fluidPage(

  # Application title
  titlePanel("Build a Scatter Plot"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      tags$style(".well {background-color:#91cded;}"),

      actionButton("go",
                   label = "Make plot",
                   style="color: #000; background-color: #fff; border-color: #2e6da4"),

      textInput("title",
                label = "Plot title",
                value = "My Awesome Scatter Plot"),
      textInput("xlab",
                label = "X-axis label",
                value = "Bill length (mm)"),
      textInput("ylab",
                label = "Y-axis label",
                value = "Bill width (mm)"),
      textInput("subtitle",
                label = "Subtitle",
                value = ""),


      sliderInput("xrange",
                  label = "X-axis range",
                  min = 0,
                  max = 100,
                  value = c(min(penguins$bill_length_mm, na.rm = TRUE),
                            max(penguins$bill_length_mm, na.rm = TRUE))),
      sliderInput("yrange",
                  label = "Y-axis range",
                  min = 0,
                  max = 50,
                  value = c(min(penguins$bill_depth_mm, na.rm = TRUE),
                            max(penguins$bill_depth_mm, na.rm = TRUE))),
      selectInput("colour",
                  label = "Colour by",
                  choices = c("Species" = "species",
                              "Island" = "island",
                              "Sex" = "sex"),
                  selected = "species"), # select none
      selectInput("shape",
                  label = "Shape by",
                  choices = c("Species" = "species",
                              "Island" = "island",
                              "Sex" = "sex"),
                  selected = "species"), # select none
      selectInput("size",
                  label = "Size by",
                  choices = c("Weight" = "body_mass_g",
                              "Flipper length" = "flipper_length_mm"),
                  selected = "Weight"), # select none
      selectInput("palette",
                  label = "Colour palette",
                  choices = c("Accent",
                              "Dark2",
                              "Paired",
                              "Pastel1",
                              "Pastel2",
                              "Set1",
                              "Set2",
                              "Set3"),
                  selected = "Set2"),
      selectInput("theme",
                  label = "Theme",
                  choices = c("Gray",
                              "BW",
                              "Linedraw",
                              "Light",
                              "Dark",
                              "Minimal",
                              "Classic",
                              "Void"),
                  selected = "Gray"),

      checkboxInput("bestfit",
                    label = "Add line of best fit"),
      checkboxInput("facet",
                    label = "Split by year"),
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("scatter_plot"),
      tags$figure(
        align = "center",
        tags$img(
          src = "penguins.png",
          width = 600,
          alt = "Cartoon of a chinstrap, gentoo and adelie penguin"
        ),
        tags$figcaption("Artwork by @allison_horst")
      )
    )
  )
)


# Define server logic required to draw a histogram
server = function(input, output) {

  # Create plot when action button is pressed
  gg_scatter = eventReactive(input$go, {
    g = penguins |>
      ggplot(aes(x = bill_length_mm,
                 y = bill_depth_mm)) +
      geom_point(aes_string(colour = input$colour,
                            size = input$size,
                            shape = input$shape)) +
      ggtitle(input$title) +
      xlab(input$xlab) +
      ylab(input$ylab) +
      xlim(input$xrange) +
      ylim(input$yrange[1], input$yrange[2]) +
      scale_color_brewer(palette = input$palette) +
      labs(caption = input$caption,
           subtitle = input$subtitle)


    # If facet
    if(input$facet) {
      g = g +
        facet_wrap(~year)
    }

    # If best fit
    if(input$bestfit) {
      g = g +
        geom_smooth(aes_string(colour = input$colour),
                    se = FALSE, method = "lm")
    }

    # If theme
    if(input$theme == "Gray") {
      g = g +
        theme_gray()
    } else if (input$theme == "BW") {
      g = g +
        theme_bw()
    } else if (input$theme == "Linedraw") {
      g = g +
        theme_linedraw()
    } else if (input$theme == "Light") {
      g = g +
        theme_light()
    } else if (input$theme == "Dark") {
      g = g +
        theme_dark()
    } else if (input$theme == "Minimal") {
      g = g +
        theme_minimal()
    } else if (input$theme == "Classic") {
      g = g +
        theme_classic()
    } else if (input$theme == "Void") {
      g = g +
        theme_void()
    }
    g
  })

  output$scatter_plot <- renderPlot({
    gg_scatter()
  })


}

# Run the application
shinyApp(ui = ui, server = server)
