<<<<<<< HEAD
all: directory packages gen/temp/holiday_data_clean.csv gen/temp/europe_prices.csv gen/temp/temperature.csv gen/temp/data_df.csv 

packages: install_packages.R
	R --vanilla < install_packages.R
	
directory: src/data-preparation/file_directory.R packages
	R --vanilla < src/data-preparation/file_directory.R

gen/temp/holiday_data_clean.csv: src/data-preparation/holidaydata_EU.R directory packages
	R --vanilla < src/data-preparation/holidaydata_EU.R

gen/temp/europe_prices.csv: src/data-preparation/Download_Clean_AirBNB.R directory packages
	R --vanilla < src/data-preparation/Download_Clean_AirBNB.R
	
gen/temp/temperature.csv: src/data-preparation/Weather_code.R directory packages
	R --vanilla < src/data-preparation/Weather_code.R

gen/temp/data_df.csv: gen/temp/holiday_data_clean.csv gen/temp/europe_prices.csv gen/temp/temperature.csv src/data-preparation/combine_df.R directory packages
	R --vanilla < src/data-preparation/combine_df.R
=======
all: europe holidays weather

europe: src/data-preparation/Download_Clean_AirBNB.R
	R --vanilla < src/data-preparation/Download_Clean_AirBNB.R
	
holidays: src/data-preparation/holidaydata_EU.R
	R --vanilla < src/data-preparation/holidaydata_EU.R
	
weather: src/data-preparation/data-preparation/weather_code.R
	R --vanilla < src/data-preparation/weather_code.R

>>>>>>> be4621e581639d0b2ac01d0a3c0d1bd9b7a23bd2
