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

colnames(DF)
# [1] "warm"               "trustworthy"        "friendly"           "honest"             "likeable"          
# [6] "sincere"            "competent"          "intelligent"        "skilled"            "efficient"         
# [11] "assertive"          "confident"          "warmth"             "warmth_cent"        "zwarmth"           
# [16] "comp"               "comp_cent"          "zcomp"              "prefer"             "prefer_cent"       
# [21] "zprefer"            "promote_bonus"      "promote_bonus_cent" "zpromote_bonus"     "hire"              
# [26] "hire_cent"          "zhire"              "work_outcome_cent"  "age"                "age_cent"          
# [31] "gender"             "gender_3_text"      "women_nonbin"       "race"               "race_7_text"       
# [36] "race_8_text"        "hisp"               "racev2"             "nonwhite"           "educ"              
# [41] "college"            "empstat"            "occ"                "working"            "manage"            
# [46] "manage_num"         "income"             "income_cent"        "sses"               "sses_cent"         
# [51] "polsoc"             "polecon"            "pol"                "pol_cent"           "blue_advantage"   

# warmth (warm, trustworthy, friendly, honest, likeable, sincere, α = 0.90) 
# competence (competent, intelligent, skilled, efficient, assertive, confident, α = 0.88)
cronbach.alpha(DF[, c(1:6)])$alpha # 0.9036
cronbach.alpha(DF[, c(7:12)], na.rm = T)$alpha # 0.8813
# there are missing values, I realized this when I computed α

# from now on, I will create variables ending with "_r" to check if they produced/processed variables correctly.
DF$warmth_r = rowMeans(DF[, c(1:6)], na.rm = T)
# DF$warmth_sum = rowSums(DF[, c(1:6)], na.rm = TRUE)
# DF$warmth_r - DF$warmth_sum/6






# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DF$warmth_r - DF$warmth
# there is a discrepancy between the one I computed by myself and the one provided.
# PEER REVIEW NEEDED

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++






DF$comp_r = rowMeans(DF[, c(7:12)], na.rm = T)

DF$warmth_cent_r = DF$warmth_r - 4 # centering 






# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DF$warmth_cent_r - DF$warmth_cent
# there is a discrepancy between the one I computed by myself and the one provided.
# PEER REVIEW NEEDED

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++






DF$zwarmth_r = DF$warmth_cent_r / sd(DF$warmth_cent_r) # studentizing (standardizing)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DF$zwarmth_r - DF$zwarmth
# for similar issue, # PEER REVIEW NEEDED
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

DF$comp_cent_r = DF$comp_r - 4 # centering 
# DF$comp_cent_r - DF$comp_cent
DF$zcomp_r = DF$comp_cent_r / sd(DF$comp_cent_r) # studentizing (standardizing)
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
DF$zcomp_r - DF$zcomp
# for similar issue, # PEER REVIEW NEEDED
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++