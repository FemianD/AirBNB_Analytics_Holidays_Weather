<<<<<<< HEAD
=======
install.packages("tidyverse") 
install.packages("riem")
install.packages("plotly")
install.packages("ggplot2")
install.packages("lubridate")
install.packages("dplyr")
install.packages("weathermetrics")
install.packages("date")

>>>>>>> be4621e581639d0b2ac01d0a3c0d1bd9b7a23bd2
library(riem)
library(tidyverse)
library(lubridate)
library(plotly)
library(ggplot2)
library(dplyr)
library(weathermetrics)
library(date)

<<<<<<< HEAD
#INSTRUCTIONS
=======
>>>>>>> be4621e581639d0b2ac01d0a3c0d1bd9b7a23bd2
## load RIEM Library
?riem_networks
## Figure out country code 
view(riem_networks())

##"NL_ASOS" = Netherlands
## Figure out location code for city etc

view(riem_stations("NL__ASOS"))

<<<<<<< HEAD

#DATA
## Netherlands, Amsterdam  
amsterdam=riem_measures("EHAM")

## Calculating mean
=======
## Amsterdam Station 
amsterdam=riem_measures("EHAM")

## Calculating mean
view(amsterdam)
>>>>>>> be4621e581639d0b2ac01d0a3c0d1bd9b7a23bd2
amsterdamtemp=amsterdam %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
amsterdamtemp$daily_av <- fahrenheit.to.celsius(amsterdamtemp$daily_av)
<<<<<<< HEAD
=======
view(amsterdamtemp)
>>>>>>> be4621e581639d0b2ac01d0a3c0d1bd9b7a23bd2

## Setting the date
class(amsterdamtemp$date)
amsterdamtemp$date <- as.Date(amsterdamtemp$date)
amsterdamtemp_new <- amsterdamtemp[amsterdamtemp$date > "2021-02-28" &
                                     amsterdamtemp$date < "2022-03-02", ] 
<<<<<<< HEAD
amsterdamtemp_new <- amsterdamtemp_new %>% 
  mutate(city="amsterdam")
rm(amsterdam, amsterdamtemp)


## France, Paris
paris=riem_measures("LFPG")

## Calculating mean
paristemp=paris %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
paristemp$daily_av <- fahrenheit.to.celsius(paristemp$daily_av)

## Setting the date
class(paristemp$date)
paristemp$date <- as.Date(paristemp$date)
paristemp_new <- paristemp[paristemp$date > "2021-02-28" &
                             paristemp$date < "2022-03-02", ] 
paristemp_new<-paristemp_new %>% 
  mutate(city="paris")
rm(paris, paristemp)


## UK, London
london=riem_measures("EGLL")

## Calculating mean
londontemp=london %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
londontemp$daily_av <- fahrenheit.to.celsius(londontemp$daily_av)

## Setting the date
class(londontemp$date)
londontemp$date <- as.Date(londontemp$date)
londontemp_new <- londontemp[londontemp$date > "2021-02-28" &
                               londontemp$date < "2022-03-02", ]
londontemp_new<-londontemp_new %>% 
  mutate(city="londen")
rm(london, londontemp)


## Ireland, Dublin
dublin=riem_measures("EIDW")

## Calculating mean
dublintemp=dublin %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
dublintemp$daily_av <- fahrenheit.to.celsius(dublintemp$daily_av)

## Setting the date
class(dublintemp$date)
dublintemp$date <- as.Date(dublintemp$date)
dublintemp_new <- dublintemp[dublintemp$date > "2021-02-28" &
                               dublintemp$date < "2022-03-02", ] %>% 
  mutate(city="dublin")

rm(dublin, dublintemp)


## Spain, Madrid
madrid=riem_measures("LEMD")

## Calculating mean
madridtemp=madrid %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
madridtemp$daily_av <- fahrenheit.to.celsius(madridtemp$daily_av)

## Setting the date
class(madridtemp$date)
madridtemp$date <- as.Date(madridtemp$date)
madridtemp_new <- madridtemp[madridtemp$date > "2021-02-28" &
                               madridtemp$date < "2022-03-02", ]
madridtemp_new<-madridtemp_new %>% 
  mutate(city="madrid")

rm(madrid, madridtemp)


## Italy, Rome
rome=riem_measures("LIRF")

## Calculating mean
rometemp=rome %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
rometemp$daily_av <- fahrenheit.to.celsius(rometemp$daily_av)

## Setting the date
class(rometemp$date)
rometemp$date <- as.Date(rometemp$date)
rometemp_new <- rometemp[rometemp$date > "2021-02-28" &
                           rometemp$date < "2022-03-02", ]
rometemp_new<-rometemp_new %>% 
  mutate(city="rome")

rm(rome, rometemp)


## Austria, Vienna
vienna=riem_measures("LOWW")

## Calculating mean
viennatemp=vienna %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
viennatemp$daily_av <- fahrenheit.to.celsius(viennatemp$daily_av)

## Setting the date
class(viennatemp$date)
viennatemp$date <- as.Date(viennatemp$date)
viennatemp_new <- viennatemp[viennatemp$date > "2021-02-28" &
                               viennatemp$date < "2022-03-02", ]
viennatemp_new<-viennatemp_new %>% 
  mutate(city="vienna")
rm(vienna, viennatemp)


## Portugal, Lisbon
lisbon=riem_measures("LPPT")

## Calculating mean
lisbontemp=lisbon %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
lisbontemp$daily_av <- fahrenheit.to.celsius(lisbontemp$daily_av)

