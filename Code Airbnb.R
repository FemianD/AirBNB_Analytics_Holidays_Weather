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

#Load data
amsterdam <- Grabremote("http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-03-04/data/calendar.csv.gz")
paris <- Grabremote ("http://data.insideairbnb.com/france/ile-de-france/paris/2021-03-04/data/calendar.csv.gz")

combined_data <- bind_rows(list(amsterdam, paris), .id = "id") 
combined_data <- as.data.frame(combined_data)

data_datum_price <- combined_data %>%
  group_by(id, date, price) 

View(data_datum_price)
