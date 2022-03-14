install.packages("tidyverse") # data management
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

#Instructions
## load RIEM Library
?riem_networks
## Figure out country code 
view(riem_networks())

##"NL_ASOS" = Netherlands
## Figure out location code for city etc

view(riem_stations("NL__ASOS"))


#DATA
## Netherlands, Amsterdam  
amsterdam=riem_measures("EHAM")

## Calculating mean
amsterdamtemp=amsterdam %>%
  mutate(date=ymd_hms(valid), date=as.Date(date)) %>%
  group_by(date) %>% 
  summarize(daily_av= mean(tmpf,na.rm=TRUE)) 

## Rewriting fahrenheit to celsius
amsterdamtemp$daily_av <- fahrenheit.to.celsius(amsterdamtemp$daily_av)

## Setting the date
class(amsterdamtemp$date)
amsterdamtemp$date <- as.Date(amsterdamtemp$date)
amsterdamtemp_new <- amsterdamtemp[amsterdamtemp$date > "2021-02-28" &
                                     amsterdamtemp$date < "2022-03-02", ] 

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
                               dublintemp$date < "2022-03-02", ]

rm(dublin, dublintemp)


## Spain, Madrid
madrid=riem_measures("LEGT")

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

rm(lisbon, lisbontemp)


## Germany, Berlin
berlin=riem_measures("EDDT")

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
athenstemp_new <- athenstemp[b athenstemp$date > "2021-02-28" &
                               athenstemp$date < "2022-03-02", ] 

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

rm(riga, rigatemp)
