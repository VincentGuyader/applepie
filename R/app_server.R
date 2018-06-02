#' @import shiny
#' @importFrom graphics hist
#' @importFrom stats rnorm
#'
app_server <- function(input, output,session) {

  if ( app_prod() ){message("prod mode")}else{message("dev mode")}

  data <- reactiveValues(fleche=NULL#matrix(ncol=2)
                 )

  observeEvent(input$shoot,{
    data$fleche <- rbind(data$fleche,arrow(input$nb))
    })
  observeEvent(input$reset,{
    data$fleche <- NULL
    })

  output$bouclier <- renderPlot({
    #req(data$fleche)
impact(data$fleche)
    })
output$estim <- renderText({
req(data$fleche)
  paste("pi estimation : ",estim_pi(data$fleche))
})
output$nb_arrow <- renderText({
req(data$fleche)
  paste("Number of arrows : ",nrow(data$fleche))
})

output$source <- renderImage({
  outfile <- system.file("www","source.png",package = "applepie")


  list(src = outfile,
       contentType = 'image/png',
       width = 680,
       height = 820,
       alt = "")
}, deleteFile = FALSE)

}
