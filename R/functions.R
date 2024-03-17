# functions.R

#' @filter cors
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

#* @post /area_above
#* @serializer unboxedJSON
#* @param value:numeric
#* @param mean:numeric
#* @param sd:numeric
areaAbove <- function(value, mean, sd) {
  probability <- pnorm(as.numeric(value), as.numeric(mean), as.numeric(sd), lower.tail = FALSE)
  list(probability)
}

#* @post /area_below
#* @serializer unboxedJSON
#* @param value:numeric
#* @param mean:numeric
#* @param sd:numeric
areaBelow <- function(value, mean, sd) {
  probability <- pnorm(as.numeric(value), as.numeric(mean), as.numeric(sd), lower.tail = TRUE)
  list(probability)  
}

#* @post /area_between
#* @serializer unboxedJSON
#* @param value_lower:numeric
#* @param value_upper:numeric
#* @param mean:numeric
#* @param sd:numeric
areaBetween <- function(value_lower, value_upper, mean, sd) {
  probability <-  pnorm(as.numeric(value_upper), as.numeric(mean), as.numeric(sd), lower.tail = TRUE) - pnorm(as.numeric(value_lower), as.numeric(mean), as.numeric(sd), lower.tail = TRUE)
  list(probability)  
}

#* @get /test
#* @serializer unboxedJSON
areaBetween <- function() {
  list("Hello world")  
}



