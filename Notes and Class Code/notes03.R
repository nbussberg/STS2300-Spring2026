### Notes 03 - Data Import and Wrangling ###

## Importing Data into R

# Check where working directory is currently set

getwd()

# Load NC Bridges dataset

library(readr)
NC_Bridges <- read_csv("NC Bridges.csv")


## Pipe Operator

library(dplyr)

auto <- filter(mtcars, am == 0)
auto <- mutate(auto, wt_lbs = 1000 * wt)
mean_wt_by_cyl <- summarize(auto, mean_wt = mean(wt_lbs), .by = cyl)
mean_wt_by_cyl <- arrange(mean_wt_by_cyl, cyl)
mean_wt_by_cyl


mean_wt_by_cyl <- arrange(summarize(mutate(filter(mtcars,
                                                  am == 0),
                                           wt_lbs = 1000 * wt),
                                    mean_wt = mean(wt_lbs),
                                    .by = cyl),
                          cyl)
mean_wt_by_cyl


mean_wt_by_cyl <- mtcars |> 
  filter(am == 0) |> 
  mutate(wt_lbs = 1000 * wt) |> 
  summarize(mean_wt = mean(wt_lbs), .by = cyl) |> 
  arrange(cyl)

mean_wt_by_cyl

## Subsetting data by rows (filter function)

# Practice problem 1 - only Alamance bridges
alam_bridges <- filter(NC_Bridges, COUNTY == "ALAMANCE")

alam_bridges2 <- NC_Bridges |> 
  filter(COUNTY == "ALAMANCE")

# check our cleaning
table(alam_bridges$COUNTY)

# Practice problem 2 - only SD and FO bridges
NCbridges_bad <- filter(NC_Bridges, 
                        STRUCTURALLYDEFICIENT == "SD",
                        FUNCTIONALLYOBSOLETE == "FO")
table(NCbridges_bad$STRUCTURALLYDEFICIENT)
table(NCbridges_bad$FUNCTIONALLYOBSOLETE)
table(NCbridges_bad$STRUCTURALLYDEFICIENT, 
      NCbridges_bad$FUNCTIONALLYOBSOLETE)


# Practice problem 3 - Alamance bridges that are either SD or FO
alam_bridges_SDFO <- alam_bridges |> 
  filter(STRUCTURALLYDEFICIENT=="SD" | 
           FUNCTIONALLYOBSOLETE=="FO")

alam_bridges_SDFO2 <- NC_Bridges |> 
  filter(COUNTY == "ALAMANCE") |> 
  filter(STRUCTURALLYDEFICIENT=="SD" | 
           FUNCTIONALLYOBSOLETE=="FO")

alam_bridges_SDFO3 <- NC_Bridges |> 
  filter(COUNTY == "ALAMANCE", 
         STRUCTURALLYDEFICIENT=="SD" | 
           FUNCTIONALLYOBSOLETE=="FO")

## Subsetting data by columns (select function)

# Practice problem - select only ROUTE, ACROSS, YEARBUILT, and SR 

alam_trimmed <- select(alam_bridges, ROUTE, ACROSS, YEARBUILT, SR)

## Create a new variable (mutate function)

# Practice problem - create variable AGE

NC_bridges_age <- mutate(NC_Bridges, 
                         AGE = 2026 - YEARBUILT)
NC_bridges_age |> 
  select(YEARBUILT, AGE) |> 
  tail(n=10)


## Long vs. Wide Data
birds_wide <- read.csv("https://raw.githubusercontent.com/nbussberg/STS2300-Spring2026/main/Data/nestbox_lands_wide.csv")
birds_long <- read.csv("https://raw.githubusercontent.com/nbussberg/STS2300-Spring2026/main/Data/nestbox_lands_long.csv")

birds_wide
head(birds_long, n = 3)
tail(birds_long, n = 3)

library(tidyr)
birds_wide |> 
  pivot_longer(cols = -Species, names_to = "Year",
               values_to = "Fledged") |> 
  head(n = 5)

birds_long |> 
  pivot_wider(names_from = Year, values_from = Fledged)







