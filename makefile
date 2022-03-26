linear_regression: packages directory gen/temp/data_df.csv src/paper/linear_regression.R
	R --vanilla < src/paper/linear_regression.R
	
packages: install_packages.R
	R --vanilla < install_packages.R	

directory: src/data-preparation/file_directory.R packages
	R --vanilla < src/data-preparation/file_directory.R

gen/temp/data_df.csv: packages gen/temp/holiday_data_clean.csv gen/temp/europe_prices.csv gen/temp/temperature.csv src/analysis/combine_df.R 
	R --vanilla < src/analysis/combine_df.R

gen/temp/holiday_data_clean.csv: directory packages src/data-preparation/holidaydata_eu.R 
	R --vanilla < src/data-preparation/holidaydata_eu.R

gen/temp/europe_prices.csv: directory packages src/data-preparation/download_clean_airbnb.R 
	R --vanilla < src/data-preparation/download_clean_airbnb.R
	
gen/temp/temperature.csv: src/data-preparation/weather_code.R directory packages
	R --vanilla < src/data-preparation/weather_code.R

all: gen/temp/data_df.csv directory packages gen/temp/holiday_data_clean.csv gen/temp/europe_prices.csv gen/temp/temperature.csv linear_regression


