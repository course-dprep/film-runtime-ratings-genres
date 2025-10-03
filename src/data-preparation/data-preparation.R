#Loading libraries
library(tidyverse)
library(dplyr)
library(readr)
library(here) 

#Define a function to process and clean the movie data
process_movie_data <- function(basics_df, ratings_df, output_dir) {
  
 #Create the output directory if it doesn't exist
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
    message(paste("Output directory created at:", output_dir))
  }
  
  #Merging datasets
  merged_unfiltered <- left_join(ratings_df, basics_df, by = "tconst")
  
  #Identifying and replacing "\\N" with NA
  merged_unfiltered <- merged_unfiltered %>%
    mutate(across(everything(), ~ ifelse(.x == "\\N", NA, .x)))
  
  movies_clean <- merged_unfiltered %>%
    
    #Filter for titleType == "movie" to focus the analysis on movies.
    filter(titleType == "movie") %>%
    
    #Filter for movies with 250 or more reviews (numVotes).
    filter(numVotes >= 250) %>%
    
    #Select all columns needed for subsequent steps. `numVotes` is included here so we can rename it to `num_votes` at the end.
    select(tconst, averageRating, runtimeMinutes, genres, numVotes) %>%
    
    #Convert runtimeMinutes from character to numeric.
    mutate(runtimeMinutes = as.numeric(runtimeMinutes)) %>%
    
    #Filter out movies with NA in runtimeMinutes/genres, and filter for runtime outliers.
    filter(!is.na(runtimeMinutes) & runtimeMinutes > 30 & runtimeMinutes < 250 & !is.na(genres)) %>%
  
  #Variable Creation
    mutate(
      #Creates a categorical variable for ratings
      rating_category = factor(case_when(
        averageRating >= 8.5 ~ "Excellent",
        averageRating >= 7.0 ~ "Good",
        averageRating >= 5.0 ~ "Average",
        TRUE ~ "Poor"
      ), levels = c("Poor", "Average", "Good", "Excellent")))
      
     # Find out the 3 most common genres to keep in the dataset
  # Count genres
  genre_count <- cleaned_movies %>%
    separate_rows(genre_list, sep = ",") %>%
    mutate(genre_list = str_trim(genre_list)) %>%
    count(genre_list, sort = TRUE)
  genre_count
  
  # Only keep movies with genre Drama, Comedy, or Romance, no duplicates
  top3_genres <- genre_counts %>% 
    slice_max(n, n = 3)
  top3_genres
  cleaned_movies <- cleaned_movies %>%
    filter(str_detect(genre_list, paste(top3_genres$genre_list, collapse = "|")))
    
    #Renaming Variables
    rename(
      movie_id = tconst,
      avg_rating = averageRating,
      runtime_min = runtimeMinutes,
      genre_list = genres,
      num_votes = numVotes
    ) %>%
    
    #Select and reorder columns for a clean final output.
    select(
      movie_id,
      avg_rating,
      num_votes,
      runtime_min,
      rating_category,
      genre_list
    
    #Renaming Variables
    rename(
      movie_id = tconst,
      avg_rating = averageRating,
      runtime_min = runtimeMinutes,
      genre_list = genres,
      num_votes = numVotes
    ) %>%
    
    #Select and reorder columns for a clean final output.
    select(
      movie_id,
      avg_rating,
      num_votes,
      runtime_min,
      rating_category,
      primary_genre,
      genre_count,
      genre_list
    )
  
  #Writing the cleaned data to a CSV file
  output_file <- file.path(output_dir, "movies_clean.csv")
  write_csv(movies_clean, output_file)
  message(paste("Cleaned data saved to:", output_file))
  
  return(movies_clean)
}

#Execution

#Define the output directory for the cleaned data
output_directory <- here("gen", "data_preparation", "output")

#Call the function to process the data
cleaned_movies <- process_movie_data(
  basics_df = basics,
  ratings_df = ratings,
  output_dir = output_directory
)
