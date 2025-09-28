library(dplyr)
library(tidyverse)
library(readr)

#merging datasets

#basics <- read_tsv("title.basics.tsv")
#ratings <- read_tsv("title.ratings.tsv")


#tail(basics)
#tail(ratings)

#head(basics)
#head(ratings)

#summary(basics)
#summary(ratings)


#cbind(basics, ratings)

#projectdf <- left_join(ratings, basics, by = "tconst")

#remove NA and write df
#merged_projectdf <- read_csv("IMDBdatasetTA.csv", na = "\\N") 
#write.csv(merged_projectdf, "Merged_IMDB_unfiltered.csv", row.names = FALSE)


merged_unfiltered <- read_csv("Merged_IMDB_unfiltered.csv")


#filter dataset using intermediate dataframe 'filtered_df'

filtered_df <- merged_unfiltered %>%
 filter(titleType == "movie")

filtered_df <- filtered_df %>%
  filter(numVotes >= 250)

str(filtered_df$runtimeMinutes)
filtered_df$runtimeMinutes <- as.numeric(filtered_df$runtimeMinutes)


# this keeps the year it was published, could remove later
filtered_df <- filtered_df %>%
  select(-originalTitle, -isAdult, -endYear, -titleType)

# make clean dataset

movies_clean <- subset(filtered_df, !is.na(runtimeMinutes) & runtimeMinutes > 30 & runtimeMinutes < 250 & !is.na(genres))


write_csv(movies_clean, "movies_clean.csv")



# unused attempts to make plots

#movies_clean %>% ggplot(aes(x = runtimeMinutes)) +
 #                    geom_histogram(binwidth = 5)
#max(filtered$runtimeMinutes)


