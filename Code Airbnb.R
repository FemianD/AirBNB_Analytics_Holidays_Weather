#Packages
library(dplyr)
library(tidyverse)

# Read csv.gz from url
Grabremote <- function(file_url) {
  con <- gzcon(url(file_url))
  txt <- readLines(con)
  return(read.csv(textConnection(txt)))
}

#Load data
amsterdam <- Grabremote("http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-12-05/data/calendar.csv.gz")
antwerp <- Grabremote ("http://data.insideairbnb.com/belgium/vlg/antwerp/2021-12-26/data/calendar.csv.gz")
brussel <- Grabremote("http://data.insideairbnb.com/belgium/bru/brussels/2021-12-20/data/calendar.csv.gz")
Madrid <- Grabremote("http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2021-12-08/data/calendar.csv.gz")

combined_data <- bind_rows(list(amsterdam, antwerp), .id = "id") 
combined_data <- as.data.frame(combined_data)

data_datum_price <- combined_data %>%
  group_by(id, date, price) 

View(data_datum_price)