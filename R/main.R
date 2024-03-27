library(plumber)
r <- plumb("R/routes.R")
r$run(port=8000)