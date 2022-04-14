library(ggplot2)

Line_Graph <- function(Data){
  p <- ggplot(Data, aes(x=X, y=Y)) +
    geom_point(shape=1) +
    geom_smooth(method=lm) +
    theme_bw()

  print(p)

  a <- lm(Y ~ X)

  print(summary(a))
}



