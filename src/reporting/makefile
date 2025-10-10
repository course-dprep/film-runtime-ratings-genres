export RSTUDIO_PANDOC := C:/Program Files/RStudio/bin/pandoc

all: report.html report_data_exploration.html


report_data_exploration.html: report_data_exploration.Rmd
	Rscript -e "rmarkdown::render('report_data_exploration.Rmd', output_format = 'html_document')"	
#probably rename to #report_data_exploration.html/.R	
	
report.html: report.Rmd
	Rscript -e "rmarkdown::render('report.R', output_format = 'html_document')"
	

clean:
	rm -f outcome.csv report.html
#reporting+exploration makefile

#earlier mistake:
#outcome.csv: Data-exploration.R
#	R --vanilla < Data-exploration.R