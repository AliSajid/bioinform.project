# Cross Tables and Odds Ratio
#
#This function inputs two categorical variables and creates a cross tables
#with odds ratio
#function will output cross table
#Relies on gmodels


library(gmodels)
Cross_Tables_AND_Odds_Ratio<- function(data, x,y){
  x <- rlang::sym(quo_name(enquo(x)))
  y <- rlang::sym(quo_name(enquo(y)))
  print(CrossTable(x, y, expected = TRUE, format = 'SAS'))
}
