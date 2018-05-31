
#' @import shiny
app_ui <- function() {
  fluidPage(
    titlePanel("Apple Pie"),
    # Sidebar with a slider input for number of bins
    sidebarLayout(
      sidebarPanel(
        numericInput("nb",
                    "Number of arrows to shoot",
                    min = 1,
                    max = Inf,
                    value = 1)
      ,
      actionButton("shoot","shoot"),
      actionButton("reset","reset")),

      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("bouclier"),
        textOutput("estim")
      )
    )
  )
}
