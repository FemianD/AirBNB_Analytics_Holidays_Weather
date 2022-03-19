library(dplyr)
library(haven)

europe_df<-read.csv("gen/temp/europe_prices.csv")
holiday_df<-read.csv("gen/temp/holiday_data_clean.csv")
weather_df<-read.csv("gen/temp/temperature.csv")

combined_df<-europe_df %>% 
  left_join(holiday_df, by = c("date"="date", "city"="city"), suffix = c("_europe", "_holiday"))

new_cobined_df<-combined_df %>% 
  left_join(weather_df, by = c("date"="date", "city"="city"), suffix = c("_combine", "city_weather"))

write.csv(new_cobined_df, "gen/temp/data_df.csv", row.names = FALSE)
