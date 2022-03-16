#installing github
install.packages("devtools")
devtools::install_github("matbmeijer/HolidayAPI")
install.packages("data.table")

library(dplyr)
library(tidyr)
library(knitr)
library(tidyverse)
install.packages("HolidayAPI")
library(HolidayAPI)
library(data.table)
save_key("39b1f35e-c0ac-44f1-8cfb-3fb3435e27f2")

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
                  c('ES'))

#combining holiday data in once.
test_holiday <- get_holidays(country= countries, year=2021)
summary(test_holiday)

class(test_holiday)
test_holiday<-test_holiday %>% as.data.frame()
class(test_holiday)

knitr::kable(head(test_holiday, 25), row.names = FALSE, caption = "Example", format = "markdown")

#cleaning
Cleaning <- function(test_holiday) {
  test_holiday <- test_holiday %>%
    group_by(date) %>%
    select(name, date ) %>%
    mutate(date = as.Date(date))
}

#keeping only necessary colomns
final_test_EU_Holiday <- test_holiday %>%
  select(name, date, country)
