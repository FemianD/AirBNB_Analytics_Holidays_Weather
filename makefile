TEMP = gen/temp
PREP = src/data-preparation
ANL = src/analysis
PAPER = src/paper

all: packages data-preparation analysis paper

packages: install_packages.R
	R --vanilla < install_packages.R
	
data-preparation: packages 
	make -C $(PREP)

analysis: data-preparation
	make -C $(ANL)

paper: analysis
	make -C $(PAPER)


	
