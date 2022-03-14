install.packages("tidyverse") 
install.packages("riem")
install.packages("plotly")
install.packages("ggplot2")
install.packages("lubridate")
install.packages("dplyr")
install.packages("weathermetrics")
install.packages("date")

library(riem)
library(tidyverse)
library(lubridate)
library(plotly)
library(ggplot2)
library(dplyr)
library(weathermetrics)
library(date)

## load RIEM Library
?riem_networks
## Figure out country code 
view(riem_networks())

##"NL_ASOS" = Netherlands
## Figure out location code for city etc

view(riem_stations("NL__ASOS"))

## Amsterdam Station 
amsterdam=riem_measures("EHAM")

## Calculating mean
view(amsterdam)
amsterdamtemp=amsterdam %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
amsterdamtemp$daily_av <- fahrenheit.to.celsius(amsterdamtemp$daily_av)
view(amsterdamtemp)

## Setting the date
class(amsterdamtemp$date)
amsterdamtemp$date <- as.Date(amsterdamtemp$date)
amsterdamtemp_new <- amsterdamtemp[amsterdamtemp$date > "2021-02-28" &
                                     amsterdamtemp$date < "2022-03-02", ] 
view(amsterdamtemp_new)
