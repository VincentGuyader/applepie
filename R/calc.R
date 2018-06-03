arrow <- function(n = 1) {
  matrix(runif(n = n * 2, min = 0, max = 1), ncol = 2)
}

in_circle <- function(coord = cbind(0, 0)) {
  coord[, 1] ** 2 + coord[, 2] ** 2 <= 1
}

estim_prop <- function(arrows, conf = 0.95) {

  in_circle <- in_circle(arrows)

  est <- binom::binom.confint(
    x = sum(in_circle),
    n = length(in_circle),
    methods = "exact",
    conf.level = conf
  )
  unlist(est)
}

to_string <- function(est) {
  sprintf("%s [%s ; %s]", est[["mean"]], est[["lower"]], est[["upper"]])
}

print_estim_pi <- function(est) {

  est <- 4 * est[c("mean", "lower", "upper")]

  digits <- round(-log10(est[["upper"]] - est[["lower"]])) + 2

  to_string(round(est, digits))
}

# in_circle(cbind(0, 1))
# estim_prop(arrow(100000))
# (arrows <- rbind(arrow(30), arrow(1), arrow(4), arrow(0)))
# (est <- estim_prop(arrows))
# print_estim_pi(est)