## Setting the date
class(lisbontemp$date)
lisbontemp$date <- as.Date(lisbontemp$date)
lisbontemp_new <- lisbontemp[lisbontemp$date > "2021-02-28" &
                               lisbontemp$date < "2022-03-02", ]
lisbontemp_new<-lisbontemp_new %>% 
  mutate(city="lisbon")
rm(lisbon, lisbontemp)


## Germany, Berlin
berlin=riem_measures("EDDB")

## Calculating mean
berlintemp=berlin %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
berlintemp$daily_av <- fahrenheit.to.celsius(berlintemp$daily_av)

## Setting the date
class(berlintemp$date)
berlintemp$date <- as.Date(berlintemp$date)
berlintemp_new <- berlintemp[berlintemp$date > "2021-02-28" &
                               berlintemp$date < "2022-03-02", ]
berlintemp_new<-berlintemp_new %>% 
  mutate(city="berlin")
rm(berlin, berlintemp)


## CZ, Prague
prague=riem_measures("LKPR")

## Calculating mean
praguetemp=prague %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
praguetemp$daily_av <- fahrenheit.to.celsius(praguetemp$daily_av)

## Setting the date
class(praguetemp$date)
praguetemp$date <- as.Date(praguetemp$date)
praguetemp_new <- praguetemp[praguetemp$date > "2021-02-28" &
                               praguetemp$date < "2022-03-02", ]
praguetemp_new<-praguetemp_new %>% 
  mutate(city="prague")
rm(prague, praguetemp)


## Belgium, Brussels
brussel=riem_measures("EBBR")

## Calculating mean
brusseltemp=brussel %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
brusseltemp$daily_av <- fahrenheit.to.celsius(brusseltemp$daily_av)

## Setting the date
class(brusseltemp$date)
brusseltemp$date <- as.Date(brusseltemp$date)
brusseltemp_new <- brusseltemp[brusseltemp$date > "2021-02-28" &
                                 brusseltemp$date < "2022-03-02", ] 
brusseltemp_new<-brusseltemp_new %>% 
  mutate(city="brussels")
rm(brussel, brusseltemp)


## Greece, Athens
athens=riem_measures("LGAV")

## Calculating mean
athenstemp=athens %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
athenstemp$daily_av <- fahrenheit.to.celsius(athenstemp$daily_av)

## Setting the date
class(athenstemp$date)
athenstemp$date <- as.Date(athenstemp$date)
athenstemp_new <- athenstemp[athenstemp$date > "2021-02-28" &
                               athenstemp$date < "2022-03-02", ] 
athenstemp_new<-athenstemp_new %>% 
  mutate(city="athens")
rm(athens, athenstemp)


## Denmark, Copenhagen
copenhagen=riem_measures("EKCH")

## Calculating mean
copenhagentemp=copenhagen %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
copenhagentemp$daily_av <- fahrenheit.to.celsius(copenhagentemp$daily_av)

## Setting the date
class(copenhagentemp$date)
copenhagentemp$date <- as.Date(copenhagentemp$date)
copenhagentemp_new <- copenhagentemp[copenhagentemp$date > "2021-02-28" &
                                       copenhagentemp$date < "2022-03-02", ] 
copenhagentemp_new<-copenhagentemp_new %>% 
  mutate(city="copenhagen")
rm(copenhagen, copenhagentemp)


## Norway, Oslo
oslo=riem_measures("ENGM")

## Calculating mean
oslotemp=oslo %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
oslotemp$daily_av <- fahrenheit.to.celsius(oslotemp$daily_av)

## Setting the date
class(oslotemp$date)
oslotemp$date <- as.Date(oslotemp$date)
oslotemp_new <- oslotemp[oslotemp$date > "2021-02-28" &
                           oslotemp$date < "2022-03-02", ] 
oslotemp_new<-oslotemp_new %>% 
  mutate(city="oslo")
rm(oslo, oslotemp)


## Sweden, Stockholm
stockholm=riem_measures("ESSA")

## Calculating mean
stockholmtemp=stockholm %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
stockholmtemp$daily_av <- fahrenheit.to.celsius(stockholmtemp$daily_av)

## Setting the date
class(stockholmtemp$date)
stockholmtemp$date <- as.Date(stockholmtemp$date)
stockholmtemp_new <- stockholmtemp[stockholmtemp$date > "2021-02-28" &
                                     stockholmtemp$date < "2022-03-02", ] 
stockholmtemp_new<-stockholmtemp_new %>% 
  mutate(city="stockholm")
rm(stockholm, stockholmtemp)


## Latvia, Riga
riga=riem_measures("EVRA")

## Calculating mean
rigatemp=riga %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
rigatemp$daily_av <- fahrenheit.to.celsius(rigatemp$daily_av)

## Setting the date
class(rigatemp$date)
rigatemp$date <- as.Date(rigatemp$date)
rigatemp_new <- rigatemp[rigatemp$date > "2021-02-28" &
                           rigatemp$date < "2022-03-02", ] 
rigatemp_new<-rigatemp_new %>% 
  mutate(city="riga")
rm(riga, rigatemp)

temp_df<- rbind(amsterdamtemp_new, athenstemp_new, berlintemp_new, brusseltemp_new, copenhagentemp_new, dublintemp_new, lisbontemp_new, londontemp_new, madridtemp_new, oslotemp_new, paristemp_new, praguetemp_new, rigatemp_new, rometemp_new, stockholmtemp_new, viennatemp_new )

write.csv(temp_df, "gen/temp/temperature.csv", row.names = FALSE)
=======
view(amsterdamtemp_new)
>>>>>>> be4621e581639d0b2ac01d0a3c0d1bd9b7a23bd2
