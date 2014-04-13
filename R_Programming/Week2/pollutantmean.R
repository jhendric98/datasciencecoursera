# week 2 programming assignment.
#   Jim Hendricks
#   Part 1

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  for (i in id) {
    if (exists("x")) {
      x <- rbind(x, read.csv(paste(directory,"/",sprintf("%03d", i),".csv", sep = ""), header=T))
    } else {
      x <- read.csv(paste(directory,"/",sprintf("%03d", i),".csv", sep = ""), header=T)
    } 
  }
  
  mean(x$pollutant, na.rm = T)
}

# script to submit code for grading
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")