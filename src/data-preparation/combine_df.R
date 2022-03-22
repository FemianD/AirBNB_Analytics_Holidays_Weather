library(dplyr)
library(haven)

europe_df<-read.csv("gen/temp/europe_prices.csv")
holiday_df<-read.csv("gen/temp/holiday_data_clean.csv")
weather_df<-read.csv("gen/temp/temperature.csv")

combined_df<-europe_df %>% 
  left_join(holiday_df, by = c("date"="date", "city"="city"), suffix = c("_europe", "_holiday"))

combined_df1<-combined_df %>% 
  left_join(weather_df, by = c("date"="date", "city"="city"), suffix = c("_combine", "city_weather"))

combined_df2<-combined_df1 %>% 
  mutate(is_holiday = as.numeric(!is.na(combined_df1$name)))

write.csv(combined_df2, "gen/temp/data_df.csv", row.names = FALSE)
