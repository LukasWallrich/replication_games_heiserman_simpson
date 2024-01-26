rm(list=ls())

# set options
options(stringsAsFactors = F)         # no automatic conversion of factors
options("scipen" = 100, "digits" = 4) # suppress math annotation
options(max.print = 1000)               # print max 1000 results

library(haven)
library(ggplot2)
library(dplyr)
library(tidyr)
library(psych)
library(ltm)
library(nortest)
library(moments)

# ==============================================================================
DF <- read_dta("Documents/GitHub/replication_games_heiserman_simpson/reproduction_materials/manager survey data OSF.dta")

# JW - if we take the dataset as given, then the results are reproducible
# 8.1 Summary Statistics
variables <- c("warmth_cent", "comp_cent", "prefer_cent", "promote_bonus_cent", "hire_cent", "work_outcome_cent")
sapply(DF[variables], function(x) c(mean=mean(x, na.rm=TRUE), sd=sd(x, na.rm=TRUE), 
                                    skewness=skewness(x, na.rm=TRUE), kurtosis=kurtosis(x, na.rm=TRUE)))
# 8.2 t-Tests
lapply(DF[variables], ad.test)
lapply(DF[variables], function(x) t.test(x, mu = 0))

# Supplementary Table 26
# column 1
model1 <- lm(warmth_cent ~ age_cent + women_nonbin + nonwhite + college + 
                     income_cent + sses_cent + factor(manage_num) + pol_cent, data=DF)
summary(model1)

# column 2
model2<- lm(comp_cent ~ age_cent + women_nonbin + nonwhite + college + 
                     income_cent + sses_cent + factor(manage_num) + pol_cent, data=DF)
summary(model2)

# column 3
model3 <- lm(prefer_cent ~ age_cent + women_nonbin + nonwhite + college + 
              income_cent + sses_cent + factor(manage_num) + pol_cent, data=DF)
summary(model3)

# column 4
model4 <- lm(promote_bonus_cent ~ age_cent + women_nonbin + nonwhite + college + 
               income_cent + sses_cent + factor(manage_num) + pol_cent, data=DF)
summary(model4)

# column 5
model5 <- lm(hire_cent ~ age_cent + women_nonbin + nonwhite + college + 
               income_cent + sses_cent + factor(manage_num) + pol_cent, data=DF)
summary(model5)