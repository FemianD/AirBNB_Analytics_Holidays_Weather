#Packages
library(dplyr)
library(tidyverse)

steden<-list(c("amsterdam",
          "antwerp",
          "athens",
          "berlin",
          "brussels",
          "copenhagen",
          "dublin",
          "lisbon",
          "london",
          "madrid",
          "oslo",
          "paris",
          "prague",
          "riga",
          "rome",
          "stockholm",
          "vienna"
),
c("http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-03-04/data/calendar.csv.gz",
  "http://data.insideairbnb.com/belgium/vlg/antwerp/2021-03-26/data/calendar.csv.gz",
  "http://data.insideairbnb.com/greece/attica/athens/2021-03-20/data/calendar.csv.gz",
  "http://data.insideairbnb.com/germany/be/berlin/2021-03-12/data/calendar.csv.gz",
  "http://data.insideairbnb.com/belgium/bru/brussels/2021-03-17/data/calendar.csv.gz",
  "http://data.insideairbnb.com/denmark/hovedstaden/copenhagen/2021-03-27/data/calendar.csv.gz",
  "http://data.insideairbnb.com/ireland/leinster/dublin/2021-03-07/data/calendar.csv.gz",
  "http://data.insideairbnb.com/portugal/lisbon/lisbon/2021-03-08/data/calendar.csv.gz",
  "http://data.insideairbnb.com/united-kingdom/england/london/2021-03-05/data/calendar.csv.gz",
  "http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2021-03-07/data/calendar.csv.gz",
  "http://data.insideairbnb.com/norway/oslo/oslo/2021-03-27/data/calendar.csv.gz",
  "http://data.insideairbnb.com/france/ile-de-france/paris/2021-03-04/data/calendar.csv.gz",
  "http://data.insideairbnb.com/czech-republic/prague/prague/2021-03-13/data/calendar.csv.gz",
  "http://data.insideairbnb.com/latvia/riga/riga/2021-03-29/data/calendar.csv.gz",
  "http://data.insideairbnb.com/italy/lazio/rome/2021-03-07/data/calendar.csv.gz",
  "http://data.insideairbnb.com/sweden/stockholms-l%C3%A4n/stockholm/2021-03-27/data/calendar.csv.gz",
  "http://data.insideairbnb.com/austria/vienna/vienna/2021-03-07/data/calendar.csv.gz"
))

steden<-list(c("city"= "amsterdam", "antwerp", "athens", "berlin", "brussels", "copenhagen", "dublin", "lisbon", "london", "madrid", "oslo", "paris", "prague", "riga", "rome", "stockholm", "vienna"), c("url"= "http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-03-04/data/calendar.csv.gz", "http://data.insideairbnb.com/belgium/vlg/antwerp/2021-03-26/data/calendar.csv.gz", "http://data.insideairbnb.com/greece/attica/athens/2021-03-20/data/calendar.csv.gz", "http://data.insideairbnb.com/germany/be/berlin/2021-03-12/data/calendar.csv.gz", "http://data.insideairbnb.com/belgium/bru/brussels/2021-03-17/data/calendar.csv.gz", "http://data.insideairbnb.com/denmark/hovedstaden/copenhagen/2021-03-27/data/calendar.csv.gz", "http://data.insideairbnb.com/ireland/leinster/dublin/2021-03-07/data/calendar.csv.gz", "http://data.insideairbnb.com/portugal/lisbon/lisbon/2021-03-08/data/calendar.csv.gz", "http://data.insideairbnb.com/united-kingdom/england/london/2021-03-05/data/calendar.csv.gz", "http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2021-03-07/data/calendar.csv.gz", "http://data.insideairbnb.com/norway/oslo/oslo/2021-03-27/data/calendar.csv.gz", "http://data.insideairbnb.com/france/ile-de-france/paris/2021-03-04/data/calendar.csv.gz", "http://data.insideairbnb.com/czech-republic/prague/prague/2021-03-13/data/calendar.csv.gz", "http://data.insideairbnb.com/latvia/riga/riga/2021-03-29/data/calendar.csv.gz", "http://data.insideairbnb.com/italy/lazio/rome/2021-03-07/data/calendar.csv.gz", "http://data.insideairbnb.com/sweden/stockholms-l%C3%A4n/stockholm/2021-03-27/data/calendar.csv.gz", "http://data.insideairbnb.com/austria/vienna/vienna/2021-03-07/data/calendar.csv.gz"))

for (info in steden){
  print(info)
}


