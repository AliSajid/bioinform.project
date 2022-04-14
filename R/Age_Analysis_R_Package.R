#' processes age data in R and creates output. Results in Age distribution curve,
#' Categorized the age, and bar graph. Returns Age_cat as a value
#'
#' @param data is data.
#' @param Age is age.
#' @examples
#' Age_Analysis(data, Age)

#Defining function as Age_Analysis - takes data and age  processes it
Age_Analysis <- function(data){

  print(data)

  #############################################################################

  #Defining column 'Age_Cat' in Data frame
  #Using if else to classify ages into groups
  #starting with Age < 10, classify as '<10'
  #Continues through 100 - ending with group 99+
  Age_Cat <- ifelse(data$Age < 10, '<10',
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

  #Defining ggp as ggplot object with data equals data and aes is set to cat
  #and geom_bar used
  ggp <- ggplot(data = data,
                aes(x = Age_Cat)) +geom_bar()
  #Printing ggp
  print(ggp)

  #############################################################################

  #Returning data object
  return(data)

}
