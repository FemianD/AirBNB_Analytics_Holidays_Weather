# AirBNB analytics



## Research question

To what extent do holidays in European cities and temperature in European cities effect AirBNB prices in European cities and to what extent does the temperature influence the effect of holidays on AirBNB prices? 


## Conceptual model**

![image](https://user-images.githubusercontent.com/98961407/154074601-52ba977f-347f-4768-951f-4f902654b9b6.png)

## Research method 
The best research method for the previously formulated research question is the conjoint analysis.  

The goal of the research is to define the best way to calculate AirBNB prices based on holidays and temperature. To define the price, data is collected in 2 different stages. First primary data from AirBNB is used to calculate prices during a period. Secondly data is coupled with secondary data to analyse the findings. 

These findings will be analysed using a Conjoint analysis. A conjoint analysis is a multivariate dependence technique specifically developed to understand how respondents develop preferences for any type of product or service. A conjoint analysis raises the opportunity to research the effect of multiple dependent variables on the independent variables and can show the effect of a moderator on the relationship between dependent variable and independent variable. These properties makes the conjoint analysis relevant for this research question with a quasi-moderator. 

## Research deployment
To visualize the effect of holidays and temperature on prices, there is a dashboard that shows different statistics. Within this dashboard, users can filter different countries and cities and select temperature levels so check the average airBNB price. 

## Stakeholders
Users of airBNB can use the information gathered by answering the research to anticipate price flunctuations.
Tourism sector can track to what extent tourism through airbnb affects prizing. 
Goverments can track activity of rented airbnb's in the city.

## Which Inside AirBNB data do we need?
For every European city we need from Airbnb the calendar data. The dataset contains information about the price, dates and host-id. There will be archived data used, because this will be more relevant with the temperature API. The files from March 5th qualify best for answering the research question. The name of the file exactly is: calendar.csv.gz 

## Holiday API
Data we can use: There are no dates for cities specific. The holiday API generates lists of public holidays observances for countries, states and provinces. We can select the European countries.
There is a GitHub community on the holiday API: https://github.com/matbmeijer/HolidayAPI 
What we can do is to select the regions in which the city is located and use that holiday data. Makes it more interesting and easier. 


