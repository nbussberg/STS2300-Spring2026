## Notes 02 - Data Summaries

## Quantitative vs. categorical data and representation in R

# Look at structure of data and determine variable types
str(mtcars)
is.numeric(mtcars$mpg)

library(moderndive)
str(MA_schools)


## Summarizing Quantitative Data

# Mean miles per gallon
mean(mtcars$mpg)

# Minimum horsepower
min(mtcars$hp)

# 80th percentile for weight
quantile(mtcars$wt, probs = 0.8)

# Standard deviation for displacement
sd(mtcars$disp)


# Using dplyr's summarize()
library(dplyr)
summarize(mtcars, 
          min_mpg = min(mpg),
          max_mpg = max(mpg),
          avg_hp = mean(hp),
          sd_hp = sd(hp))

# Store the above results in an object and then reference 
  # the average horsepower

car_sum <- summarize(mtcars, 
                     min_mpg = min(mpg),
                     max_mpg = max(mpg),
                     avg_hp = mean(hp),
                     sd_hp = sd(hp))

car_sum$avg_hp

avg_hp <- car_sum$avg_hp


## Summarizing Categorical Data

library(moderndive)
str(MA_schools)

# Create table of school sizes
table(MA_schools$size)

# Create proportion table of school sizes
prop.table(table(MA_schools$size))


## Summaries by Groups

summarize(MA_schools,
          count = n(),
          .by = size)

summarize(mtcars, 
          min_mpg = min(mpg),
          max_mpg = max(mpg),
          avg_hp = mean(hp),
          sd_hp = sd(hp), 
          .by = am)

summarize(mtcars,
          count = n(),
          .by = c(am, cyl))

summarize(mtcars, 
          min_mpg = min(mpg),
          max_mpg = max(mpg),
          avg_hp = mean(hp),
          sd_hp = sd(hp), 
          .by = c(am, cyl))




