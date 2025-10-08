# Does Runtime Matter? How Genre Moderates the Impact of Runtime on Audience Ratings

*This project investigates the relationship between a film's runtime and its average audience rating. The main purpose is to determine if an optimal runtime for viewer rating exist and, to examine how genre moderates this relationship. This research uses a large dataset from the IMDb database to empirically test common industry assumptions, such as the belief that audiences award higher ratings to shorter comedies and longer dramas.*

## Motivation

In the highly competitive field of film making, every decision is important, especially when significant financial investments are at stake. Key creative decisions, such as a film's runtime, can influence on how it is received by audiences. This is further complicated by genre, as audience expectations for a quirky comedy differ for a biopic. Audience ratings serve as a direct measure of viewer satisfaction. By analyzing the relationship between runtime, genre, and these ratings, we can move from industry intuition to data-backed insights. This knowledge provides filmmakers and producers with a strategic tool for better aligning their creative ideas with audience preferences, potentially lowering financial risk and increasing a film's success.

Based on this, this study will focus on the following research question:

**To what extent does movie runtime influence average audience ratings, and how does this relationship differ across various film genres?**

## Data

In order to investigate the relationship between a film's runtime and its average audience rating and how genre influences this relationship, two datasets from the IMDb data section were used: title.basics.tsv and title.ratings.tsv. We selected title.basics.tsv because it provides the unique identifier of the title for each movie, its runtime and its genre, which are essential for our research. Since audience rating was not included in title.basics.tsv, we also selected title.ratings.tsv. This dataset also includes the unique identifier of the title for each movie and provides the audience rating of each movie. After merging and cleaning the two datasets, the final dataset consists of approximately 93,000 observations, although this number varies daily as both datasets are continuously updated.

The variables we have kept in the final dataset can be found in the variable operationalization table. The descriptive variables are variables that may be of interest for our analysis but are not the main variables of our research. For example, we might want to use the number of votes to decide how reliable the rating of each movie is. The variable tconst was used to merge the two datasets. This ensures that ratings are correctly matched to each movie, along with its runtime and genre, since this variable is the only one shared between both datasets. Lastly, primaryTitle and startYear may provide useful context.

Variable operationalization table:

| variable | type | category of data | operationalization | dataset |
|----|----|----|----|----|
| runtimeMinutes | independent variable | metric | Run time of each movie in minutes | title.basics.tsv |
| averageRating | dependent variable | metric | Audience rating of each movie on a scale of 0 to 10 | title.ratings.tsv |
| genres | moderator | categorical | Genre(s) of each movie | title.basics.tsv |
| startYear | control variable | numeric | The year in which the movie came out | title.basics.tsv |

## Method

-   What methods do you use to answer your research question?
-   Provide justification for why it is the most suitable.

## Preview of Findings

-   Describe the gist of your findings (save the details for the final paper!)
-   How are the findings/end product of the project deployed?
-   Explain the relevance of these findings/product.

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
      
By running the following code: **install.packages(c("tidyverse", "dplyr", "readr", "here", "MASS", "car", "patchwork", "ggplot2"))**
  
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
