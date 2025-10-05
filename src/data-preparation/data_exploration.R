# data exploration unfiltered data

# Load packages
library(tidyverse)

#basics <- read_tsv("title.basics.tsv")
#ratings <- read_tsv("title.ratings.tsv")

#merge dataset
merged_unfiltered <- left_join(ratings, basics, by = "tconst")

#count the number of rows and columns
cat("Number of rows:", nrow(merged_unfiltered), "Number of columns:", ncol(merged_unfiltered))

# Basic structure & overview
glimpse(merged_unfiltered)
summary(merged_unfiltered)

# Count missing values per column
na_counts <- colSums(is.na(merged_unfiltered))
print(na_counts)

# Check runtime distribution
merged_unfiltered <- merged_unfiltered %>%
  mutate(runtimeMinutes = as.numeric(runtimeMinutes))

cat("Runtime summary: ")
summary(merged_unfiltered$runtimeMinutes)

# Check averageRating distribution
cat("Average Rating summary: ")
summary(merged_unfiltered$averageRating)


