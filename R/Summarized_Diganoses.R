library(dplyr)
library(janeaustenr)
library(tidytext)

Summarized_Diagnoses <- function(Data, x, y){
if(missing(y)){
  x <- rlang::sym(quo_name(enquo(x)))

  a <-  Data %>%
    group_by(!!x) %>%
    summarise(n = n())
  print(a)
  write.csv(a, file = 'Summarized_Diagnoses.csv', row.names=FALSE)
}else{
      x <- rlang::sym(quo_name(enquo(x)))
      y <- rlang::sym(quo_name(enquo(y)))

      a <-  Data %>%
        group_by(!!x, !!y) %>%
        summarise(n = n())
      print(a)
      write.csv(a, file = 'Summarized_Data.csv', row.names=FALSE)

}}

