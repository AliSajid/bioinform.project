library(ggplot2)

Barplot <- function(data, x.var){
  x.var <- rlang::sym(quo_name(enquo(x.var)))
  ggp <- ggplot(data = dat,
                aes(x = !! x.var)) +
    geom_bar()
  return(ggp)
}
