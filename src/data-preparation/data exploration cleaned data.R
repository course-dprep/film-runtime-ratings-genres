# data exploration cleaned data.R

# Load packages
library(dplyr)
library(tidyverse)
library(readr)

# Load cleaned dataset (from cleaning script)
movies_clean <- read_csv("movies_clean.csv")

# Quick look at the data
head(movies_clean)
str(movies_clean)
summary(movies_clean)

#Distribution of runtime
ggplot(movies_clean, aes(x = runtimeMinutes)) +
  geom_histogram(binwidth = 10, fill = "steelblue", color = "white") +
  labs(title = "Distribution of Movie Runtime", x = "Runtime (minutes)", y = "Count")

# 2. Distribution of ratings
ggplot(movies_clean, aes(x = averageRating)) +
  geom_histogram(binwidth = 0.5, fill = "blue", color = "white") +
  labs(title = "Distribution of IMDb Ratings", x = "Average Rating", y = "Count")

# Votes vs. Rating (log transformation, because of skewness)
movies_clean %>%
  ggplot(aes(x = runtimeMinutes, y = averageRating)) +
  geom_point(alpha = 0.4) +
  labs(title = "Runtime vs. Rating")

# Average rating by first-listed genres
movies_clean %>%
  mutate(primary_genre = str_split(genres, ",", simplify = TRUE)[,1]) %>%
  group_by(primary_genre) %>%
  summarize(mean_rating = mean(averageRating, na.rm = TRUE),
            n = n()) %>%
  arrange(desc(mean_rating)) %>%
  ggplot(aes(x = reorder(primary_genre, mean_rating), y = mean_rating)) +
  geom_col(fill = "orange") +
  coord_flip() +
  labs(title = "Average Rating by Primary Genre", x = "Genre", y = "Mean Rating")

#Correlation between runtime and rating
cor_test <- cor.test(movies_clean$runtimeMinutes, movies_clean$averageRating, use = "complete.obs")
print(cor_test)
