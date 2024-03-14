library(plumber)
r <- plumb("functions.R")
r$run(port=8000)