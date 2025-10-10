#OUTPUT = ../../gen/data_analysis/output
#all: regression_outputs analysis_outputs

#regression_outputs: \
  #  $(OUTPUT)/linear_regression_summary.txt \
    #$(OUTPUT)/quadratic_model_summary.txt \
   # $(OUTPUT)/logarithmic_model_summary.txt \
  #  $(OUTPUT)/ordinal_log_regression_summary.txt \
 #   $(OUTPUT)/ordinal_log_regression_with_genre_summary.txt

#runs the regression-analysis.R file in case the regression output isn't there
#$(OUTPUT)/%.txt: regression-analysis.R \
 #   $(OUTPUT)/movies_clean.csv
#	Rscript $<

	
#analysis_outputs: $(OUTPUT)/08_crosstab_rating_category_by_dummy.csv

#$(OUTPUT)/08_crosstab_rating_category_by_dummy.csv: data-analysis.R \
 #   $(OUTPUT)/movies_clean.csv
#	Rscript $<

#clean:
#	rm -f $(OUTPUT)/*.txt
#	rm -f $(OUTPUT)/*.csv
#	rm -f $(OUTPUT)/*.png



OUTPUT = ../../gen/data_analysis/output
DATA_PREP_OUTPUT = ../../gen/data_preparation/output

all: regression_outputs analysis_outputs

regression_outputs: \
    $(OUTPUT)/linear_regression_summary.txt \
    $(OUTPUT)/quadratic_model_summary.txt \
    $(OUTPUT)/logarithmic_model_summary.txt \
    $(OUTPUT)/ordinal_log_regression_summary.txt \
    $(OUTPUT)/ordinal_log_regression_with_genre_summary.txt

# Run data-analysis.R once to generate all .txt files
$(OUTPUT)/linear_regression_summary.txt \
$(OUTPUT)/quadratic_model_summary.txt \
$(OUTPUT)/logarithmic_model_summary.txt \
$(OUTPUT)/ordinal_log_regression_summary.txt \
$(OUTPUT)/ordinal_log_regression_with_genre_summary.txt: data-analysis.R \
    $(DATA_PREP_OUTPUT)/movies_clean.csv
	Rscript data-analysis.R

analysis_outputs: $(OUTPUT)/08_crosstab_rating_category_by_dummy.csv

$(OUTPUT)/08_crosstab_rating_category_by_dummy.csv: data-analysis.R \
    $(DATA_PREP_OUTPUT)/movies_clean.csv
	Rscript data-analysis.R

clean:
	rm -f $(OUTPUT)/*.txt
	rm -f $(OUTPUT)/*.csv
	rm -f $(OUTPUT)/*.png
#makefile data-analysis

##### Version1
#all: \
#	linear_regression_summary.txt \
#	quadratic_model_summary.txt \
#	logarithmic_model_summary.txt \
#	ordinal_log_regression_summary.txt \
#	ordinal_log_regression_with_genre_summary.txt \
	

#linear_regression_summary.txt quadratic_model_summary.txt logarithmic_model_summary.txt ordinal_log_regression_summary.txt ordinal_log_regression_with_genre_summary.txt: data-analysis.R
#	R --vanilla < data-analysis.R


