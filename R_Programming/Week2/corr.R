# week 2 programming assignment.
#   Jim Hendricks
#   Part 3

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files

  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations

  #get a data.frame of nobs for all files
  obs <- complete(directory)
  #filter of only files meeting threshold
  fobs <- subset(obs, nobs >= threshold)
  
  if (nrow(fobs) > 0) {
  #for each run cor and append to vector
  for (i in 1:nrow(fobs)) {
    r <- fobs[i,1]
    if (fobs[i,2] > 0) {
    y <- read.csv(paste(directory, "/", sprintf("%03d", r), ".csv", sep = ""), header=T)
    x <- cor(y[["sulfate"]],y[["nitrate"]], use = "complete.obs")
    if (exists("z")) {
      z <- c(z,x)
    } else {
      z <- x
    }
    }
  }
  } 
  #return vector
  if (exists("z")) {
    z
  } 
  
}


# script to submit code for grading
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")