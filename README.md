<p align="center" width="100%">
    <img width="60%" src="https://user-images.githubusercontent.com/98605194/156195381-f3ef1ca4-89b7-466b-8ade-43ac2dd746bc.jpeg">
</p>

## AirBNB pricing: "What the weather? What the holiday?" :shrug: :v:



## :question: Research question :question:

To what extent do holidays in European cities and temperature in European cities effect AirBNB prices in European cities and to what extent does the temperature influence the effect of holidays on AirBNB prices? 


## Conceptual model

<p align="center" width="100%">
    <img width="50%" src="https://media.giphy.com/media/crE4vQd8NVFP7NTBb8/giphy.gif">
</p>

## Research method 
The best research method for the previously formulated research question is multiple regression.

Multiple regression is an appropriate method of analysis when the research problem involves a single metric dependent variable (AirBNB prices). This dependant variable is related to two more independent variables (temperature, holiday period). Regression analysis is a statistical tool that should be used when the DV and IV variables are metric.  The non-metric holiday data will be transformed into a dummy variable. Under these circumstances it is possible to include the nonmetric holiday data in the analysis.

The goal of the research is to define the best way to calculate AirBNB prices based on holidays and temperature. To define the price, data is collected in 2 different stages. First the primary data from Inside AirBNB is used to calculate prices during a period. Secondly data is coupled with secondary data to analyse the findings and answer the research question.


## Research deployment :mag:
To visualize the effect of holidays and temperature on prices, there is a dashboard that shows different statistics. Within this dashboard, users can filter different countries and cities and select temperature levels so check the average airBNB price for certain cities.  

## Stakeholders :briefcase:	
- Users of airBNB can use the information gathered by answering the research to anticipate price flunctuations.
- Tourism sector can track to what extent tourism through airbnb affects prizing. 
- Goverments can track activity of rented airbnb's in the city.

## Which Inside AirBNB data do we need?
For every European city we need from Airbnb the calendar data. The dataset contains information about the price, dates and host-id. There will be archived data used, because this will be more relevant with the temperature API. The files from March 5th qualify best for answering the research question. The name of the file exactly is: calendar.csv.gz 

## Holiday API :earth_africa: 	
We used the Holiday API and loaded it into R with the help of [the GitHub page of Mat Meijer](https://github.com/matbmeijer/HolidayAPI)
To get access to the Holiday API, you can generate a free or premium personal key by filling in your email. After this, you can add your save key into R as an environment variable. The free account gives you access to holiday data of the previous year, so in this case 2021. The premium account can give you access to much more data. 

## Weather API :sun_behind_small_cloud:	
The riem package from the [GitHub page: ropensci/riem](https://github.com/ropensci/riem) was used to collect historical weather data for European capital cities. The riem package contains all of the ASOS station weather data. These stations are located at airports across the globe and collect the data via the [Iowa Environment Mesonet](https://mesonet.agron.iastate.edu/request/download.phtml). The following steps need te be taken to use the riem package:

``` r
install.packages("riem")
```
To view and search the data:
``` r
## Figure out country code 
view(riem_networks())

##"countrycode" = country
## Figure out location code for city
view(riem_stations("countrycode__citycode"))
```
When the countrycode and citycode are identified, the weatherdata can be viewed and analyzed according to the user's interests.

## Main results :chart_with_upwards_trend:	



