#installing github
install.packages("devtools")
devtools::install_github("matbmeijer/HolidayAPI")

library(data.table)
library(dplyr)
library(tidyr)
library(knitr)
library(tidyverse)
install.packages("HolidayAPI")
library(HolidayAPI)
library(data.table)
api_password = Sys.getenv("holidayapi")

#get country
countries_df<-get_countries()
summary(countries_df)
class(countries_df)

countries_df<-countries_df %>% as.data.frame()
class(countries_df)

knitr::kable(head(countries_df, 5), row.names = FALSE, caption = "Example of available countries & subdivisions", format = "markdown")

#make a list
countries <- list(c('AT'),
                  c('BE'),
                  c('CZ'),
                  c('DE'),
                  c('DK'),
                  c('ES'),
                  c('NL'),
                  c('FR'),
                  c('GB'),
                  c('IE'),
                  c('NO'),
                  c('GR'),
                  c('LV'),
                  c('PT'),
                  c('SE'))

#combining holiday data in once.
all_holidays = lapply(countries, get_holidays, year=2021)

final_all_holidays = rbindlist(lapply(all_holidays, function(x) data.table(x$holidays)))

class(final_all_holidays)

knitr::kable(head(final_all_holidays, 266), row.names = FALSE, caption = "Example", format = "markdown")



#cleaning
Cleaning <- function(final_all_holidays) {
  final_all_holidays <- final_all_holidays %>%
    group_by(date) %>%
    select(name, date ) %>%
    mutate(date = as.Date(date))
}

#keeping only necessary colomns
final_EU_holidays <- final_all_holidays %>%
  select(name, date, country)

#Write to csv
write.csv(final_EU_Holiday, "Holiday_data_clean.csv")
