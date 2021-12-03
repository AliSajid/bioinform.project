#` Summarized_Diagnoses will summarize the by user selected covariate
#'
#' @param data is data.
#' @param Diganose is Diganose collumn
#' @param Covariate is covariate
#' @return returns Age object.
#' @examples
#' Summarized_Diagnoses_By_Covariate(Medical_Records,DX ,Gender)
#' Depends on dplyr, janenaustner, tidytext


library(dplyr)
library(janeaustenr)
library(tidytext)

Summarized_Diagnoses_By_Covariate <- function(Data, Diganoses, Covariate){

  x <- rlang::sym(quo_name(enquo(x)))
  y <- rlang::sym(quo_name(enquo(y)))

a <-  Data %>%
  group_by(!!x, !!y) %>%
  summarise(n = n())
print(a)
write.csv(a, file = 'Summarized_Data.csv', row.names=FALSE)

}
