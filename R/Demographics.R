Demographics <- function(data, Age, Gender, Race, Ethnicity){
  #############################################################################
  if(missing(Age)){
    1
  }else{
  Age <- rlang::sym(quo_name(enquo(Age)))
  ggp <- ggplot(data = data,
                aes(x = !! Age)) +
    geom_density(color = 'darkblue', fill = 'lightblue') +
    ggtitle("Age Distribution")

  print(ggp)}
  #############################################################################

  Gender <- rlang::sym(quo_name(enquo(Gender)))
  ggp <- ggplot(data = data, aes(x = !! Gender), fill = as.factor(Gender)) +
    geom_bar(color="blue", fill=rgb(0.1,0.4,0.5,0.7))
  print(ggp)

  ############################################################################

  Race <- rlang::sym(quo_name(enquo(Race)))
  ggp <- ggplot(data = data, aes(x = !! Race), fill = as.factor(Race)) +
    geom_bar(color="blue", fill=rgb(0.1,0.4,0.5,0.7))
  print(ggp)

  ############################################################################

  Ethnicity <- rlang::sym(quo_name(enquo(Ethnicity)))
  ggp <- ggplot(data = data, aes(x = !! Ethnicity), fill = as.factor(Ethnicity)) +
    geom_bar(color="blue", fill=rgb(0.1,0.4,0.5,0.7))
  print(ggp)

  ############################################################################
}

