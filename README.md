# Does Runtime Matter? How Genre Moderates the Impact of Runtime on Audience Ratings

*This project investigates the relationship between a film's runtime and its average audience rating. The main purpose is to determine if an optimal runtime for viewer rating exist and, to examine how genre moderates this relationship. This research uses a large dataset from the IMDb database to empirically test common industry assumptions, such as the belief that audiences award higher ratings to shorter comedies and longer dramas.*

## Motivation

In the highly competitive field of film making, every decision is important, especially when significant financial investments are at stake. Key creative decisions, such as a film's runtime, can influence on how it is received by audiences. This is further complicated by genre, as audience expectations for a quirky comedy differ for a biopic. Audience ratings serve as a direct measure of viewer satisfaction. By analyzing the relationship between runtime, genre, and these ratings, we can move from industry intuition to data-backed insights. This knowledge provides filmmakers and producers with a strategic tool for better aligning their creative ideas with audience preferences, potentially lowering financial risk and increasing a film's success.

Based on this, this study will focus on the following research question:

**To what extent does movie runtime influence average audience ratings, and how does this relationship differ across various film genres?**

## Data

In order to investigate the relationship between a film's runtime and its average audience rating and how genre influences this relationship, two datasets from the IMDb data section were used: title.basics.tsv and title.ratings.tsv. We selected title.basics.tsv because it provides the unique identifier of the title for each movie, its runtime and its genre, which are essential for our research. Since audience rating was not included in title.basics.tsv, we also selected title.ratings.tsv. This dataset also includes the unique identifier of the title for each movie and provides the audience rating of each movie. After merging and cleaning the two datasets, the final dataset consists of approximately 93,000 observations, although this number varies daily as both datasets are continuously updated.

The variables included in the final dataset are presented in the variable operationalization table. Source variables were used only to create variables relevant to the analysis. The control variable num_votes was used to determine how reliable the rating of each movie is. The variable tconst, which was present in both datasets, was used to merge the data. This ensured that ratings were correctly matched to each movie, along with its runtime and genre, since this variable was the only one shared between both datasets. It was later renamed to movie_id for clarity. 

**Variable operationalization table:**

| variable | type | category of data | operationalization | dataset |
|----|----|----|----|----|
| runtime_min | independent variable | metric | Run time of each movie in minutes | title.basics.tsv |
| rating_category | dependent variable | categorical | Audience rating of each movie: poor, average, good, or excellent | derived from avg_rating |
| genre dummies | moderator | categorical | Indicates whether the movie is of a certain genre | derived from genre_list |
| movie_id | identifier | numeric | ID of the movie | title.basics.tsv/title.ratings.tsv |
| avg_rating | source variable | metric | Audience rating of each movie on a scale of 0 to 10 | title.ratings.tsv |
| genre_list | source variable | categorical | Genre(s) of each movie | title.basics.tsv | 
| num_votes | control variable | numeric | Total number of ratings a movie received | title.ratings.tsv |

## Method

For this research, data from the IMBD database (basic.csv and rating.csv) were merged, cleaned and filtered to include only feature-length films with at least 250 audience votes and runtimes between 30 and 250 minutes, ensuring statistical reliability. Missing values were removed, and films were categorized into four ordered rating levels. The three most frequent genres were identified, and dummy variables were created to enable comparisons across these genres. 

Moreover, boxplots and bar charts were used to illustrate the distributions of runtimes and audience ratings across genres, making patterns and outliers easy to detect. These visualizations were chosen because they offer an overview of how runtime relates to rating both within and between genres. 

Finally, a regression analysis was conducted to complement the visual exploration by quantifying the relationships and testing whether genre moderates the effect of runtime on audience rating. Using dummy variables for the three most frequent genres allowed for straightforward interpretation of genre specific effects. Together, these methods provide a clear and structured approach to examining the assumed relationship between film runtime, genre, and audience ratings. 

## Preview of Findings

The analysis demonstrates that movies with longer runtimes tend to have higher ratings across the three most common genres in the dataset. This relationship appears to be particularly strong for dramas, while comedies and romance movies also show a positive but weaker effect. These findings suggest that audiences have a preference for longer movies, although the strength of this preference varies by genre. Considering genre-specific patterns can help film producers optimize movie runtimes to better match audience expectations. 

The visualization below illustrates the relationship between runtime and ratings across genres based on the dataset of 09-10-2025. As the dataset updates daily, the exact results may vary over time. 

<img width="3000" height="1800" alt="Image" src="https://github.com/user-attachments/assets/c74c0f16-cdc2-44fd-9996-822b91db30e5" />

These findings are deployed through the modeling and visualization scripts, which generate plots and summary statistics from the most recent dataset.

## Repository Overview

\*\*Include a tree diagram that illustrates the repository structure\*

## Dependencies

To be able to run this project, the following software needs to be installed:
- **R and R studio** - Please follow these instructions to install R and R studio on your computer https://tilburgsciencehub.com/topics/Computer-Setup/software-installation/RStudio/r/
  - Install the following packages: 
    - tidyverse
    - dplyr
    - readr
    - here
    - MASS
    - car
    - patchwork
    - ggplot2
    - stringr
    - tidyr
    - knitr
      
By running the following code: **install.packages(c("tidyverse", "dplyr", "readr", "here", "MASS", "car", "patchwork", "ggplot2", "stringr", "tidyr","knitr"))**
  
- **Git** - Please follow these instructions to install Git on your computer https://tilburgsciencehub.com/topics/Automation/version-control/start-git/git/
- **Make** - Please follow these instructions to install Make on your coputer https://tilburgsciencehub.com/topics/Automation/automation-tools/Makefiles/make/

## Running Instructions

To be able to replicate this project, please follow these instructions
1) **Fork this repository:** Click the "Fork" button at the top right of the GitHub page to create your own copy of the repository.
   
2) **Clone the repository to your own computer via the command line/terminal:** Open your terminal and run the following command

   *git clone https://github.com/course-dprep/film-runtime-ratings-genres.git*
   
3) **Navigate to the project directory:**

    *cd film-runtime-ratings-genres*

5) **Run the following command in a newly created directory:**

   *make*

## About

This project is set up as part of the Master's course [Data Preparation & Workflow Management](https://dprep.hannesdatta.com/) at the [Department of Marketing](https://www.tilburguniversity.edu/about/schools/economics-and-management/organization/departments/marketing), [Tilburg University](https://www.tilburguniversity.edu/), the Netherlands.

The project is implemented by team 6:

-   Roos van den Berg ([r.vdnberg\@tilburguniversity.edu](mailto:r.vdnberg@tilburguniversity.edu))

-   Jelle van der Eng ([j.b.vdreng\@tilburguniversity.edu](mailto:j.b.vdreng@tilburguniversity.edu))

-   Dana Raats ([d.f.m.raats\@tilburguniversity.edu](mailto:j.b.vdreng@tilburguniversity.edu))

-   Renata Serrano ([r.m.serranoquiteno\@tilburguniversity.edu](mailto:r.m.serranoquiteno@tilburguniversity.edu))
