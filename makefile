all: movies_clean.csv
	R -- vanilla < movies_clean.csv

basics.csv ratings.csv: src/data-preparation/data-download.R
	R --vanilla < src/data-preparation/data-download.R
	
movies_clean.csv: basics.csv ratings.csv src/data-preparation/data-preparation.R
	R --vanilla < src/data-preparation/data-preparation.R



# example own!
#basics.csv ratings.csv: src/data-preparation/mydownload.R
#	R --vanilla < src/data-preparation/mydownload.R
	
# won't work yet, as download doesnt give csv files now
# only line 1 will run now, fix that later with a runall:


#structure:
# target: dependency1 dep2
	# command for if target is out of date



