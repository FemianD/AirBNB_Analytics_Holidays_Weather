#library for regression
library(haven)
library(dplyr)
library(car)
library(ggplot2)
library(sjPlot)
library(sjmisc)
library(sjlabelled)

#open file
regression <- read.csv("../../gen/temp/data_df.csv")

#inspect data test
summary(regression)

#histogram to check assumption normality 
ggplot(regression, aes(avg_price))+ geom_histogram(bins=50)
ggsave("../../gen/output/histogram_avg_price_regression.pdf")

ggplot(regression, aes(daily_av))+ geom_histogram(bins=50)
ggsave("../../gen/output/histogram_daily_av_regression.pdf")

#assumptions linearity
ggplot(regression, aes(x=daily_av, y=avg_price))+ geom_point()
ggsave("../../gen/output/geompoint_daily_av_linearity.pdf")

ggplot(regression, aes(x=is_holiday, y=avg_price))+ geom_point()
ggsave("../../gen/output/geompoint_is_holiday_linearity.pdf")

# Linear regression including dummy variable
regression_lm <- lm(avg_price ~ daily_av+ as.factor(is_holiday), data = regression);
tab_model(regression_lm, file = "../../gen/output/regression.html")
summary(regression_lm)

vif(regression_lm)