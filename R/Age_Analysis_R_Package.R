# Age Analysis
#
# This function process Age data in the medical records. It draws an age
# distribution graph, categorizes the ages, generates bars of the ages,
# and returns Age Categorization
#
#To use this function you need to input the medical record data and age column
#
#This function depends on ggplot2

#' @param data is data.
#' @param Age is Age.
#' @return returns Age object.
#' @examples
#' Age_Analysis(1, 1)


Age_Analysis <- function(data, Age){
  #############################################################################
  Age <- rlang::sym(quo_name(enquo(Age)))
  ggp <- ggplot(data = data,
                aes(x = !! Age)) +
    geom_density(color = 'darkblue', fill = 'lightblue') +
    ggtitle("Age Distribution")

  print(ggp)
  #############################################################################

    data$Age_Cat <- ifelse(data$Age < 10, '<10',
                    ifelse(data$Age < 20, '10-19',
                    ifelse(data$Age < 30, '20-29',
                    ifelse(data$Age < 40, '30-39',
                    ifelse(data$Age < 50, '40-49',
                    ifelse(data$Age < 60, '50-59',
                    ifelse(data$Age < 70, '60-69',
                    ifelse(data$Age < 80, '70-79',
                    ifelse(data$Age < 90, '80-89',
                    ifelse(data$Age < 100, '90-100', '99+'))))))))))



  #############################################################################

  data <- Age_Catergorization(data)
  ggp <- ggplot(data = data,
                aes(x = Age_Cat)) +
    geom_bar()
  print(ggp)

  #############################################################################

  return(data)

}
