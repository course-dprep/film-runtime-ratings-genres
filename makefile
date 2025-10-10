.PHONY: all data-preparation analysis reporting

all: analysis data-preparation reporting

data-preparation:
	make -C src/data-preparation

analysis: data-preparation
	make -C src/data-analysis
	
reporting: data-preparation analysis
	make -C src/reporting

#main makefile!
#check paths, maybe src/data-analysis/data-analysis

#now only connected to makefiles which are connected to scripts. Should it also be connected to output files?

