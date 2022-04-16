library(gmodels)
library(survival)
library(ggplot2)
library(ggfortify)
library(lubridate)
library(survey)
library(survminer)
library(dplyr)


Survival_Analysis <- function(d1){

  d1$Dcdate <- dmy(d1$Dcdate)
  d1$Admdate <- dmy(d1$Admdate)
  d1$Timecalc = d1$Dcdate - d1$Admdate


  d1$Timecalc <- as.numeric(d1$Timecalc)
  d1 <- na.omit(d1)
  d1 <- subset(d1, Timecalc > 0)

  surv_object <- Surv(time = d1$Timecalc, event = d1$Death)

  fit1 <- survfit(surv_object ~ AdmitDX, data = d1)

  print(summary(fit1))

  ggsurvplot(fit1, data = d1, pval = TRUE)

  km_fit <- survfit(Death ~ Gender, data=d1)
  print(ggsurvplot(km_fit , data = d1, pval = TRUE))

  fit.coxph <- coxph(surv_object ~  Gender, data = d1)
  print(ggforest(fit.coxph, data = d1))

}













