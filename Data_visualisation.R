getwd()

movies_clean <- read.csv (movies_clean.csv)

install.packages("patchwork")
library(patchwork)
library(dplyr)
library(tidyr)
library(ggplot2)

#Top 3 genres
top3_genres <- movies_clean %>%
  count(primary_genre, sort = TRUE) %>%
  slice_head(n = 3) %>%
  pull(primary_genre)

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


                    
