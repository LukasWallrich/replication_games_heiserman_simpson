rm(list=ls())

# set options
options("scipen" = 100, "digits" = 4) # suppress math annotation
options(max.print = 1000)               # print max 1000 results

library(haven)
library(ggplot2)
library(dplyr)
library(tidyr)
library(lme4)
library(margins)
library(ggplot2)
library(broom)
library(mediation)
library(lavaan)

# ==============================================================================
DF = read_dta("~/Documents/GitHub/replication_games_heiserman_simpson/reproduction_materials/combined data OSF.dta")
sjPlot::view_df(DF)
colnames(DF)

# create a copy of the data
DF_c = DF

# remove missing values in column cond
DF = DF[complete.cases(DF$cond),]

DF3 <- DF %>% filter(!is.na(cond) & !is.na(z_performance_slope) & !is.na(znumbersearches))

mediator_model <- lm(z_performance_slope ~ cond, data = DF3)

outcome_model <- lm(z_effort ~ cond + z_performance_slope, data = DF3)

med_analysis <- mediate(mediator_model, outcome_model, 
                        treat = "cond", mediator = "z_performance_slope",
                        robustSE = TRUE, sims = 5000) 

summary(med_analysis)
summary(mediator_model)
summary(outcome_model)