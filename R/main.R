library(plumber)
r <- plumb("routes.R")
r$run(port=8000)