#' @import ggforce
#' @import ggplot2
bouclier <- function(){
  ggplot() +
  geom_circle(aes(x0=0.5, y0=0.5, r=0.5))+
  coord_fixed()+
  geom_segment(aes(x = 0, y = 0, xend = 0, yend = 1))+
  geom_segment(aes(x = 1, y = 0, xend = 1, yend = 1))+
  geom_segment(aes(x = 0, y = 1, xend = 1, yend = 1))+
  geom_segment(aes(x = 1, y = 0, xend = 0, yend = 0))+
  theme(line = element_blank(),
        rect = element_rect(fill = NA, size = 12, colour = NA, linetype = 0),
        panel.background = element_rect(fill = NA),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        strip.background = element_blank())
}



impact <- function(arrows, nmax_plot = 20e3, color="red"){

  if (is.null(arrows)) {
    bouclier()
  } else {
    n <- min(nrow(arrows), nmax_plot)
    bouclier() +
      geom_point(aes(x, y), color = color,
                 data = setNames(data.frame(arrows[seq_len(n), ]), c("x", "y")))
  }
}

# impact(arrows = arrow(100))
