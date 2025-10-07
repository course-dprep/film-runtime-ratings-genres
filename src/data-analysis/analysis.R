#Loading libraries
library(tidyverse)
library(dplyr)
library(readr)
library(here) 
library(MASS)
library(car)

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

#Start with exploratory analysis so without moderator 
#Convert rating_category to numeric for exploratory analyses, as these analyses require numeric DV's
movies_clean$rating_category <- factor(
  movies_clean$rating_category,
  levels = c("Poor", "Average", "Good", "Excellent"),
  ordered = TRUE
)

movies_clean$rating_num <- as.numeric(movies_clean$rating_category)

#Exploratory linear regression: simple linear model
linear_regression <- lm((rating_num ~ runtime_min), movies_clean)
sink(file.path(analysis_output_dir, "linear_regression_summary.txt"))
summary(linear_regression)
sink()

#Exploratory non-linear model: quadratic model
quadratic_model <- lm(rating_num ~ runtime_min + I(runtime_min^2), movies_clean)
sink(file.path(analysis_output_dir, "quadratic_model_summary.txt"))
summary(quadratic_model)
sink()

#Exploratory non-linear model: logarithmic model
logarithmic_model <- lm(rating_num ~ log(runtime_min), movies_clean)
sink(file.path(analysis_output_dir, "logarithmic_model_summary.txt"))
summary(logarithmic_model)
sink()

#Ordinal logistic regression would be the best model, because it doesn't assume equal spacing between categories
ordinal_log_regression <- polr(rating_category ~ runtime_min, data = movies_clean, Hess = TRUE)
sink(file.path(analysis_output_dir, "ordinal_log_regression_summary.txt"))
summary(ordinal_log_regression)
Anova(ordinal_log_regression)
sink()

#Ordinal logistic regression with moderator

#Get dummy variable names
dummy_vars <- names(movies_clean)[grepl("_dummy$", names(movies_clean))]

#Build the formula for the regression
formula_str <- paste(
  "rating_category ~ runtime_min +",
  paste(dummy_vars, collapse = " + "),
  "+",
  paste(paste0("runtime_min:", dummy_vars), collapse = " + ")
)
full_formula <- as.formula(formula_str)

#Select model data 
model_data <- dplyr::select(movies_clean, rating_category, runtime_min, all_of(dummy_vars))

#Run the actual model
ordinal_log_regression2 <- polr(full_formula, data = model_data, Hess = TRUE)
sink(file.path(analysis_output_dir, "ordinal_log_regression_with_genre_summary.txt"))
summary(ordinal_log_regression2)
Anova(ordinal_log_regression2)
sink()
