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
cities<-c("amsterdam", "athens", "berlin", "brussels", "dublin", "madrid",  "rome", "vienna")
urls<-c("http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-03-04/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/greece/attica/athens/2021-03-20/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/germany/be/berlin/2021-03-12/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/belgium/bru/brussels/2021-03-17/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/ireland/leinster/dublin/2021-03-07/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2021-03-07/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/italy/lazio/rome/2021-03-07/data/calendar.csv.gz", 
        "http://data.insideairbnb.com/austria/vienna/vienna/2021-03-07/data/calendar.csv.gz")

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
  europe<-rbind(europe,town)
  print(paste("cleaned and downloaded", cities[counter]))
  counter<-counter+1
}

head(europe)


#cleaning up outputs
write.csv(europe, "gen/temp/europe_prices.csv", row.names = FALSE)
print("All European AirBNB data downloaded and cleaned")
