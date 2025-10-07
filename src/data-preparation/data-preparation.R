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
    
    #Select all columns needed for subsequent steps.
    select(tconst, averageRating, runtimeMinutes, genres, numVotes) %>%
    
    #Convert runtimeMinutes from character to numeric.
    mutate(runtimeMinutes = as.numeric(runtimeMinutes)) %>%
    
    #Filter out movies with NA in runtimeMinutes/genres, and filter for runtime outliers.
    filter(!is.na(runtimeMinutes) & runtimeMinutes > 30 & runtimeMinutes < 250 & !is.na(genres)) %>%
    
    #Variable Creation
    mutate(
      rating_category = factor(case_when(
        averageRating >= 8.5 ~ "Excellent",
        averageRating >= 7.0 ~ "Good",
        averageRating >= 5.0 ~ "Average",
        TRUE ~ "Poor"
      ), levels = c("Poor", "Average", "Good", "Excellent"))
    ) %>%
    
    #Renaming Variables
    rename(
      movie_id = tconst,
      avg_rating = averageRating,
      runtime_min = runtimeMinutes,
      genre_list = genres,
      num_votes = numVotes
    ) %>%
    
    #Select and reorder columns
    select(
      movie_id,
      avg_rating,
      num_votes,
      runtime_min,
      rating_category,
      genre_list
    )
  
  #Find the top 3 most common genres 
  top3_genres <- movies_clean %>%
    separate_rows(genre_list, sep = ",") %>%
    mutate(genre_list = str_trim(genre_list)) %>%
    count(genre_list, sort = TRUE) %>%
    slice_head(n = 3) %>%
    pull(genre_list)
  
  message("Today's top 3 genres: ", paste(top3_genres, collapse = ", "))
  
  #Create dummy columns for the top 3 genres
  for (g in top3_genres) {
    movies_clean[[paste0(g, "_dummy")]] <- as.integer(str_detect(movies_clean$genre_list, g))
  }
  
  
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
