# data exploration unfiltered data

# Load packages
library(tidyverse)
library(readr)
library(dplyr)

basics <- read_csv("data/basics.csv")
ratings <- read_csv("data/ratings.csv")

#merge dataset
merged_unfiltered <- left_join(ratings, basics, by = "tconst")

#count the number of rows and columns
cat("Number of rows:", nrow(merged_unfiltered), "Number of columns:", ncol(merged_unfiltered))

# Basic structure & overview
glimpse(merged_unfiltered)
summary(merged_unfiltered)

# Count missing values per column
na_summary <- merged_unfiltered %>%
  summarise(across(everything(), ~sum(is.na(.))))

print(na_summary)

# Check runtime distribution
merged_unfiltered <- merged_unfiltered %>%
  mutate(runtimeMinutes = as.numeric(runtimeMinutes))

cat("Runtime summary: ")
summary(merged_unfiltered$runtimeMinutes)

# Check averageRating distribution
cat("Average Rating summary: ")
summary(merged_unfiltered$averageRating)

# Write  to a CSV file named "outcome.csv"
write_csv(merged_unfiltered, "outcome.csv")

# Print a confirmation message
cat("\n'outcome.csv' file has been successfully created in your working directory.\n")

