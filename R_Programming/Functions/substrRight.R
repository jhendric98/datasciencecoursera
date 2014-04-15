# easy function to extract the right n characters from a string

substrRight <- function(x, n){
  substr(x, nchar(x)-n+1, nchar(x))
}
