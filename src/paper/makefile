PAPER = ../../src/paper

all: linear_regression

linear_regression: $(PAPER)/linear_regression.R
	R --vanilla < $(PAPER)/linear_regression.R

rmarkdown: $(PAPER)/linear_regression.Rmd
	Rscript -e "rmarkdown::render('$(PAPER)/linear_regression.Rmd')"
	
