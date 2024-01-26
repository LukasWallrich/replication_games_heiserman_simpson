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

# ==============================================================================
DF = read_dta("Documents/GitHub/replication_games_heiserman_simpson/reproduction_materials/combined data OSF.dta")
sjPlot::view_df(DF)
colnames(DF)

# [1] "method_tokens"         "students"              "cond"                  "study"                
# [5] "sample"                "s5_cond"               "s5_majority"           "s2_tokens_0"          
# [9] "s2_tokens_2"           "s2_tokens_4"           "s2_tokens_6"           "s2_tokens_8"          
# [13] "s2_tokens_10"          "s2_tokens_mean"        "s2_performance_slope"  "tokens"               
# [17] "ztokens"               "muchlower_score"       "lower_score"           "same_score"           
# [21] "higher_score"          "muchhigher_score"      "bonus_chance"          "performance_slope"    
# [25] "z_performance_slope"   "z_slope"               "slope"                 "score"                
# [29] "percent"               "numbersearches"        "ln_numbersearches"     "sqrt_numbersearches"  
# [33] "znumbersearches"       "z_ln_numbersearches"   "z_sqrt_numbersearches" "z_effort"             
# [37] "z_ln_effort"           "z_sqrt_effort"         "age"                   "gender"               
# [41] "woman_other"           "race"                  "nonwhite"              "educ"                 
# [45] "college"               "sses"                  "pol"                   "manage"               
# [49] "empstat"               "working"               "house_income"     

DF$study <- factor(DF$study)
DF$cond <- factor(DF$cond)

lm(z_effort ~ cond, data = DF, subset = (sample == 1 & study == 1)) %>% summary
lm(z_effort ~ cond, data = DF, subset = (sample == 1 & study == 2)) %>% summary
lm(z_effort ~ cond, data = DF, subset = (sample == 1 & study == 3)) %>% summary
lm(z_effort ~ cond, data = DF, subset = (sample == 1 & study == 4)) %>% summary
lm(z_effort ~ cond, data = DF, subset = (sample == 1 & study == 5)) %>% summary

cond_1 <- filter(DF, cond == 1)
cond_2 <- filter(DF, cond == 2)
cond_3 <- filter(DF, cond == 3)
# 394+394+395
# 1184
# table(DF$cond)
DF$cond %>% is.na %>% sum
# there is missing value in condition

# ------------------------------------------------------------------------------
# for study 1, find mean values for each condition
cond_1 %>%
  filter(study == 1) %>% 
  summarize(mean_z_effort = mean(z_effort, na.rm = TRUE)) %>%
  pull(mean_z_effort)
# 0.4662

cond_2 %>%
  filter(study == 1) %>% 
  summarize(mean_z_effort = mean(z_effort, na.rm = TRUE)) %>%
  pull(mean_z_effort)
# 0.02761

cond_3 %>%
  filter(study == 1) %>% 
  summarize(mean_z_effort = mean(z_effort, na.rm = TRUE)) %>%
  pull(mean_z_effort)

# ------------------------------------------------------------------------------
# similarly, for study 2
cond_1 %>%
  filter(study == 2) %>% 
  summarize(mean_z_effort = mean(z_effort, na.rm = TRUE)) %>%
  pull(mean_z_effort)
# 0.384

cond_2 %>%
  filter(study == 2) %>% 
  summarize(mean_z_effort = mean(z_effort, na.rm = TRUE)) %>%
  pull(mean_z_effort)
# 0.0969

cond_3 %>%
  filter(study == 2) %>% 
  summarize(mean_z_effort = mean(z_effort, na.rm = TRUE)) %>%
  pull(mean_z_effort)
# -0.463
# ------------------------------------------------------------------------------
# similarly, for study 3
cond_1 %>%
  filter(study == 3) %>% 
  summarize(mean_z_ln_effort = mean(z_ln_effort, na.rm = TRUE)) %>%
  pull(mean_z_ln_effort)
# 0.1734

cond_2 %>%
  filter(study == 3) %>% 
  summarize(mean_z_ln_effort = mean(z_ln_effort, na.rm = TRUE)) %>%
  pull(mean_z_ln_effort)
# 0.01306

cond_3 %>%
  filter(study == 3) %>% 
  summarize(mean_z_ln_effort = mean(z_ln_effort, na.rm = TRUE)) %>%
  pull(mean_z_ln_effort)
# -0.1859

# ------------------------------------------------------------------------------
# similarly, for study 4
cond_1 %>%
  filter(study == 4) %>% 
  summarize(mean_z_ln_effort = mean(z_ln_effort, na.rm = TRUE)) %>%
  pull(mean_z_ln_effort)
# 0.279

cond_2 %>%
  filter(study == 4) %>% 
  summarize(mean_z_ln_effort = mean(z_ln_effort, na.rm = TRUE)) %>%
  pull(mean_z_ln_effort)
# -0.02607

cond_3 %>%
  filter(study == 4) %>% 
  summarize(mean_z_ln_effort = mean(z_ln_effort, na.rm = TRUE)) %>%
  pull(mean_z_ln_effort)
# -0.2826

# ------------------------------------------------------------------------------
# similarly, for study 5
cond_1 %>%
  filter(study == 5) %>% 
  summarize(mean_z_ln_effort = mean(z_ln_effort, na.rm = TRUE)) %>%
  pull(mean_z_ln_effort)
# 0.1534

cond_2 %>%
  filter(study == 5) %>% 
  summarize(mean_z_ln_effort = mean(z_ln_effort, na.rm = TRUE)) %>%
  pull(mean_z_ln_effort)
# 0.02896

cond_3 %>%
  filter(study == 5) %>% 
  summarize(mean_z_ln_effort = mean(z_ln_effort, na.rm = TRUE)) %>%
  pull(mean_z_ln_effort)
# -0.1857