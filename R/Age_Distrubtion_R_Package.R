Age_Analysis <- function(data, Age){
  #############################################################################
  Age <- rlang::sym(quo_name(enquo(Age)))
  ggp <- ggplot(data = data,
                aes(x = !! Age)) +
    geom_density(color = 'darkblue', fill = 'lightblue') +
    ggtitle("Age Distribution")

  print(ggp)
  #############################################################################


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

  return(data)

  #############################################################################

  data <- Age_Catergorization(data)
  ggp <- ggplot(data = data,
                aes(x = Age_Cat)) +
    geom_bar()
  print(ggp)

  #############################################################################



}
