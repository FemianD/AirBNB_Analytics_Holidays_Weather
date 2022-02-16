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

## Holiday API
Data we can use: There are no dates for cities specific. The holiday API generates lists of public holidays observances for countries, states and provinces. We can select the European countries.
There is a GitHub community on the holiday API: https://github.com/matbmeijer/HolidayAPI 
What we can do is to select the regions in which the city is located and use that holiday data. Makes it more interesting and easier. 


