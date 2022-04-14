Logsitic_Regresssion <- function(Data, Outcome, Input1){
  f <- substitute(glm(Outcome~Input1, data=Data, family=binomial))
  ff <- eval(f)
  print(summary(ff))
}
