library(dplyr)
library(tidyverse)
library(ggplot2)
library(haven)

Prague<-Prague %>% 
  as.numeric(price)

new_prague<-Prague %>% 
  group_by(listing_id) %>% 
  mutate(avg_price = mean(parse_number(price), na.rm=TRUE)) %>% 
  distinct(listing_id, avg_price, .keep_all = T) %>% 
  select(listing_id, avg_price) 
  