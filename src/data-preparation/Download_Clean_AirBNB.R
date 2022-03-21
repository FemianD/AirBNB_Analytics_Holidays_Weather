#Packages
library(dplyr)
library(tidyverse)
library(haven)

# Read csv.gz from url
Grabremote <- function(file_url) {
  print(paste("Now downloading", cities[counter]))
  con <- gzcon(url(file_url))
  txt <- readLines(con)
  print(paste(cities[counter], "downloaded!"))
  return(read.csv(textConnection(txt)))
}

#Clean AirBNB dataframes
Cleaning <- function(city) {
  city <- city %>%
    group_by(date) %>% 
    mutate(avg_price = mean(parse_number(price), na.rm=TRUE)) %>% 
    distinct(date, avg_price, .keep_all = T) %>% 
    select(date, avg_price) %>% 
    mutate(date = as.Date(date))
}

#creating lists
<<<<<<< HEAD
cities<-c("amsterdam", "athens", "berlin", "brussels", "copenhagen", "dublin", "london", "madrid", "oslo", "riga", "rome", "stockholm", "vienna")
urls<-c("http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-03-04/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/greece/attica/athens/2021-03-20/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/germany/be/berlin/2021-03-12/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/belgium/bru/brussels/2021-03-17/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/denmark/hovedstaden/copenhagen/2021-03-27/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/ireland/leinster/dublin/2021-03-07/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/united-kingdom/england/london/2021-03-05/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2021-03-07/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/norway/oslo/oslo/2021-03-27/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/latvia/riga/riga/2021-03-29/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/italy/lazio/rome/2021-03-07/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/sweden/stockholms-l%C3%A4n/stockholm/2021-03-27/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/austria/vienna/vienna/2021-03-07/data/calendar.csv.gz")
=======
cities<-c("amsterdam", "antwerp", "athens", "berlin", "brussels", "copenhagen", "dublin", "lisbon", "london", "madrid", "oslo", "paris", "prague", "riga", "rome", "stockholm", "vienna")
urls<-c("http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-03-04/data/calendar.csv.gz", "http://data.insideairbnb.com/belgium/vlg/antwerp/2021-03-26/data/calendar.csv.gz", "http://data.insideairbnb.com/greece/attica/athens/2021-03-20/data/calendar.csv.gz", "http://data.insideairbnb.com/germany/be/berlin/2021-03-12/data/calendar.csv.gz", "http://data.insideairbnb.com/belgium/bru/brussels/2021-03-17/data/calendar.csv.gz", "http://data.insideairbnb.com/denmark/hovedstaden/copenhagen/2021-03-27/data/calendar.csv.gz", "http://data.insideairbnb.com/ireland/leinster/dublin/2021-03-07/data/calendar.csv.gz", "http://data.insideairbnb.com/portugal/lisbon/lisbon/2021-03-08/data/calendar.csv.gz", "http://data.insideairbnb.com/united-kingdom/england/london/2021-03-05/data/calendar.csv.gz", "http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2021-03-07/data/calendar.csv.gz", "http://data.insideairbnb.com/norway/oslo/oslo/2021-03-27/data/calendar.csv.gz", "http://data.insideairbnb.com/france/ile-de-france/paris/2021-03-04/data/calendar.csv.gz", "http://data.insideairbnb.com/czech-republic/prague/prague/2021-03-13/data/calendar.csv.gz", "http://data.insideairbnb.com/latvia/riga/riga/2021-03-29/data/calendar.csv.gz", "http://data.insideairbnb.com/italy/lazio/rome/2021-03-07/data/calendar.csv.gz", "http://data.insideairbnb.com/sweden/stockholms-l%C3%A4n/stockholm/2021-03-27/data/calendar.csv.gz", "http://data.insideairbnb.com/austria/vienna/vienna/2021-03-07/data/calendar.csv.gz")
>>>>>>> be4621e581639d0b2ac01d0a3c0d1bd9b7a23bd2

#setting parameter variables
counter<-1
europe <- data.frame(date=as.Date(character()),
                     avg_price=numeric(), 
                     city=character(), 
                     stringsAsFactors=FALSE) 

#loading Europe dataframe
for (town in cities){
  town<-Grabremote(urls[counter])
  town<-Cleaning(town) %>% 
    mutate(city = cities[counter])
<<<<<<< HEAD
  europe<-rbind(europe,town)
  print(paste("cleaned and downloaded", cities[counter]))
  counter<-counter+1
=======
  counter<-counter+1
  europe<-rbind(europe,town)
  print(paste("cleaned and downloaded", cities[counter]))
>>>>>>> be4621e581639d0b2ac01d0a3c0d1bd9b7a23bd2
}

#cleaning up outputs
rm(cities)
rm(town)
rm(counter)
rm(urls)
rm(Cleaning)
rm(Grabremote)

<<<<<<< HEAD
write.csv(europe, "gen/temp/europe_prices.csv", row.names = FALSE)
print("All European AirBNB data downloaded and cleaned")
=======
print("All European AirBNB data downloaded and cleaned")

#Write to csv 
write.csv(europe, "AirBNB_data_clean.csv")
>>>>>>> be4621e581639d0b2ac01d0a3c0d1bd9b7a23bd2
