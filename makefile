all: analysis data-preparation

data-preparation:
	make -C src/data-preparation

analysis: 
	make -C src/data-analysis
	

#main makefile!
#check paths, maybe src/data-analysis/data-analysis

#now only connected to makefiles which are connected to scripts. Should it also be connected to output files?

