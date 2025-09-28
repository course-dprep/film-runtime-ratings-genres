# Load necessary packages
library(tidyverse)
library(dplyr)
library(readr)

# Create a "data" directory if it doesn't already exist
if(!dir.exists("data")){dir.create("data")}

# This function checks for a local copy of a data file. If not found, it downloads the file before reading it into a data frame.
get_imdb_data <- function(url, file_name) {
  
  local_path <- file.path("data", file_name)
  
  # Download the file only if it doesn't already exist locally.
  if (!file.exists(local_path)) {
    download.file(url = url, destfile = local_path, mode = "wb")
  }
  
  # Read the local zipped TSV file and return it as a tibble.
  read_tsv(local_path)
}

# Download Steps 

# URLs for the IMDb datasets
url_basics <- "https://datasets.imdbws.com/title.basics.tsv.gz"
url_ratings <- "https://datasets.imdbws.com/title.ratings.tsv.gz"

# Load the 'title.basics' and 'title.ratings' data using the custom function.
basics <- get_imdb_data(url_basics, "title.basics.tsv.gz")
ratings <- get_imdb_data(url_ratings, "title.ratings.tsv.gz")

# (Optional) View the first few rows of the data frames
# head(basics)
# head(ratings)
