
#' @import shiny
app_ui <- function() {
  fluidPage(
    titlePanel("Apple Pie"),
    # Sidebar with a slider input for number of bins
    fluidRow(
      column(width = 3,
             numericInput("nb",
                          "Number of arrows to shoot",
                          min = 2,
                          max = Inf,
                          value = 100),
             numericInput("conf",
                          "Confidence interval in %",
                          min = 50,
                          max = 99.5,
                          value = 95,
                          step = 0.05),
             numericInput("nmax",
                          "Maximum number of arrows to plot",
                          min = 1000,
                          max = 100e3,
                          value = 20e3,
                          step = 1000),
             actionButton("shoot","shoot"),
             actionButton("reset","reset"))
      ,      column(width = 9,
                    plotOutput("bouclier"),
                    textOutput("nb_arrow"),
                    textOutput("estim"),
                    tags$a(href="https://www.smbc-comics.com/comic/math-and-war","source",target="blank_")
      )

    ),
    imageOutput("source")
  )
}
