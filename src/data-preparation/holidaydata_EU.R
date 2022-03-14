#installing github
install.packages("devtools", contriburl = "https://cran.rstudio.com/bin/windows/contrib/4.1/devtools_2.4.3.zip")
devtools::install_github("matbmeijer/HolidayAPI")

library(dplyr)
library(tidyr)
library(knitr)
library(tidyverse)
library(HolidayAPI)
save_key("39b1f35e-c0ac-44f1-8cfb-3fb3435e27f2")

#get country list
countries_df<-get_countries()
summary(countries_df)
class(countries_df)

countries_df<-countries_df %>% as.data.frame()
class(countries_df)

knitr::kable(head(countries_df, 5), row.names = FALSE, caption = "Example of available countries & subdivisions", format = "markdown")

#NL Holiday (Amsterdam)
holiday_NL <- get_holidays(country="NL", year=2021)
summary(holiday_NL)
#[1] "At date 2022-03-01, 22 holidays appear in NL during the year 2021, from which 9 are public."

class(holiday_NL)
holiday_NL<-holiday_NL %>% 
  as.data.frame() %>% 
  mutate(city="amsterdam")
class(holiday_NL)

knitr::kable(head(holiday_NL, 5), row.names = FALSE, caption = "Example of Dutch holidays", format = "markdown")

#FR Holiday (Paris)
holiday_FR <- get_holidays(country="FR", year=2021)
summary(holiday_FR)
class(holiday_FR)
holiday_FR<-holiday_FR %>% 
  as.data.frame() %>% 
  mutate(city="paris")
class(holiday_FR)

knitr::kable(head(holiday_FR, 5), row.names = FALSE, caption = "Example of French holidays", format = "markdown")
class(holiday_FR)

#United Kingdom holiday (londen)
holiday_GB <- get_holidays(country="GB", year=2021)
summary(holiday_GB)
class(holiday_GB)
holiday_GB<-holiday_GB %>% 
  as.data.frame() %>% 
  mutate(city="londen")
class(holiday_GB)

knitr::kable(head(holiday_GB, 5), row.names = FALSE, caption = "Example of United Kingdom holidays", format = "markdown")

#Ireland holiday (Dublin)
holiday_IE <- get_holidays(country="IE", year=2021)
summary(holiday_IE)
class(holiday_IE)
holiday_IE<-holiday_IE %>% 
  as.data.frame() %>% 
  mutate(city="dublin")
class(holiday_IE)

knitr::kable(head(holiday_IE, 5), row.names = FALSE, caption = "Example of Ireland holidays", format = "markdown")

#Spanish holiday (Madrid)
holiday_ES <- get_holidays(country="ES", year=2021)
summary(holiday_ES)
class(holiday_ES)
holiday_ES<-holiday_ES %>% 
  as.data.frame() %>% 
  mutate(city="madrid")
class(holiday_ES)

knitr::kable(head(holiday_ES, 5), row.names = FALSE, caption = "Example of Spanish holidays", format = "markdown")

#Austria holiday (Vienna)
holiday_AT <- get_holidays(country="AT", year=2021)
summary(holiday_AT)
class(holiday_AT)
holiday_AT<-holiday_AT %>% 
  as.data.frame() %>% 
  mutate(city="vienna")
class(holiday_AT)

knitr::kable(head(holiday_AT, 5), row.names = FALSE, caption = "Example of Austria holidays", format = "markdown")

#Portugal holiday (LISBON)
holiday_PT <- get_holidays(country="PT", year=2021)
summary(holiday_PT)
class(holiday_PT)
holiday_PT<-holiday_PT %>% 
  as.data.frame() %>% 
  mutate(city="lisbon")
class(holiday_PT)

knitr::kable(head(holiday_PT, 5), row.names = FALSE, caption = "Example of Portugal holidays", format = "markdown")

#Germany holiday (Berlin)
holiday_DE <- get_holidays(country="DE", year=2021)
summary(holiday_DE)
class(holiday_DE)
holiday_DE<-holiday_DE %>% 
  as.data.frame() %>% 
  mutate(city="berlin")
class(holiday_DE)

