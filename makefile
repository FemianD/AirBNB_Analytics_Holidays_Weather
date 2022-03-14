all:  gen/temp/holiday_data_clean.csv gen/temp/europe_prices.csv gen/temp/temperature.csv gen/temp/data_df.csv

gen/temp/holiday_data_clean.csv: src/data-preparation/holidaydata_EU.R
	R --vanilla < src/data-preparation/holidaydata_EU.R

gen/temp/europe_prices.csv: src/data-preparation/Download_Clean_AirBNB.R
	R --vanilla < src/data-preparation/Download_Clean_AirBNB.R
	
gen/temp/temperature.csv: src/data-preparation/Weather_code.R
	R --vanilla < src/data-preparation/Weather_code.R

gen/temp/data_df.csv: gen/temp/holiday_data_clean.csv gen/temp/europe_prices.csv gen/temp/temperature.csv src/data-preparation/combine_df.R
	R --vanilla < src/data-preparation/combine_df.R