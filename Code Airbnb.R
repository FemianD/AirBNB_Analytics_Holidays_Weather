#Packages
library(dplyr)
library(tidyverse)

# Read csv.gz from url
Grabremote <- function(file_url) {
  print("Now downloading.")
  con <- gzcon(url(file_url))
  txt <- readLines(con)
  print("Done!")
  return(read.csv(textConnection(txt)))
}

Cleaning <- function(city) {
  name <- "city"
  city <- city %>%
  group_by(date) %>% 
  mutate(avg_price = mean(parse_number(price), na.rm=TRUE)) %>% 
  distinct(date, avg_price, .keep_all = T) %>% 
  select(date, avg_price) %>% 
  mutate(date = as.Date(date)) %>%
  mutate(city = name)
  europe <- rbind(europe, city)
}


#loading amsterdam
amsterdam <- Grabremote("http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-03-04/data/calendar.csv.gz")
amsterdam <- Cleaning(amsterdam)

View(europe)

