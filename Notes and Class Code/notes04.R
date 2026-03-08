### Code for Notes 04

# Load ggplot2 package
library(ggplot2)

## The ggplot2 package intro

ggplot(data = mtcars) + 
  geom_point(aes(x = wt, y = mpg))


# Practice Question 2 - scatter plot for hp vs. mpg
ggplot(data = mtcars) + 
  geom_point(aes(x = hp, y = mpg))


# Practice Question 3 - bar graph for transmission (am)
ggplot(data = mtcars) + 
  geom_bar(aes(y = am))


## Scatterplots

# Practice problem - change color, size, shape, and transparency
ggplot(data = mtcars) + 
  geom_point(aes(x = hp, y = mpg), 
             color = "purple2",
             shape = 6, alpha = 0.8,
             size = 4)

## Histograms

# Practice problem - write code to match the graph
ggplot(data = airquality) + 
  geom_histogram(aes(x = Temp),
                 bins = 9,
                 binwidth = 5,
                 boundary = 55,
                 fill = "orange",
                 color = "white")


## Boxplots

# Practice problem - reproduce the boxplot in the notes
ggplot(data = ToothGrowth) + 
  geom_boxplot(aes(x = supp, y = len),
               color = "pink2",
               fill = "black")


## Bar Graphs

# Practice problem - replicate the graph in the notes
ggplot(data = diamonds) + 
  geom_bar(aes(x = cut, fill = cut), 
           color = "black") +
  labs(title = "This is my title",
       x = "Cut of a Diamond",
       y = "Frequency")


## Adding variables to graphs
ggplot(data = mtcars) + 
  geom_point(aes(x = wt, y = mpg,
                 shape = as.factor(am),
                 color = drat))

ggplot(data = mtcars) + 
  geom_point(aes(x = wt, y = mpg,
                 color = as.factor(am),
                 shape = as.factor(am),
                 alpha = drat))



