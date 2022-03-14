all: europe holidays weather

europe: src/data-preparation/Download_Clean_AirBNB.R
	R --vanilla < src/data-preparation/Download_Clean_AirBNB.R
	
holidays: src/data-preparation/holidaydata_EU.R
	R --vanilla < src/data-preparation/holidaydata_EU.R
	
weather: src/data-preparation/data-preparation/weather_code.R
	R --vanilla < src/data-preparation/weather_code.R

