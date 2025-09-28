#load packages
library(dplyr)
library(tidyverse)
library(readr)

#opening datasets
#uses data dowloaded in download-data.R

#basics <- read_tsv("title.basics.tsv")
#ratings <- read_tsv("title.ratings.tsv")


#tail(basics)
#tail(ratings)

#head(basics)
#head(ratings)

#summary(basics)
#summary(ratings)


#Merging datasets
merged_unfiltered <- left_join(ratings, basics, by = "tconst")

#Identifying NA's
merged_unfiltered <- merged_unfiltered %>%
  mutate(across(everything(), ~ ifelse(.x == "\\N", NA, .x)))

#filter to only keep the movies
filtered_df <- merged_unfiltered %>%
 filter(titleType == "movie")

#filter for movies that have 250 or more reviews (numVotes) 
filtered_df <- filtered_df %>%
  filter(numVotes >= 250)

# filter only for the relevant columns
filtered_df <- filtered_df %>%
  select(tconst, averageRating, runtimeMinutes, genres)

# changes runtime in minutes from a character variable to a numeric variable
str(filtered_df$runtimeMinutes)
  filtered_df$runtimeMinutes <- as.numeric(filtered_df$runtimeMinutes)

# filters for movies with a runtime between 30 and 250 minutes to remove outliers
movies_clean <- subset(filtered_df, !is.na(runtimeMinutes) & runtimeMinutes > 30 & runtimeMinutes < 250 & !is.na(genres))


write_csv(movies_clean, "movies_clean.csv")

