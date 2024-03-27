# functions.R

cors <- function(req, res) {
  
  res$setHeader("Access-Control-Allow-Origin", "*")
  
  if (req$REQUEST_METHOD == "OPTIONS") {
    res$setHeader("Access-Control-Allow-Methods","*")
    res$setHeader("Access-Control-Allow-Headers", req$HTTP_ACCESS_CONTROL_REQUEST_HEADERS)
    res$status <- 200 
    return(list())
  } else {
    plumber::forward()
  }
}

areaAbove <- function(value, mean, sd) {
  probability <- pnorm(as.numeric(value), as.numeric(mean), as.numeric(sd), lower.tail = FALSE)
  list(probability)
}

areaBelow <- function(value, mean, sd) {
  probability <- pnorm(as.numeric(value), as.numeric(mean), as.numeric(sd), lower.tail = TRUE)
  list(probability)  
}

areaBetween <- function(value_lower, value_upper, mean, sd) {
  probability <-  pnorm(as.numeric(value_upper), as.numeric(mean), as.numeric(sd), lower.tail = TRUE) - pnorm(as.numeric(value_lower), as.numeric(mean), as.numeric(sd), lower.tail = TRUE)
  list(probability)  
}

normal <- function(mean = 0, sigma = 1) {
  repeat {
    x <- runif(1, -1, 1)
    y <- runif(1, -1, 1)
    rds <- x^2 + y^2
    if (rds != 0 && rds < 1) break
  }
  c <- sqrt(-2 * log(rds) / rds)
  return(mean + x * sigma * c)
}

gaussian <- function(x, mean = 0, sigma = 1) {
  gaussianConstant <- 1 / sqrt(2 * pi)
  x <- (x - mean) / sigma
  return(gaussianConstant * exp(-0.5 * x^2) / sigma)
}

generate_data <- function(sampleSize) {
  data <- list()
  for (i in 1:as.numeric(sampleSize)) {
    q <- normal()
    p <- gaussian(q)
    data[[i]] <- list(q = q, p = p)
  }

  return(jsonlite::toJSON(data, pretty = TRUE))
}

test <- function() {
  list("Hello world")  
}

