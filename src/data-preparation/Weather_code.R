library(riem)
library(tidyverse)
library(lubridate)
library(plotly)
library(ggplot2)
library(dplyr)
library(weathermetrics)
library(date)

counter<-1
temperatures<-data.frame(date=as.Date(character()),
                         daily_av=numeric(), 
                         city=character(), 
                         stringsAsFactors=FALSE)

## Figure out country code 
##"NL_ASOS" = Netherlands
## Figure out location code for city etc


cities<-c("amsterdam", "paris", "london", "dublin", "madrid", "rome", "vienna", "lisbon", "berlin", "prague", "brussels", "athens", "copenhagen", "oslo", "stockholm", "riga")
codes<-c("EHAM", "LFPG", "EGLL", "EIDW", "LEMD", "LIRF", "LOWW", "LPPT", "EDDB", "LKPR", "EBBR", "LGAV", "EKCH", "ENGM", "ESSA", "EVRA")


## France, Paris
for(code in codes){
  print(paste("downloading temperatures of", cities[counter]))
  temp<-riem_measures(code) %>% 
    mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
    group_by(date) %>% 
    summarize(daily_av= mean(tmpf,na.rm=TRUE)) 
  temp$daily_av <- fahrenheit.to.celsius(temp$daily_av)
  temp$date<-as.Date(temp$date)
  new_temp<-temp[temp$date > "2021-02-28" &
                        temp$date < "2022-04-05",]
  new_temp<-new_temp %>% 
    mutate(city=cities[counter])
  temperatures<-rbind(temperatures, new_temp)
  print(paste("downloaded temperatures of", cities[counter]))
  counter<-counter+1
}

write.csv(temperatures, "gen/temp/temperature.csv", row.names = FALSE)
print("All European temperature data downloaded and cleaned")
  
