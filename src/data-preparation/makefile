all: movies_clean.csv outcome.csv

basics.csv ratings.csv: data-download.R
	R --vanilla < data-download.R
	
outcome.csv: data-exploration.R
	R --vanilla < data-exploration.R
	
movies_clean.csv: basics.csv ratings.csv data-preparation.R 
	R --vanilla < data-preparation.R

#makefile data-preparation