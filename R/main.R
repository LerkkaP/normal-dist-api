library(plumber)
r <- plumb("C:/Users/erikpeteri/Documents/data-api/R/functions.R")
r$run(port=8000)