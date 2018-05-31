#' run the Shiny Application
#'
#'
#' @export
#' @importFrom shiny shinyApp
#'
#' @examples
#'
#' if (interactive()) {
#'
#'   applepie()
#'
#' }
#'
applepie <- function() {
  shinyApp(ui = app_ui(), server = app_server)
}
