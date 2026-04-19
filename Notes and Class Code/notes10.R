## Notes 10 - Confidence Intervals for a Single Value

library(ggplot2)
library(dplyr)
library(infer)
library(palmerpenguins)


## Constructing confidence intervals for p

# Using a bootstrap distribution

house_of_reps <- read.csv("https://raw.githubusercontent.com/nbussberg/STS2300-Spring2026/refs/heads/main/Data/house_of_reps.csv")

set.seed(4)
HoR_samp <- sample_n(house_of_reps, size = 30)

HoR_boot <- HoR_samp |> 
  specify(formula = party ~ NULL, success = "Democratic") |> 
  generate(reps = 1000, type = "bootstrap") |> 
  calculate(stat = "prop")


# Practice: Calculate 90% CI using SE and percentile methods

# SE Method

HoR_phat <- mean(HoR_samp$party == "Democratic")

HoR_se <- HoR_boot |> 
  get_ci(level = 0.9, type = "se", point_estimate = HoR_phat)

HoR_se

# Percentile Method

HoR_perc <- HoR_boot |> 
  get_ci(level = 0.9, type = "percentile")

HoR_perc


# Theory-based Method

table(HoR_samp$party)

prop.test(x = 17, n = 17+13, conf.level = 0.90)


## Confidence intervals for µ

# calculate a point estimate

bill_xbar <- mean(penguins$bill_length_mm, na.rm = TRUE)
bill_xbar

# generate a bootstrap distribution

set.seed(4392)
bill_boot <- penguins |> 
  specify(formula = bill_length_mm ~ NULL) |> 
  generate(reps = 1000, type = "bootstrap") |> 
  calculate(stat = "mean")

visualize(bill_boot)

# Practice: calculate 95% CI using SE method or percentile method

# SE method
bill_se_ci <- bill_boot |> 
  get_ci(level = 0.95, type = "se", 
         point_estimate = bill_xbar)
bill_se_ci

# Percentile
bill_perc_ci <- bill_boot |> 
  get_ci(level = 0.95, type = "percentile")
bill_perc_ci

# Theory-based CI method

t.test(x = penguins$bill_length_mm, conf.level = 0.95)





