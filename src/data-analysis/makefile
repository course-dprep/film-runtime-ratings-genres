all: \
	linear_regression_summary.txt \
	quadratic_model_summary.txt \
	logarithmic_model_summary.txt \
	ordinal_log_regression_summary.txt \
	ordinal_log_regression_with_genre_summary.txt

linear_regression_summary.txt quadratic_model_summary.txt logarithmic_model_summary.txt ordinal_log_regression_summary.txt ordinal_log_regression_with_genre_summary.txt: data-analysis.R
	R --vanilla < data-analysis.R




#INPUT := ../gen/data_preparation/output/movies_clean.csv
#OUTPUT_DIR := ../gen/data_analysis/output
#SCRIPT := data-analysis.R

# Output files expected
#OUTPUTS := \
#	$(OUTPUT_DIR)/linear_regression_summary.txt \
#	$(OUTPUT_DIR)/quadratic_model_summary.txt \
#	$(OUTPUT_DIR)/logarithmic_model_summary.txt \
#	$(OUTPUT_DIR)/ordinal_log_regression_summary.txt \
#	$(OUTPUT_DIR)/ordinal_log_regression_with_genre_summary.txt

#.PHONY: all clean

# Main rule: build all output files
#all: $(OUTPUTS)

#makefile in data analysis