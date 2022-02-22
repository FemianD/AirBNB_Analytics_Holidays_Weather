#Packages
library(dplyr)
library(tidyverse)

# Read csv.gz from url
Grabremote <- function(file_url) {
  con <- gzcon(url(file_url))
  txt <- readLines(con)
  return(read.csv(textConnection(txt)))
}


