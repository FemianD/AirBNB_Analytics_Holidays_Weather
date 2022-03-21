#library for regression
library(haven)
library(dplyr)
library (car)
library(ggplot2)

#open file
regression <- read.csv("gen/temp/data_df.csv")
regression<-regression %>% 
  mutate(is_holiday = as.numeric(!is.na(regression$name)))

#inspect data test
summary(regression)

#
#histogram to check assumptions
ggplot(regression, aes(avg_price))+ geom_histogram(bins=50)
ggplot(regression, aes(daily_av))+ geom_histogram(bins=50)

#if it is non normal you can use log variant
ggplot(regression, aes(log_avg_price))+ geom_histogram(bins=50)
ggplot(regression, aes(log_daily_av))+ geom_histogram(bins=50)

# scatterplot to see link between variables checking assumptions
ggplot(regression, aes(x=log_budget, y=log_openinggross))+ geom_point()
ggplot(regression, aes(x=budget, y=openinggross))+ geom_point()

#simple regression
regression_lm <- lm(avg_price~daily_av+name, regression):
  summary(regression_lm)


#f statistic and p-value are going to be interesting

#regression with main effect
regression_lm1 <- lm(#DV~iv+iv, regression):
  summary(regression_lm1)
  vif(regression_lm1) #vif cutof 10, below 10 is good
  
  
  
  # adding dummies for HolidayAPI
  regression_lm3_0 <- lm(DV~IV+DUmmy variable, regression)
  summary(regression_lm3_0)
  
  # adding dummy variables based on R
  regression_lm4 <- lm(dv~IV+as.factor(dummy), regression):
    summary(regression_lm4)
  vif(regression_lm4)
  
  
  
  