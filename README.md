<h1 align="center"> AirBNB pricing: "What the weather? What the holiday?" :shrug: :v:</h1>

<p align="center" width="100%">
    <img width="60%" src="https://user-images.githubusercontent.com/98605194/156195381-f3ef1ca4-89b7-466b-8ade-43ac2dd746bc.jpeg">
</p>

## Research Motivation 
Do you have the same problem as we do? We as students are stuck with days off in high season given by the university which leads to paying higher prices for our AirBnB's. At least, we have the feeling that the prices of AirBnB accomodations in European cities drastically increases once there is a holiday around the corner. Next to this, we are interested in researching whether weather circumstances play a role in the price changes of AirBnB. This leads to the following research question below. 

### :question: Research question :question: 

To what extent do holidays in European cities, which use and temperature in European cities effect AirBNB prices in European cities which use the euro and to what extent does the temperature influence the effect of holidays on AirBNB prices? 


## Conceptual model

<p align="center" width="100%">
    <img width="50%" src="https://media.giphy.com/media/crE4vQd8NVFP7NTBb8/giphy.gif">
</p>

## Research method 
The best research method for the previously formulated research question is multiple regression.

Multiple regression is an appropriate method of analysis when the research problem involves a single metric dependent variable (AirBNB prices). This dependant variable is related to two more independent variables (temperature, holiday period). Regression analysis is a statistical tool that should be used when the DV and IV variables are metric.  The non-metric holiday data will be transformed into a dummy variable. Under these circumstances it is possible to include the nonmetric holiday data in the analysis.

The goal of the research is to define the best way to calculate AirBNB prices based on holidays and temperature. To define the price, data is collected in 2 different stages. First the primary data from Inside AirBNB is used to calculate prices during a period. Secondly data is coupled with secondary data to analyse the findings and answer the research question.

## Research deployment :mag:
After running the analysis, a PDF file will be create to visualize the effect of holidays and temperature on prices. This is done by various plots and the output of the linear regression.

## Stakeholders :briefcase:	
- Users of airBNB can use the information gathered by answering the research to anticipate price flunctuations.
- Tourism sector can track to what extent tourism through airbnb affects prizing. 
- Goverments can track activity of rented airbnb's in the city.

## Which Inside AirBNB data do we need?
For every European city we need from Airbnb the calendar data. The dataset contains information about the price, dates and host-id. There will be archived data used, because this will be more relevant with the temperature API. The files from March 5th qualify best for answering the research question. The name of the file exactly is: calendar.csv.gz 

## Running instructions :information_source:
- Step 1: Clone the repository onto your own device. The complete pipeline is automated using makefiles. 
- Step 2: To be able to run the complete pipeline, automated using makefiles, you need to have the HolidayAPI savekey, see package instructions 2. Also you need to have installed make (for an installation guide see: [the installation guide for make](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/). 
- Step 3: You open the Command Prompt (Windows) or Terminal (Mac), move to the folder "AirBNB_Analytics_Holidays_Weather" and set this as the working directory and run "make". 
- Step 4: Rmarkdown will not be generated via make. To accomplish this, go to src/paper/linear_regression.Rmd and knit the file with knit directory as document directory

after this, the plots can be found in gen/output 
the markdown file can be found in src/paper

## Package instructions :information_source:
### 1. Packages to download 
Within R, the following packages have been used in total within various codes:
``` r
install.packages("date")
install.packages("data.table")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("haven")
install.packages("devtools")
devtools::install_github("matbmeijer/HolidayAPI")
install.packages("knitr")
install.packages("lubridate")
install.packages("plotly")
install.packages("riem")
install.packages("sjlabelled")
install.packages("sjmisc")
install.packages("sjPlot")
install.packages("tidyr")
install.packages("tidyverse")
install.packages("weathermetrics")
install.packages("tinytex")

```
### 2. Holiday API :earth_africa: 	
We used the Holiday API and loaded it into R with the help of [the GitHub page of Mat Meijer.](https://github.com/matbmeijer/HolidayAPI)
To get access to the [Holiday API](https://holidayapi.com/), you can generate a free or premium personal key by filling in your email or you could sign up through your GithHub account. The free account gives you access to holiday data of the previous year, so in this case 2021. The premium account can give you access to much more data. 

After you have installed the above packages you can generate your API save key. 
**Note**: You should **never** share your personal save key so make use of ```Sys.getenv```. 

To get an dataframe of the countries and holidays, the following steps need to be taken:
``` r
countries_df<-get_countries()
holidays_df <- get_holidays(country = , year=2021)
```
**Good to know**: The ```View()``` function breaks once the ```HolidayAPI``` package is loaded.


### 3. Weather API :sun_behind_small_cloud:	
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

### 4. Downloading AirBNB files
Pricing data from the different days throughout a period of a year are downloaded from http://insideairbnb.com/get-the-data.html. The website contains variaous types of data about the AirBNB places. 

## Main results :chart_with_upwards_trend:	
The final output obtained via regression:

<p align="center" width="100%">
    <img width="50%" src="https://user-images.githubusercontent.com/98945883/160124972-0002ce57-6516-4495-88cb-97ce8e3f037a.jpeg">
</p>

- 1.9% of the variance in the average prices of AirBNB listings is explained by this model.
- The low R-squared questions the usability of the model.
- Based on regression, it is difficult to say whether the temperature (daily av) and the holidays (is holiday) hava a direct influence on the avarage AirBNB listing prices. 
