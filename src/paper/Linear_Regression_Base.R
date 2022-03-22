install.packages("readr")
install.packages("dplyr")
install.packages("car")
install.packages("sjPlot")
install.packages("ggplot2")

# Open file:
setwd("E:/Surfdrive/Cursus_IRM/Datasets_R/Linear_Regression_Final_R/")

library(readr)
sat <- read_csv("sat.csv")
View(sat)

# Inspect data, create dummy variable for presence of children:
summary(sat)
sat$child <- sat$num.child>0
table(sat$child)

# Regressions:
# Simple:
sat_lm1 <- lm(overall~child, sat); summary(sat_lm1)
sat_lm2 <- lm(overall~wait, sat); summary(sat_lm2)
sat_lm3 <- lm(overall~child+wait, sat); summary(sat_lm3); 

library(dplyr)
# select numeric variables for correlation matrix
sat_num <- sat %>%
  select(num.child:overall)
cor(sat_num)

sat_lm3 <- lm(overall~child+wait, sat); summary(sat_lm3);


library(car)
vif(sat_lm3)

# Note: in models with a categorical explanatory variable, the Car package in R produces GVIF values and GVIF^1/(2*df))
# For the non-categorical explanatory variables, GVIF is the same as VIF (and you can use the rule of thumb (<10) on GVIF). 
# For the categorical variables, there seems to be some discussion.
# A simple rule would be to compute the square of GVIF^1/(2*df) and use the rule of thumb (<10) on that value.


# Interactions:
sat_lm4 <- lm(overall~wait*child, sat); summary(sat_lm4)
sat$mwait <- sat$wait-mean(sat$wait)
sat_lm5 <- lm(overall~mwait*child, sat); summary(sat_lm5)

library(sjPlot)
sat_lm4 <- lm(overall~wait*as.factor(child), sat)
plot_model(sat_lm4, type = "pred", terms = c("wait", "child"), ci.lvl=NA)
sat_lm5 <- lm(overall~mwait*as.factor(child), sat)
plot_model(sat_lm5, type = "pred", terms = c("mwait", "child"), ci.lvl=NA)

library(ggplot2)
# Histogram
ggplot(sat, aes(income))+ geom_histogram(bins=50)
ggplot(sat, aes(spend))+ geom_histogram(bins=50)

# scatterplot
ggplot(sat, aes(x=income, y=spend))+ geom_point()
ggplot(sat, aes(x=income, y=ln_spend))+ geom_point()
ggplot(sat, aes(x=ln_income, y=ln_spend, color=num.child))+ geom_point()

sat_lm6 <- lm(ln_spend~ln_income+num.child+wait,sat);summary(sat_lm6)
sat_lm7 <- lm(ln_spend~income+num.child+wait,sat);summary(sat_lm7)
sat_lm8 <- lm(ln_spend~ln_income*num.child+wait,sat);summary(sat_lm8)