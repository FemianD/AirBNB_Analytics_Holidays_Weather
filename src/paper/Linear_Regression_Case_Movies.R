install.packages("haven")
install.packages("dplyr")
install.packages("car")
install.packages("ggplot2")
library(haven)
library(dplyr)
library (car)
library(ggplot2)

# Open file:
setwd("C:/IRM_R/Regression/")
movies <- read_sav("movies_case.sav")
View(movies)

# Inspect data
summary(movies)

# Histogram
ggplot(movies, aes(openinggross))+ geom_histogram(bins=50)
ggplot(movies, aes(budget))+ geom_histogram(bins=50)
ggplot(movies, aes(log_openinggross))+ geom_histogram(bins=50)
ggplot(movies, aes(log_budget))+ geom_histogram(bins=50)

# scatterplot
ggplot(movies, aes(x=log_budget, y=log_openinggross))+ geom_point()
ggplot(movies, aes(x=budget, y=openinggross))+ geom_point()

# simple regression
movies_lm0 <- lm(log_openinggross~log_budget, movies); 
summary(movies_lm0)

# rescale production budget to value in millions, take log

movies <- movies %>%
  mutate(budget_millions=budget/1000000) %>%
  mutate(log_budget_millions=log(budget_millions))

# Regression with main effects, no genre
movies_lm1 <- lm(log_openinggross~log_budget_millions+metascore+restricted, movies); 
summary(movies_lm1)
vif(movies_lm1)

# Add dummies for each genre (base= Thriller_Drama)
movies_lm2_0 <- lm(log_openinggross~log_budget_millions+metascore+restricted+Comedy+Action_Thriller_Crime+RomCom+Action_Adventure+Horror, movies);
summary(movies_lm2_0)

# Let R specify the dummies based on the categorical variable genre: same results
movies_lm2 <- lm(log_openinggross~log_budget_millions+metascore+restricted+as.factor(Genre), movies); 
summary(movies_lm2)
# Note: in models with a categorical explanatory variable, the Car package in R produces GVIF values and GVIF^1/(2*df))
# For the non-categorical explanatory variables, GVIF is the same as VIF (and you can use the rule of thumb (<10) on GVIF). 
# For the categorical variables, there seems to be some discussion.
# A simple rule would be to compute the square of GVIF^1/(2*df) and use the rule of thumb (<10) on that value.
vif(movies_lm2)

## Add interactions between log_budget and mean-centered metascore
# Calculate mean-centered metascore
movies$mcmetascore <- movies$metascore-mean(movies$metascore)
#  Run model
movies_lm3 <- lm(log_openinggross~log_budget_millions*mcmetascore+restricted+as.factor(Genre), movies); 
summary(movies_lm3)

# check results if both continuous variables are mean centered
movies$mclog_budget_millions <- movies$log_budget_millions-mean(movies$log_budget_millions)
movies_lm4 <- lm(log_openinggross~mclog_budget_millions*mcmetascore+restricted+as.factor(Genre), movies); 
summary(movies_lm4)

# check heteroskedasticity, e.g. wrt budget
resi_lm4 <- movies_lm4$residuals
ggplot(movies, aes(x=log_budget_millions, y=resi_lm4))+ geom_point()

# explore other interactions
movies_lm5 <- lm(log_openinggross~log_budget_millions+metascore+restricted*as.factor(Genre), movies); summary(movies_lm5)








