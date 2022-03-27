TEMP = ../../gen/temp
ANL = ../../src/analysis

all: $(TEMP)/data_df.csv

$(TEMP)/data_df.csv: $(ANL)/combine_df.R 
	R --vanilla < $(ANL)/combine_df.R
