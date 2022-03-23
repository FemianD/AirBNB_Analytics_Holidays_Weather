#library for regression
library(haven)
library(dplyr)
library(car)
library(ggplot2)
library(sjPlot)
library(sjmisc)
library(sjlabelled)

#open file
regression <- read.csv("gen/temp/data_df.csv")

#inspect data test
summary(regression)

#histogram to check assumption normality 
ggplot(regression, aes(avg_price))+ geom_histogram(bins=50)
ggplot(regression, aes(daily_av))+ geom_histogram(bins=50)

#assumptions linearity
ggplot(regression, aes(x=daily_av, y=avg_price))+ geom_point()
ggplot(regression, aes(x=is_holiday, y=avg_price))+ geom_point()

# Linear regression including dummy variable
regression_lm <- lm(avg_price ~ daily_av+ as.factor(is_holiday), data = regression);
tab_model(regression_lm)
summary(regression_lm)

#checking multicollinearity 
vif(regression_lm)

  