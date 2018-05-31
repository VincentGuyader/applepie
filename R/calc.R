arrow <- function(n=1){
  matrix(runif(n=n*2,min = 0,max = 1),ncol=2)
}

in_circle <- function(coord=c(0,0)){
 oord[1]**2 + coord[2]**2 <= 1
}

estim_pi <- function(arrows){
  sum(apply(arrows,MARGIN = 1,FUN=in_circle))/nrow(arrows)*4
}

estim_pi(arrow(100000))