cities<-c("amsterdam", "antwerp", "athens", "berlin", "brussels", "copenhagen", "dublin", "lisbon", "london", "madrid", "oslo", "paris", "prague", "riga", "rome", "stockholm", "vienna")

urls<-c("http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-03-04/data/calendar.csv.gz", "http://data.insideairbnb.com/belgium/vlg/antwerp/2021-03-26/data/calendar.csv.gz", "http://data.insideairbnb.com/greece/attica/athens/2021-03-20/data/calendar.csv.gz", "http://data.insideairbnb.com/germany/be/berlin/2021-03-12/data/calendar.csv.gz", "http://data.insideairbnb.com/belgium/bru/brussels/2021-03-17/data/calendar.csv.gz", "http://data.insideairbnb.com/denmark/hovedstaden/copenhagen/2021-03-27/data/calendar.csv.gz", "http://data.insideairbnb.com/ireland/leinster/dublin/2021-03-07/data/calendar.csv.gz", "http://data.insideairbnb.com/portugal/lisbon/lisbon/2021-03-08/data/calendar.csv.gz", "http://data.insideairbnb.com/united-kingdom/england/london/2021-03-05/data/calendar.csv.gz", "http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2021-03-07/data/calendar.csv.gz", "http://data.insideairbnb.com/norway/oslo/oslo/2021-03-27/data/calendar.csv.gz", "http://data.insideairbnb.com/france/ile-de-france/paris/2021-03-04/data/calendar.csv.gz", "http://data.insideairbnb.com/czech-republic/prague/prague/2021-03-13/data/calendar.csv.gz", "http://data.insideairbnb.com/latvia/riga/riga/2021-03-29/data/calendar.csv.gz", "http://data.insideairbnb.com/italy/lazio/rome/2021-03-07/data/calendar.csv.gz", "http://data.insideairbnb.com/sweden/stockholms-l%C3%A4n/stockholm/2021-03-27/data/calendar.csv.gz", "http://data.insideairbnb.com/austria/vienna/vienna/2021-03-07/data/calendar.csv.gz")

counter<-1
for (town in cities){
  cities[counter]
  urls[counter]
  counter<-counter+1
}

europe<-list()

cities<-c("amsterdam", "antwerp", "athens", "berlin", "brussels", "copenhagen", "dublin", "lisbon", "london", "madrid", "oslo", "paris", "prague", "riga", "rome", "stockholm", "vienna")
cities<-c("amsterdam", "antwerp")
europe<-c("amsterdam", "antwerp")
urls<-c("http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-03-04/data/calendar.csv.gz", "http://data.insideairbnb.com/belgium/vlg/antwerp/2021-03-26/data/calendar.csv.gz", "http://data.insideairbnb.com/greece/attica/athens/2021-03-20/data/calendar.csv.gz", "http://data.insideairbnb.com/germany/be/berlin/2021-03-12/data/calendar.csv.gz", "http://data.insideairbnb.com/belgium/bru/brussels/2021-03-17/data/calendar.csv.gz", "http://data.insideairbnb.com/denmark/hovedstaden/copenhagen/2021-03-27/data/calendar.csv.gz", "http://data.insideairbnb.com/ireland/leinster/dublin/2021-03-07/data/calendar.csv.gz", "http://data.insideairbnb.com/portugal/lisbon/lisbon/2021-03-08/data/calendar.csv.gz", "http://data.insideairbnb.com/united-kingdom/england/london/2021-03-05/data/calendar.csv.gz", "http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2021-03-07/data/calendar.csv.gz", "http://data.insideairbnb.com/norway/oslo/oslo/2021-03-27/data/calendar.csv.gz", "http://data.insideairbnb.com/france/ile-de-france/paris/2021-03-04/data/calendar.csv.gz", "http://data.insideairbnb.com/czech-republic/prague/prague/2021-03-13/data/calendar.csv.gz", "http://data.insideairbnb.com/latvia/riga/riga/2021-03-29/data/calendar.csv.gz", "http://data.insideairbnb.com/italy/lazio/rome/2021-03-07/data/calendar.csv.gz", "http://data.insideairbnb.com/sweden/stockholms-l%C3%A4n/stockholm/2021-03-27/data/calendar.csv.gz", "http://data.insideairbnb.com/austria/vienna/vienna/2021-03-07/data/calendar.csv.gz")

#loading cities
counter<-1
for (town in cities){
  town<-cities[counter] %>% 
    Grabremote(urls[counter])
    Cleaning(town)
  counter<-counter+1
}

print("cleaned en downloaded",cities[counter])
print("cleaned en downloaded", cities[counter])