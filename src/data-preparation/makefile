TEMP = ../../gen/temp
PREP = ../../src/data-preparation

all: directory $(TEMP)/holiday_data_clean.csv $(TEMP)/europe_prices.csv $(TEMP)/temperature.csv

directory: $(PREP)/file_directory.R 
	R --vanilla < $(PREP)/file_directory.R
	
$(TEMP)/holiday_data_clean.csv: directory $(PREP)/holidaydata_eu.R 
	R --vanilla < $(PREP)/holidaydata_eu.R

$(TEMP)/europe_prices.csv: directory $(PREP)/download_clean_airbnb.R 
	R --vanilla < $(PREP)/download_clean_airbnb.R
	
$(TEMP)/temperature.csv: directory $(PREP)/weather_code.R  
	R --vanilla < $(PREP)/weather_code.R	