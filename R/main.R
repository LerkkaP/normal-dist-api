library(plumber)
r <- plumb("R/functions.R")
r$run(port=8000)