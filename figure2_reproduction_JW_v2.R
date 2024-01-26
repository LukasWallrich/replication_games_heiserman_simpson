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

# ==============================================================================
# for study 1
# comparing condition 2 and 1
z_effort_cond1 <- cond_1 %>% 
  filter(study == 1) %>% 
  pull(z_ln_effort)

z_effort_cond2 <- cond_2 %>% 
  filter(study == 1) %>% 
  pull(z_effort)

t_test_result21 <- t.test(z_effort_cond1, z_effort_cond2, na.rm = TRUE)

t_test_result21$p.value # 0.0921

# ------------------------------------------------------------------------------
# comparing condition 3 and 1
z_effort_cond1 <- cond_1 %>% 
  filter(study == 1) %>% 
  pull(z_ln_effort)

z_effort_cond3 <- cond_3 %>% 
  filter(study == 1) %>% 
  pull(z_effort)

t_test_result31 <- t.test(z_effort_cond1, z_effort_cond3, na.rm = TRUE)

t_test_result31$p.value # 0.000166

# ==============================================================================
# for study 2
# comparing condition 2 and 1
z_effort_cond1 <- cond_1 %>% 
  filter(study == 2) %>% 
  pull(z_effort)

z_effort_cond2 <- cond_2 %>% 
  filter(study == 2) %>% 
  pull(z_effort)

t_test_result21 <- t.test(z_effort_cond1, z_effort_cond2, na.rm = TRUE)

t_test_result21$p.value # 0.2316

# ------------------------------------------------------------------------------
# comparing condition 3 and 1
z_effort_cond1 <- cond_1 %>% 
  filter(study == 2) %>% 
  pull(z_effort)

z_effort_cond3 <- cond_3 %>% 
  filter(study == 2) %>% 
  pull(z_effort)

t_test_result31 <- t.test(z_effort_cond1, z_effort_cond3, na.rm = TRUE)

t_test_result31$p.value # 0.001611

# ==============================================================================
# for study 3
# comparing condition 2 and 1
z_ln_effort_cond1 <- cond_1 %>% 
  filter(study == 3) %>% 
  pull(z_ln_effort)

z_ln_effort_cond2 <- cond_2 %>% 
  filter(study == 3) %>% 
  pull(z_ln_effort)

t_test_result21 <- t.test(z_ln_effort_cond1, z_ln_effort_cond2, na.rm = TRUE)

t_test_result21$p.value # 0.0921

# ------------------------------------------------------------------------------
# comparing condition 3 and 1
z_ln_effort_cond1 <- cond_1 %>% 
  filter(study == 1) %>% 
  pull(z_ln_ln_effort)

z_ln_effort_cond3 <- cond_3 %>% 
  filter(study == 1) %>% 
  pull(z_ln_effort)

t_test_result31 <- t.test(z_ln_effort_cond1, z_ln_effort_cond3, na.rm = TRUE)

t_test_result31$p.value # 0.000166

# ==============================================================================
# for study 4
# for study 1
# comparing condition 2 and 1
z_ln_effort_cond1 <- cond_1 %>% 
  filter(study == 1) %>% 
  pull(z_ln_ln_effort)

z_ln_effort_cond2 <- cond_2 %>% 
  filter(study == 1) %>% 
  pull(z_ln_effort)

t_test_result21 <- t.test(z_ln_effort_cond1, z_ln_effort_cond2, na.rm = TRUE)

t_test_result21$p.value # 0.0921

# ------------------------------------------------------------------------------
# comparing condition 3 and 1
z_ln_effort_cond1 <- cond_1 %>% 
  filter(study == 1) %>% 
  pull(z_ln_ln_effort)

z_ln_effort_cond3 <- cond_3 %>% 
  filter(study == 1) %>% 
  pull(z_ln_effort)

t_test_result31 <- t.test(z_ln_effort_cond1, z_ln_effort_cond3, na.rm = TRUE)

t_test_result31$p.value # 0.000166

# ==============================================================================
# for study 5
# for study 1
# comparing condition 2 and 1
z_ln_effort_cond1 <- cond_1 %>% 
  filter(study == 1) %>% 
  pull(z_ln_ln_effort)

z_ln_effort_cond2 <- cond_2 %>% 
  filter(study == 1) %>% 
  pull(z_ln_effort)

t_test_result21 <- t.test(z_ln_effort_cond1, z_ln_effort_cond2, na.rm = TRUE)

t_test_result21$p.value # 0.0921

# ------------------------------------------------------------------------------
# comparing condition 3 and 1
z_ln_effort_cond1 <- cond_1 %>% 
  filter(study == 1) %>% 
  pull(z_ln_ln_effort)

z_ln_effort_cond3 <- cond_3 %>% 
  filter(study == 1) %>% 
  pull(z_ln_effort)

t_test_result31 <- t.test(z_ln_effort_cond1, z_ln_effort_cond3, na.rm = TRUE)

t_test_result31$p.value # 0.000166

# ==============================================================================













# ==============================================================================
# for 
# calculate mean and get the 95% confidence interval
result5_1 <- cond_1 %>%
  filter(study == 5) %>%
  summarize(mean = mean(z_ln_effort, na.rm = TRUE),
            lower_ci = t.test(z_ln_effort, conf.level = 0.95)$conf.int[1],
            upper_ci = t.test(z_ln_effort, conf.level = 0.95)$conf.int[2],
            .groups = 'drop') 

print(result5_1)

