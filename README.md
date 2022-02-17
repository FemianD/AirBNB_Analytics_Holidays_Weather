# Team4

Scope:
Define a research question and prepare the airbnb data for analysis + automation.

Goals team assignment:

-> Set up a reproducible workflow on GitHub,
-> Apply the end-to-end Git workflow for versioning files, and manage your project using GitHub Issues, and
-> Build and automate a data preparation and analysis pipeline from scratch.

Deliverables

it should download the (raw) data directly from its source,
explore the raw data files with RMarkdown documents rendered as PDF or HTML files,
transform and reshape the data into the right format, and
address a research question and/or business problem using some of the building blocks (e.g., regression, apps, “deployment”).


**Research question** 

To what extent do holidays in European cities and temperature in European cities effect AirBNB prices in European cities and to what extent does the temperature influence the effect of holidays on AirBNB prices? 


**Conceptual model**

![image](https://user-images.githubusercontent.com/98961407/154074601-52ba977f-347f-4768-951f-4f902654b9b6.png)

## Research method 
The best research method for the previously formulated research question is the conjoint analysis.  

The goal of the research is to define the best way to calculate AirBNB prices based on holidays and temperature. To define the price, data is collected in 2 different stages. First primary data from AirBNB is used to calculate prices during a period. Secondly data is coupled with secondary data to analyse the findings. 

These findings will be analysed using a Conjoint analysis. A conjoint analysis is a multivariate dependence technique specifically developed to understand how respondents develop preferences for any type of product or service. A conjoint analysis raises the opportunity to research the effect of multiple dependent variables on the independent variables and can show the effect of a moderator on the relationship between dependent variable and independent variable. These properties makes the conjoint analysis relevant for this research question with a quasi-moderator. 

## Holiday API
Data we can use: There are no dates for cities specific. The holiday API generates lists of public holidays observances for countries, states and provinces. We can select the European countries.
There is a GitHub community on the holiday API: https://github.com/matbmeijer/HolidayAPI 
What we can do is to select the regions in which the city is located and use that holiday data. Makes it more interesting and easier. 


