linear_regression: gen/temp/data_df.csv packages file_directory
	R --vanilla < src/analysis/linear_regression.R
	
packages: install_packages.R
	R --vanilla < install_packages.R	

gen/temp/data_df.csv: gen/temp/holiday_data_clean.csv gen/temp/europe_prices.csv gen/temp/temperature.csv src/data-preparation/combine_df.R packages
	R --vanilla < src/data-preparation/combine_df.R
	
directory: src/data-preparation/file_directory.R packages
	R --vanilla < src/data-preparation/file_directory.R

gen/temp/holiday_data_clean.csv: src/data-preparation/holidaydata_eu.R directory packages
	R --vanilla < src/data-preparation/holidaydata_eu.R

gen/temp/europe_prices.csv: src/data-preparation/download_clean_airbnb.R directory packages
	R --vanilla < src/data-preparation/download_clean_airbnb.R
	
gen/temp/temperature.csv: src/data-preparation/weather_code.R directory packages
	R --vanilla < src/data-preparation/weather_code.R

all: gen/temp/data_df.csv directory packages gen/temp/holiday_data_clean.csv gen/temp/europe_prices.csv gen/temp/temperature.csv linear_regression


