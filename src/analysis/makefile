TEMP = ../../gen/temp
ANL = ../../src/analysis

all: $(TEMP)/data_df.csv

$(TEMP)/data_df.csv: $(TEMP)/holiday_data_clean.csv $(TEMP)/europe_prices.csv $(TEMP)/temperature.csv $(ANL)/combine_df.R 
	R --vanilla < $(ANL)/combine_df.R
