rm(list=ls())

# set options
options(stringsAsFactors = F)         # no automatic conversion of factors
options("scipen" = 100, "digits" = 4) # suppress math annotation
options(max.print = 1000)               # print max 1000 results

library(haven)
library(ggplot2)
library(dplyr)
library(tidyr)
library(lme4)
library(margins)
library(ggplot2)

# ==============================================================================
DF = read_dta("Documents/GitHub/replication_games_heiserman_simpson/reproduction_materials/combined data OSF.dta")

# regression for bonus expectations
reg_s2_tokens_mean <- lm(s2_tokens_mean ~ cond, data = DF, subset = (sample == 1 & study == 2))
summary(reg_s2_tokens_mean)

# mixed-effects model for bonus chance
mixed_bonus_chance <- lmer(bonus_chance ~ cond + (1 | study), data = DF, subset = (sample == 1))
summary(mixed_bonus_chance)
print(df.residual(mixed_bonus_chance)) # show degrees of freedom

# regression for s2_performance_slope
reg_s2_performance_slope <- lm(s2_performance_slope ~ cond, data = DF, subset = (sample == 1 & study == 2))
summary(reg_s2_performance_slope)

# mixed-effects model for performance_slope
mixed_performance_slope <- lmer(performance_slope ~ cond + (1 | study), data = DF, subset = (sample == 1))
summary(mixed_performance_slope)
print(df.residual(mixed_performance_slope))

# regression for work effort meta-analysis
reg_z_ln_effort <- lm(z_ln_effort ~ z_performance_slope, data = DF, subset = (sample == 1 & study == 2))
summary(reg_z_ln_effort)

# mixed-effects model for z_ln_effort
mixed_z_ln_effort <- lmer(z_ln_effort ~ z_performance_slope + (1 | study), data = DF, subset = (sample == 1 & study >= 3))
summary(mixed_z_ln_effort)
print(df.residual(mixed_z_ln_effort))

# ------------------------------------------------------------------------------
# Table 13
# regression for different studies
reg_study2 <- lm(z_performance_slope ~ factor(cond), data = DF, subset = (sample == 1 & study == 2))
reg_study3 <- lm(z_performance_slope ~ factor(cond), data = DF, subset = (sample == 1 & study == 3))
reg_study4 <- lm(z_performance_slope ~ factor(cond), data = DF, subset = (sample == 1 & study == 4))
reg_study5 <- lm(z_performance_slope ~ factor(cond), data = DF, subset = (sample == 1 & study == 5))

summary(reg_study2)
summary(reg_study3)
summary(reg_study4)
summary(reg_study5)

# mixed-effects model
mixed_model <- lmer(z_performance_slope ~ factor(cond) + (1 | study), data = DF)
summary(mixed_model)