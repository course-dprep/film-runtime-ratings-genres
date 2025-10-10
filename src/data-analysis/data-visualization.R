install.packages("patchwork")
library(patchwork)
library(dplyr)
library(tidyr)
library(ggplot2)

#Define analysis output directory
analysis_output_dir <- here("gen", "data_analysis", "output")

#Create analysis output directory if it doesn't exist
if(!dir.exists(analysis_output_dir)) {
  dir.create(analysis_output_dir, recursive = TRUE)
  message(paste("Analysis output directory created at:", analysis_output_dir))
} else {
  message(paste("Analysis output directory already exists at:", analysis_output_dir))
}

#Load the cleaned dataset for modeling
movies_clean <- read_csv(here("gen", "data_preparation", "output", "movies_clean.csv"))

#Top 3 genres
top3_genres <- movies_clean %>%
  separate_rows(genre_list, sep = ",") %>%
  mutate(genre_list = str_trim(genre_list)) %>%
  count(genre_list, sort = TRUE) %>%
  slice_head(n = 3) %>%
  pull(genre_list)

#Function for scatterplots
make_scatterplot <- function(df, genre_name) {
  ggplot(filter(df, primary_genre == genre_name),
         aes(x = runtime_min, y = avg_rating)) +
    geom_point(alpha = 0.3, color = "darkblue") +
    labs(title = paste("Runtime vs Rating -", genre_name),
         x = "Runtime (minutes)", y = "Average Rating") +
    theme_minimal()
}

#Scatterplot with a loop
plots <- lapply(top3_genres, function(g) make_scatterplot(movies_clean, g))

#Combine and print 3 scatterplots
print(wrap_plots(plots, ncol = 3))

#Function for boxplots
make_boxplot <- function(df, genre_name) {
  ggplot(filter(df, primary_genre == genre_name),
         aes(x = primary_genre, y = avg_rating, fill = primary_genre)) +
    geom_boxplot() +
    labs(title = paste("Ratings Distribution -", genre_name),
         x = "Genre", y = "Average Rating") +
    theme_minimal() +
    theme(legend.position = "none")
}

#Boxplot with a loop
plots_box <- lapply(top3_genres, function(g) make_boxplot(movies_clean, g))

#Combine and print boxplots
print(wrap_plots(plots_box, ncol = 3))

#Combine scatterplots and boxplots
final_plot <- (wrap_plots(plots, ncol = 3)) /
  (wrap_plots(plots_box, ncol = 3))

print(final_plot)

ggsave(
  filename = file.path(getwd(), "final_plot.png"),
  plot = final_plot,                               
  width = 12, height = 8,                          
  dpi = 300                                        
)
  
