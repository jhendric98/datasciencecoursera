# week 2 programming assignment.
#   Jim Hendricks
#   Part 2


complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  for (i in id) {
    if (exists("y")) {
      x <- read.csv(paste(directory, "/", sprintf("%03d", i), ".csv", sep = ""), header=T)
      x <- complete.cases(x)
      y <- rbind(y, c("id" = i,"nobs" = sum(x)))
      row.names(y)  <- 1:nrow(y) 
    } else {
      x <- read.csv(paste(directory, "/", sprintf("%03d", i), ".csv", sep = ""), header=T)
      x <- complete.cases(x)
      y <- c("id" = i,"nobs" = sum(x))
      dim(y) <- c(1,2)
      colnames(y) <- c("id","nobs") 
      row.names(y)  <- 1
    } 
  }
  y <- data.frame(y)
  y
}


# script to submit code for grading
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")