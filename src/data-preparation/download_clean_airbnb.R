#Packages
library(dplyr)
library(tidyverse)
library(haven)

# Read csv.gz from url
grabremote <- function(file_url) {
  print(paste("Now downloading", cities[counter]))
  con <- gzcon(url(file_url))
  txt <- readLines(con)
  print(paste(cities[counter], "downloaded!"))
  return(read.csv(textConnection(txt)))
}

#Clean AirBNB dataframes
cleaning <- function(city) {
  city <- city %>%
    group_by(date) %>% 
    mutate(avg_price = mean(parse_number(price), na.rm=TRUE)) %>% 
    distinct(date, avg_price, .keep_all = T) %>% 
    select(date, avg_price) %>% 
    mutate(date = as.Date(date))
}

#creating lists
cities<-c("amsterdam", "athens", "berlin", "brussels", "dublin", "madrid",  "rome", "vienna", "paris", "lisbon")
urls<-c("https://github.com/BlauweOehoe/Download_files_Abnb/raw/main/Amsterdam_calendar.csv.gz", 
        "https://github.com/BlauweOehoe/Download_files_Abnb/raw/main/Athens_calendar.csv.gz",
        "https://github.com/BlauweOehoe/Download_files_Abnb/raw/main/Berlin_calendar.csv.gz", 
        "https://github.com/BlauweOehoe/Download_files_Abnb/raw/main/Brussels_calendar.csv.gz", 
        "https://github.com/BlauweOehoe/Download_files_Abnb/raw/main/Dublin_calendar.csv.gz", 
        "https://github.com/BlauweOehoe/Download_files_Abnb/raw/main/Madrid_calendar.csv.gz", 
        "https://github.com/BlauweOehoe/Download_files_Abnb/raw/main/Rome_calendar.csv.gz",
        "https://github.com/BlauweOehoe/Download_files_Abnb/raw/main/Vienna_calendar.csv.gz",
        "https://github.com/BlauweOehoe/Download_files_Abnb/raw/main/Paris_calendar.csv.gz",
        "https://github.com/BlauweOehoe/Download_files_Abnb/raw/main/Lisbon_calendar.csv.gz")


#setting parameter variables
counter<-1
europe <- data.frame(date=as.Date(character()),
                     avg_price=numeric(), 
                     city=character(), 
                     stringsAsFactors=FALSE) 

#loading Europe dataframe
for (town in urls){
  town<-grabremote(urls[counter])
  town<-cleaning(town) %>% 
    mutate(city = cities[counter])
  europe<-rbind(europe,town)
  print(paste("cleaned and downloaded", cities[counter]))
  counter<-counter+1
}

head(europe)


#cleaning up outputs
write.csv(europe, "gen/temp/europe_prices.csv", row.names = FALSE)
print("All European AirBNB data downloaded and cleaned")
