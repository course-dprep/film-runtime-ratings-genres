all: report.html report_data_exploration.html


report_data_exploration.html: report_data_exploration.Rmd
	Rscript -e "rmarkdown::render('report_data_exploration.Rmd', output_format = 'html_document')"	
	
report.html: report.Rmd
	Rscript -e "rmarkdown::render('report.R', output_format = 'html_document')"
	
clean:
	rm -f outcome.csv report.html
