
#' @import shiny
app_ui <- function() {
  fluidPage(
    titlePanel("Apple Pie"),
    # Sidebar with a slider input for number of bins
        fluidRow(
          column(width = 3,
        numericInput("nb",
                    "Number of arrows to shoot",
                    min = 1,
                    max = Inf,
                    value = 1),
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
