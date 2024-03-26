# routes.R

source("functions.R")  # Load functions from functions.R

#' @filter cors
function(req, res) {
  cors(req, res)  # Call cors function from functions.R
}

#* @post /area_above
#* @serializer unboxedJSON
#* @param value:numeric
#* @param mean:numeric
#* @param sd:numeric
function(value, mean, sd) {
  areaAbove(value, mean, sd)  # Call areaAbove function from functions.R
}

#* @post /area_below
#* @serializer unboxedJSON
#* @param value:numeric
#* @param mean:numeric
#* @param sd:numeric
function(value, mean, sd) {
  areaBelow(value, mean, sd)  # Call areaBelow function from functions.R
}

#* @post /area_between
#* @serializer unboxedJSON
#* @param value_lower:numeric
#* @param value_upper:numeric
#* @param mean:numeric
#* @param sd:numeric
function(value_lower, value_upper, mean, sd) {
  areaBetween(value_lower, value_upper, mean, sd)  # Call areaBetween function from functions.R
}

#* @post /generate_data
#* @serializer unboxedJSON
#* @param sampleSize:Integer 
function(sampleSize) {
  generate_data(sampleSize)  # Call generate_data function from functions.R
}

#* @get /test
#* @serializer unboxedJSON
function() {
  test()  # Call test function from functions.R
}