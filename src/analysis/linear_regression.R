#library for regression
library(haven)
library(dplyr)
library(car)
library(ggplot2)

#open file and transform holday data into dummy variable
regression <- read.csv("gen/temp/data_df.csv")

#inspect data test
summary(regression)

#histogram to check assumptions 
ggplot(regression, aes(avg_price))+ geom_histogram(bins=50)
ggplot(regression, aes(daily_av))+ geom_histogram(bins=50)

# Linear regression including dummy variable
regression_lm <- lm(avg_price ~ daily_av+ as.factor(is_holiday), data = regression);
summary(regression_lm)

#checking multicollinearity 
vif(regression_lm)

#check for heteroskedasticity
resi_lm4 <- regression$residuals
ggplot(regression, aes(x=avg_price, y=resi_lm4))+ geom_point()
  