knitr::kable(head(holiday_DE, 5), row.names = FALSE, caption = "Example of Germany holidays", format = "markdown")

#Czeck Replubic holiday (Prague)
holiday_CZ <- get_holidays(country="CZ", year=2021)
summary(holiday_CZ)
class(holiday_CZ)
holiday_CZ<-holiday_CZ %>% 
  as.data.frame() %>% 
  mutate(city = "prague")
class(holiday_CZ)

knitr::kable(head(holiday_CZ, 5), row.names = FALSE, caption = "Example of Czech holidays", format = "markdown")

#Belgium holiday (Brussels)
holiday_BE <- get_holidays(country="BE", year=2021)
summary(holiday_BE)
class(holiday_BE)
holiday_BE<-holiday_BE %>% 
  as.data.frame() %>% 
  mutate(city = "brussels")
class(holiday_BE)

knitr::kable(head(holiday_BE, 5), row.names = FALSE, caption = "Example of Belgium holidays", format = "markdown")

#Greece holiday (Athens)
holiday_GR <- get_holidays(country="GR", year=2021)
summary(holiday_GR)
class(holiday_GR)
holiday_GR<-holiday_GR %>% 
  as.data.frame() %>% 
  mutate(city = "athens")
class(holiday_GR)

knitr::kable(head(holiday_GR, 5), row.names = FALSE, caption = "Example of Greece holidays", format = "markdown")

#denmark holiday (Kopenhagen)
holiday_DK <- get_holidays(country="DK", year=2021)
summary(holiday_DK)
class(holiday_DK)
holiday_DK<-holiday_DK %>% 
  as.data.frame() %>% 
  mutate(city = "copenhagen")
class(holiday_DK)

knitr::kable(head(holiday_DK, 5), row.names = FALSE, caption = "Example of Denmark holidays", format = "markdown")

#Norway holiday (Oslo)
holiday_NO <- get_holidays(country="NO", year=2021)
summary(holiday_NO)
class(holiday_NO)
holiday_NO<-holiday_NO %>% 
  as.data.frame() %>% 
  mutate(city = "oslo")
class(holiday_NO)

knitr::kable(head(holiday_NO, 5), row.names = FALSE, caption = "Example of Norway holidays", format = "markdown")

#sweden holiday (Stockholm)
holiday_SE <- get_holidays(country="SE", year=2021)
summary(holiday_SE)
class(holiday_SE)
holiday_SE<-holiday_SE %>% 
  as.data.frame() %>% 
  mutate(city = "stockholm")
class(holiday_SE)
  

knitr::kable(head(holiday_SE, 5), row.names = FALSE, caption = "Example of Sweden holidays", format = "markdown")

#Latvia holiday (Rigia)
holiday_LV <- get_holidays(country="LV", year=2021)
summary(holiday_LV)
class(holiday_LV)
holiday_LV<-holiday_LV %>% 
  as.data.frame() %>% 
  mutate(city = "riga")
class(holiday_LV)

knitr::kable(head(holiday_LV, 5), row.names = FALSE, caption = "Example of Latvia holidays", format = "markdown")

#combining the datasets into one big one which gives an overview of all holiday per country
total_EU_holidays <- rbind(holiday_AT, holiday_BE, holiday_CZ, holiday_DE, holiday_DK, holiday_ES, holiday_FR, holiday_GB, holiday_GR, holiday_IE, holiday_LV, holiday_NL, holiday_NO, holiday_PT, holiday_SE)
class(total_EU_holidays)

knitr::kable(head(total_EU_holidays, 50), row.names = FALSE, caption = "Example of total holidays", format = "markdown")

#cleaning
Cleaning <- function(total_EU_holidays) {
  total_EU_holidays <- total_EU_holidays %>%
    group_by(date) %>%
    select(name, date, city ) %>%
    mutate(date = as.Date(date))
}

#keeping only necessary colomns
final_EU_Holiday <- total_EU_holidays %>%
  select(name, date, city)

#Write to csv 
write.csv(final_EU_Holiday, "gen/temp/holiday_data_clean.csv", row.names = FALSE)
