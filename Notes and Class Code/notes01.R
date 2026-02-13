###  Notes 01 Companion Code from Class

## Use R to do basic calculations
1+1

3*5


## Writing Code in R

# store numbers and vectors as objects in the environment
mynumbers <- c(4, 8, 500, 15, 16, 23, 42)
mynumbers * 2
mynumbers2 <- mynumbers * 2
max(mynumbers)
max(mynumbers2)

mynums <- max(mynumbers)
mynums

Max(mynumbers)
my nums <- max(mynumbers)

# Getting help in R
help(mtcars)
?mtcars

## Data Frames and Exploring a Data Set
# Look at the first 5 rows (observations)
head(mtcars, n = 5)

# first 10 rows
head(mtcars, n = 10)

# Look at the last 10 rows (observations)
tail(mtcars, n = 10)

# Look at summaries of the dataset
summary(mtcars)
View(mtcars)


# The following summary functions come from packages. 
# Packages must be installed either in the Packages section of the Viewer pane, or
# through the following command: install.packages("skimr")
# Note: we don't keep the install.packages() functions in our scripts, because
# we don't need to re-install them every time we run the script. 

# To load packages into the system, we do need to run library() in each script
# for each function
library(dplyr)
glimpse(mtcars)

library(skimr)
skim(mtcars)


## The $ Operator to Look at Specific Variables
# Print the horsepower (hp) for all the cars in mtcars
mtcars$hp

# Find the minimum miles per gallon
min(mtcars$mpg)

cars_mpg <- mtcars$mpg
min(cars_mpg)


